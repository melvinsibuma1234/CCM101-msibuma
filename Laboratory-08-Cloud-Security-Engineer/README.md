# Laboratory 08: The Cloud Security Engineer

## Mission Overview

This laboratory activity focuses on securing an Ubuntu server using the Uncomplicated Firewall (UFW). An Nginx web application is deployed using Docker, and firewall rules are configured to protect the server from unauthorized incoming network traffic.

## Objectives

- Understand the Principle of Least Privilege (PoLP).
- Identify the attack surface of a virtual machine.
- Configure a Default Deny firewall policy.
- Allow SSH traffic for remote administration.
- Allow TCP port 8080 for the web application.
- Verify firewall rules and test application connectivity.
- Document the security configuration using Markdown.

## Commands Executed

### Deploy the Web Application

```bash
docker --version
docker run -d --name secure-web-app -p 8080:80 nginx
curl http://localhost:8080
```

### Configure the Firewall

```bash
sudo ufw allow ssh
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
sudo ufw status verbose
```

### Allow Port 8080

```bash
sudo ufw allow 8080/tcp
sudo ufw status numbered
curl http://localhost:8080
```

## Skills Learned

- Deploying an Nginx web server using Docker.
- Testing a web application using curl.
- Configuring a Linux firewall with UFW.
- Applying the Default Deny security policy.
- Managing SSH and application network ports.
- Reducing the attack surface of a cloud server.
- Writing technical documentation using Markdown.
- Organizing a cloud computing portfolio on GitHub.

## Screenshots

The following screenshots provide evidence of the laboratory activities:

1. `screenshots/vulnerable-app-running.png` — Successful initial web application test.
2. `screenshots/firewall-activated.png` — Active firewall and default policies.
3. `screenshots/firewall-port-allowed.png` — Numbered firewall rules and web application test.
