# Firewall Configuration

## 1. Allow SSH Access

Command:

```bash
sudo ufw allow ssh
```

Explanation:

This command allows SSH traffic through the firewall so administrators can remotely manage the server using the standard SSH service port.

## 2. Configure the Default Deny Policy

Commands:

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

Explanation:

The first command blocks incoming traffic by default unless a rule allows it. The second command permits outgoing traffic by default.

## 3. Enable UFW

Command:

```bash
sudo ufw enable
```

Explanation:

This command activates the firewall and applies the configured rules.

## 4. Verify Firewall Status

Command:

```bash
sudo ufw status verbose
```

Explanation:

This command displays the firewall status, default policies, and configured rules.

## 5. Allow TCP Port 8080

Command:

```bash
sudo ufw allow 8080/tcp
```

Explanation:

This command allows incoming TCP traffic on port 8080 for access to the web application.

## 6. Display Numbered Firewall Rules

Command:

```bash
sudo ufw status numbered
```

Explanation:

This command displays the firewall rules with numbers so they can be inspected and managed.

## 7. Test the Web Application

Command:

```bash
curl http://localhost:8080
```

Explanation:

This command sends an HTTP request to the locally published web application and displays the server response.

## 8. Security Warning

If `sudo ufw enable` is executed before `sudo ufw allow ssh`, incoming SSH connections may be blocked by the default-deny policy, potentially preventing administrators from accessing the server remotely.
