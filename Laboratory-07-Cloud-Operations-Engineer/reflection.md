# Mission Reflection

This laboratory activity helped me understand why monitoring is an important part of cloud operations. Checking the host server's resources is important even when containers are running perfectly because containers still depend on the underlying server. If the host runs out of memory, storage, or CPU resources, the containers can eventually become slow or unavailable. In this activity, I learned how to check the server's memory and disk capacity using Linux commands such as `free -h` and `df -h`.

The `docker logs` command is also useful when troubleshooting problems experienced by users. If a user cannot log into a web application, the logs can provide information about requests, errors, and other events that occurred inside the container. For example, in this activity, the logs clearly showed the request to `/hidden-admin-page` and the resulting HTTP 404 error. This demonstrates how logs can help identify what happened instead of relying only on assumptions.

There is also an important difference between logs and metrics. Logs provide detailed records of events and requests that happened in an application, while metrics provide numerical information about system or container performance. In this activity, the logs showed HTTP 200 and 404 responses, while `docker stats` showed the CPU and memory consumption of the Nginx container.

Large enterprise companies can monitor thousands of containers by using centralized monitoring and observability tools such as Prometheus and Grafana. These tools can collect and display metrics from many systems in dashboards, making it easier for engineers to identify performance problems.

Overall, this laboratory improved my ability to troubleshoot Linux environments. I became more familiar with checking system resources, running Docker containers, generating test traffic, examining logs, and monitoring container performance. It also showed me how important actual metrics and logs are when determining whether a cloud environment is healthy.
