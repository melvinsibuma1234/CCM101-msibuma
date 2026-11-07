# Laboratory 10 – Enterprise Cloud Architect

**Course:** CCM101 – Cloud Computing, University of Eastern Pangasinan
**Project:** CloudNova private cloud – PostgreSQL + pgAdmin on Docker (VMware + Ubuntu Server)

## Overview
A secure, automated, multi-tier containerized stack for CloudNova Technologies.

| Tier | Component | Purpose |
|------|-----------|---------|
| Web / Admin | pgAdmin 4 (`cn_pgadmin`) | Browser UI for the database, published on host port 8080 |
| Data | PostgreSQL 16 (`cn_postgres`) | Database, internal only, never published to the host |
| Storage | Docker volumes `pgdata`, `pgadmin_data` | Persistent database and pgAdmin settings |
| Security | UFW | Default deny; only 22/tcp and 8080/tcp allowed |
| Automation | `automation-script.sh` + cron | Daily compressed backup with 7-day rotation |

## Repository Contents
| File | Description |
|------|-------------|
| `architecture-diagram.png` | Network topology and architecture diagram |
| `docker-compose.yml` | Infrastructure as Code for the stack |
| `automation-script.sh` | Backup and rotation script |
| `.env.example` | Template for credentials (the real `.env` is not committed) |
| `operational-manual.md` | Deploy, secure, maintain and recover the stack |
| `final-reflection.md` | Reflection on Missions 1 to 10 |

## Quick Start
```bash
cp .env.example .env    # then edit the credentials
chmod 600 .env
docker compose up -d
docker compose ps
```
Open `http://<vm-ip>:8080` and log in with the pgAdmin email and password from `.env`. Register a server with Host `db`, Port `5432`, and the PostgreSQL credentials from `.env`.

## Requirements Checklist
- [x] Architecture diagram (host, hypervisor, Linux VM, firewall, containers)
- [x] Ubuntu Server VM on VMware (NAT), reachable from the host browser
- [x] Docker + Docker Compose with a complete `docker-compose.yml`
- [x] Two linked containers (pgAdmin + PostgreSQL)
- [x] Persistent volume for the database
- [x] UFW enabled, default deny, only required ports allowed
- [x] Executable Bash script scheduled with cron
- [x] Operational manual and final reflection

> **Disclosure:** AI assistance (Claude) was used to draft the structure of this documentation and the initial commands. Content was reviewed, tested and revised by the author.
