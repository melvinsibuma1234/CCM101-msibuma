# Mission Reflection

This laboratory activity helped me understand how containerization can make application deployment faster and more efficient compared to traditional Virtual Machines. A Docker container can start within seconds because it does not need to install and boot a complete operating system. In contrast, setting up a Virtual Machine requires a guest operating system and usually takes more time and resources. This showed me why containers are useful for applications that need quick deployment and efficient resource usage.

The port mapping `-p 8080:80` is necessary because the Nginx web server runs on port 80 inside the container, while port 8080 on the host is used to access the service. By mapping port 8080 to port 80, I was able to send a request to `http://localhost:8080` and verify that the Nginx web server was running. This demonstrated how Docker can expose services running inside an isolated container.

When the `docker rm` command is used, the specified container is permanently removed. Data stored only inside the container and not saved using persistent storage can be lost when the container is removed. This makes it important to understand how data persistence works when managing containers.

Containerization also changes how developers and IT operations teams work together. Developers can package applications with their required dependencies, while operations teams can deploy the same container consistently across environments. This supports DevOps by improving collaboration, consistency, and deployment speed.

Finally, my GitHub portfolio is evolving as I continue adding practical cloud computing activities. Laboratory 04 adds Docker, containerization, Nginx deployment, container lifecycle management, and technical documentation to my previous cloud computing work. It gives me a more complete portfolio that demonstrates both cloud concepts and hands-on technical skills.
