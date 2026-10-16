# Security Audit Report

## 1. Principle of Least Privilege (PoLP)

The Principle of Least Privilege means giving users, applications, and services only the permissions necessary to perform their assigned tasks. In cloud environments, this principle helps prevent unauthorized access and limits the possible damage if an account or service becomes compromised.

## 2. Attack Surface

The attack surface of a virtual machine consists of its exposed network ports, running services, applications, and other possible entry points that attackers might exploit. Reducing unnecessary services and restricting access to required ports helps minimize security risks.

## 3. Default Deny Policy

A Default Deny policy blocks incoming network traffic unless a firewall rule explicitly permits it. This approach is safer than blocking individual attackers because unauthorized connections are denied by default, including connections from previously unknown sources.

## 4. Initial Application Deployment

An Nginx web server was deployed in a Docker container named `secure-web-app`. The container was configured to publish host port 8080 and forward requests to port 80 inside the container.

The application was tested using the following command:

```bash
curl http://localhost:8080
```

The expected result was an HTML response from the Nginx welcome page.

## 5. Firewall Security Audit

UFW was configured to deny incoming traffic by default and allow outgoing traffic. SSH access was allowed before enabling the firewall to help preserve remote administration access.

A specific rule was then added to permit incoming TCP traffic on port 8080 for the web application.

## 6. Security Recommendations

- Allow only the network ports required by the server.
- Use strong authentication for administrative accounts.
- Keep the operating system, applications, and containers updated.
- Review firewall rules regularly.
- Avoid exposing unnecessary services to the public internet.
- Monitor network activity for suspicious connections.

## 7. Screenshot Evidence

- `screenshots/vulnerable-app-running.png`
- `screenshots/firewall-activated.png`
- `screenshots/firewall-port-allowed.png`

These screenshots should contain the actual terminal results obtained during the laboratory activity.
