# Operational Manual – CloudNova PostgreSQL Stack

**Audience:** Client IT team
**Stack:** VMware Workstation, Ubuntu Server, Docker Engine, Docker Compose, PostgreSQL 16, pgAdmin 4, UFW, cron

---

## 1. Architecture
```
Host laptop (browser)
   └─ Hypervisor (Type 2, VMware Workstation, NAT network)
        └─ Ubuntu Server VM (cn-server)
             ├─ UFW (default deny; allow 22/tcp, 8080/tcp)
             └─ Docker network "backend"
                  ├─ cn_pgadmin  (host 8080 -> container 80)
                  └─ cn_postgres (internal 5432, volume: pgdata)
Cron (02:00) ──> automation-script.sh ──> /opt/backups/*.sql.gz
```
See `architecture-diagram.png`.

## 2. Prerequisites
- VMware Workstation, Ubuntu Server 24.04 LTS ISO
- VM: 2 vCPU, 2–4 GB RAM, 25 GB disk, NAT network adapter
- A user with `sudo`, OpenSSH server installed

## 3. Deployment

### 3.1 Install Docker and Compose
```bash
sudo apt update
sudo apt install -y docker.io docker-compose-v2
sudo systemctl enable --now docker
sudo usermod -aG docker $USER
docker --version && docker compose version
```

### 3.2 Configure secrets
```bash
cp .env.example .env
nano .env
chmod 600 .env
```
Never commit `.env` to Git.

### 3.3 Start the stack
```bash
docker compose up -d
docker compose ps
```
pgAdmin needs 30–60 seconds on first start.

### 3.4 Verify
```bash
curl -I http://localhost:8080
docker exec -it cn_postgres psql -U cloudnova -d cloudnova_db -c "\l"
```
In the host browser, open `http://<vm-ip>:8080`, log in, then register a server with Host `db`, Port `5432` and the PostgreSQL credentials.

## 4. Security Hardening

### 4.1 Firewall (UFW)
Allow SSH **before** enabling, to avoid lockout.
```bash
sudo apt install -y ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp
sudo ufw allow 8080/tcp
sudo ufw enable
sudo ufw status verbose
```

### 4.2 Design decisions
| Control | Reason |
|---------|--------|
| Default deny incoming | Only approved traffic is reachable |
| Port 5432 not published | Docker edits iptables directly and can bypass UFW, so the DB stays on the internal network |
| `.env` with `chmod 600` | Credentials readable only by the owner |
| Healthcheck + `depends_on` | pgAdmin starts only after PostgreSQL is ready |
| `restart: unless-stopped` | Containers recover after a crash or reboot |

### 4.3 Recommended extras
- Use SSH keys only and disable password login.
- Restrict 8080 to trusted IPs: `sudo ufw allow from <ip> to any port 8080 proto tcp`.
- Add a TLS reverse proxy (Nginx/Caddy) in production.

## 5. Automation and Backups

### 5.1 Script
`automation-script.sh` runs `pg_dump`, compresses the output into `/opt/backups`, logs to `/var/log/cn_backup.log`, and deletes backups older than 7 days.
```bash
chmod +x automation-script.sh
sudo ./automation-script.sh
ls -lh /opt/backups
```

### 5.2 Schedule with cron
```bash
sudo apt install -y cron
sudo systemctl enable --now cron
sudo crontab -e
```
Add (daily at 02:00):
```
0 2 * * * /home/<user>/Laboratory-10-Enterprise-Cloud-Architect/automation-script.sh
```
Verify with `sudo crontab -l` and `cat /var/log/cn_backup.log`.

## 6. Maintenance

| Task | Command |
|------|---------|
| Container status | `docker compose ps` |
| Live logs | `docker compose logs -f` |
| Resource usage | `docker stats --no-stream` |
| Update images | `docker compose pull && docker compose up -d` |
| Stop stack (data kept) | `docker compose down` |
| Firewall status | `sudo ufw status verbose` |
| Disk usage | `df -h && docker system df` |

> **Warning:** `docker compose down -v` deletes the volumes and all data.

## 7. Disaster Recovery

### 7.1 Restore from backup
```bash
gunzip -c /opt/backups/<file>.sql.gz | docker exec -i cn_postgres sh -c 'psql -U "$POSTGRES_USER" "$POSTGRES_DB"'
```

### 7.2 Persistence test
```bash
docker exec -it cn_postgres psql -U cloudnova -d cloudnova_db -c "CREATE TABLE IF NOT EXISTS clients(id SERIAL PRIMARY KEY, name TEXT); INSERT INTO clients(name) VALUES ('test');"
sudo reboot
# after the VM comes back:
docker compose ps
docker exec -it cn_postgres psql -U cloudnova -d cloudnova_db -c "SELECT * FROM clients;"
```
The data must still be present.

## 8. Troubleshooting

| Symptom | Check |
|---------|-------|
| `docker: unknown command: docker compose` | `sudo apt install -y docker-compose-v2` |
| 502 / page not loading | `docker compose ps`, `docker compose logs --tail=30 pgadmin`, `curl -I http://localhost:8080` |
| Cannot reach the VM from the host | `ip -4 a` in the VM, confirm the VMware adapter is NAT, check `ufw status` |
| pgAdmin cannot connect to DB | Host must be `db`, not `localhost`; verify `.env` credentials |
| Backup file is empty | Is `cn_postgres` running? Check `/var/log/cn_backup.log` |
| Cron does not run | `systemctl status cron`, use absolute paths |
| Locked out over SSH | Use the VMware console and run `sudo ufw allow 22/tcp` |
