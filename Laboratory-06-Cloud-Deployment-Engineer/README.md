# Laboratory 06 – The Cloud Deployment Engineer

## Mission Overview

In this laboratory activity, I learned how to deploy a multi-tier cloud application using Docker Compose. The application consists of two main containers: Nextcloud, which serves as the web application, and MariaDB, which works as the database.

The purpose of this activity is to understand how multiple containers can work together as one application. Instead of deploying each container manually, Docker Compose allows the infrastructure to be defined in a YAML configuration file and deployed using a single command.

## Objectives

At the end of this laboratory activity, I was able to:

* Explain the concept of a multi-tier application architecture.
* Understand the purpose and structure of a `docker-compose.yml` file.
* Use a Linux command-line text editor to create configuration files.
* Deploy a multi-container application using Docker Compose.
* Connect a Nextcloud application container to a MariaDB database container.
* Document deployment procedures using Markdown.
* Understand the basic concept of Infrastructure as Code (IaC).

## Commands Executed

The following commands were used during the deployment:

```bash
mkdir nextcloud-deployment
```

```bash
cd nextcloud-deployment
```

```bash
nano docker-compose.yml
```

```bash
docker-compose up -d
```

```bash
docker-compose ps
```

```bash
docker-compose down
```

### Description of Commands

* `mkdir nextcloud-deployment` – Creates a directory for the Nextcloud deployment project.
* `cd nextcloud-deployment` – Opens the newly created project directory.
* `nano docker-compose.yml` – Opens the Nano text editor to create the Docker Compose configuration file.
* `docker-compose up -d` – Deploys and starts the multi-container application in the background.
* `docker-compose ps` – Displays the status of the containers.
* `docker-compose down` – Stops and removes the containers after the deployment.

## Skills Learned

Through this laboratory activity, I learned how to:

* Create and manage directories using Linux commands.
* Create YAML configuration files using the Nano text editor.
* Use Docker Compose to deploy multiple containers.
* Understand the relationship between an application container and a database container.
* Configure environment variables for containers.
* Check the status of running Docker containers.
* Access a web application through a specified port.
* Shut down a multi-container application properly.
* Document cloud deployment procedures using Markdown.
* Apply the basic principles of Infrastructure as Code (IaC).

## Conclusion

This laboratory activity helped me understand how Docker Compose can simplify the deployment of multi-container applications. Instead of manually configuring each container, the required infrastructure can be described in a YAML file and deployed together. This demonstrates how Infrastructure as Code can make cloud deployment more organized, repeatable, and easier to manage.
