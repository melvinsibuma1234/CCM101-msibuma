# Final Reflection – From Junior Trainee to Enterprise Cloud Architect

## The Journey

**Missions 1–2: Foundations.** I started with the basics of the cloud and Linux: investigating a server from the terminal, using Git, and publishing my work to a GitHub portfolio. The hardest part was Git authentication and remote URL errors. I kept hitting them across different environments, and I learned to check `git remote -v` first and to use a Personal Access Token instead of a password.

**Missions 3–6: Building skills.** I built up my Linux command-line skills (files, permissions, users, processes and networking) and learned core cloud concepts like virtualization and containers. Each mission taught me to read official documentation and error messages instead of guessing.

**Mission 7: Cloud Operations Engineer.** I learned to baseline a host, run an Nginx container on port 8080, and observe it with `docker logs` and `docker stats`. This was the first time I saw that containers are lightweight, disposable and easy to monitor.

**Mission 8: Cloud Security Engineer.** I configured UFW with a default-deny policy and allowed only the ports I needed. I learned that every open port is attack surface, and that the safest rule is to allow only what is necessary.

**Mission 9: Cloud Automation Engineer.** I wrote a Bash backup script and scheduled it with cron. This showed me that a server can look after itself, and that automation saves time and prevents human error.

**Mission 10: Enterprise Cloud Architect.** Without a guide, I built an Ubuntu Server VM on VMware and deployed a PostgreSQL + pgAdmin stack with Docker Compose, a persistent volume, UFW hardening, an automated backup with rotation, and an operational manual. For the first time I combined everything from Missions 1 to 9 into one working system.

## Key Lessons
1. **Infrastructure as Code makes deployments repeatable.** One `docker-compose.yml` replaced many manual steps and can be rebuilt in minutes.
2. **Security is layered.** UFW alone is not enough, because Docker publishes ports through iptables and can bypass it. I kept PostgreSQL off the host's ports and exposed only pgAdmin.
3. **Persistence is deliberate.** Containers are disposable. My data survived a VM reboot only because of the named volume `pgdata`.
4. **A backup is only useful if a restore has been tested.** I practiced restoring from the compressed dump, not just creating it.
5. **Documentation is part of the product.** A system the client's IT team cannot operate is not finished.

## Challenges
- **Docker Compose was missing.** The `docker compose` command failed because only the Docker engine was installed. I installed the `docker-compose-v2` package.
- **502 Bad Gateway.** The stack had not started yet, and later pgAdmin needed about a minute to boot. I learned to check `docker compose ps`, the logs, and `curl -I http://localhost:8080` before blaming the network.
- **pgAdmin could not reach the database at `localhost`.** Inside Docker the database is reached by its service name, `db`. This taught me how Docker networks resolve container names.
- **Startup order.** The database was not ready when pgAdmin started, so I added a healthcheck and `depends_on` with `condition: service_healthy`.
- **Firewall vs. Docker.** I learned that publishing a port with Docker can bypass UFW, so I kept port 5432 unpublished.

## What I Would Improve
- Add TLS through a reverse proxy (Nginx or Caddy).
- Add monitoring and alerting (Prometheus + Grafana).
- Send backups off-site (S3 or another server).
- Use SSH keys only and add fail2ban.
- Restrict port 8080 to trusted IP addresses.

## Closing Thoughts
At the start of this course I was only copying commands. Now I can plan an architecture, deploy it, secure it, automate it and document it, and I understand why each part is there. Cloud computing, DevOps and system administration now feel like one connected skill set, not separate subjects. I feel ready to defend this infrastructure live and to keep building on it.

## AI Use Disclosure
I used Claude to help draft the documentation structure and the initial deployment commands. I tested the commands myself on the server, and the analysis and reflection are my own.
