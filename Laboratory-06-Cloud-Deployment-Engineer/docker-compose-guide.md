# Docker Compose Guide

## What is Docker Compose?

Docker Compose is a tool that allows multiple containers to be defined and deployed using a single YAML configuration file. In this laboratory activity, Docker Compose is used to deploy a Nextcloud application container together with a MariaDB database container.

## The `services:` Block

The `services:` block defines the containers or services that will be created and managed by Docker Compose.

In this activity, there are two services:

* **database** – uses the MariaDB image and provides the database for Nextcloud.
* **app** – uses the Nextcloud image and provides the web application.

This allows both containers to be deployed as one application stack.

## How Does the Nextcloud Container Find the Database?

The Nextcloud application uses the `MYSQL_HOST` environment variable to identify the database container.

The configuration contains:

```yaml
- MYSQL_HOST=database
```

The word `database` refers to the name of the MariaDB service defined in the `services:` block. This allows the Nextcloud container to communicate with the MariaDB container.

## What is the Purpose of Environment Variables?

Environment variables provide configuration information to the containers without placing those settings directly inside the application code.

For example:

```yaml
- MYSQL_PASSWORD=cloudnova_pass
- MYSQL_DATABASE=nextcloud_db
- MYSQL_USER=nextcloud_user
- MYSQL_HOST=database
```

These variables tell Nextcloud which database to use and how to connect to it.

## `docker run` vs `docker-compose up -d`

The `docker run` command is normally used to create and start a container individually. It requires the user to specify the configuration for that container manually.

On the other hand, `docker-compose up -d` reads the `docker-compose.yml` file and creates and starts the services defined inside it. In this activity, one command can deploy both the MariaDB database and Nextcloud application.

The `-d` option runs the containers in the background, allowing the terminal to remain available for other commands.

## Infrastructure as Code

The `docker-compose.yml` file is an example of Infrastructure as Code (IaC). Instead of manually configuring every container, the required infrastructure is written as code in a YAML file.

This makes the deployment easier to repeat, organize, and manage.
