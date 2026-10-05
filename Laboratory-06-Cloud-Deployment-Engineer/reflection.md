# Reflection

This laboratory activity helped me understand how cloud applications can be deployed using Docker Compose. I learned that instead of manually creating and configuring each container, I can use a `docker-compose.yml` file to define and deploy multiple services together.

During the activity, I deployed a Nextcloud application together with a MariaDB database. I learned how the application container communicates with the database container using the service name `database`. I also learned how environment variables are used to configure the database connection.

One challenge I encountered was understanding how the different containers communicate with each other. At first, it was confusing because the database host was not `localhost`. After learning that Docker Compose allows containers to communicate using their service names, I understood why `database` was used as the MySQL host.

I also learned that Infrastructure as Code makes deployment easier and more organized because the configuration is saved in a YAML file. If the application needs to be deployed again, the same configuration can be reused instead of setting everything up manually.

Overall, this activity improved my understanding of Docker, Docker Compose, multi-tier architecture, and cloud deployment. It also showed me how application and database services can work together to create a complete cloud-based application.
