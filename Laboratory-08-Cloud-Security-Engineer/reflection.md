# Mission 8 Reflection: The Cloud Security Engineer

Completing this laboratory activity helped me understand the importance of securing cloud servers against unauthorized access. A host-based firewall provides an additional layer of protection directly on a server. Even if the physical network perimeter is breached, the firewall can still restrict incoming connections based on its configured rules. This demonstrates defense in depth, where multiple security measures work together to protect a system.

Managing open network ports is critical because every unnecessary port or running service can create a potential entry point for attackers. Allowing only the ports needed by the application and authorized administrators helps reduce the server's attack surface. In this activity, SSH access was allowed for remote administration, while TCP port 8080 was opened for the Nginx web application. The Default Deny policy ensured that incoming traffic was blocked unless a specific rule permitted it.

In a real enterprise environment, leaving a database port such as 3306 for MySQL open to the public internet can be dangerous. Attackers could attempt to guess passwords, exploit software vulnerabilities, or gain unauthorized access to sensitive company and customer information. Database services should generally be restricted to trusted application servers and authorized administrators.

This mission also changed my perspective on how easily a server can become vulnerable. A web application may function correctly but still be exposed if its network security is not configured properly. Therefore, security must be considered during deployment and maintained through regular monitoring, software updates, and security audits.

Finally, having eight laboratory missions in my GitHub cloud computing portfolio represents my progress in learning cloud technologies. My portfolio provides a way to organize my activities, document technical skills, and demonstrate my development as an aspiring IT professional. This laboratory taught me that securing a server requires proper configuration, testing, documentation, and continuous improvement.
