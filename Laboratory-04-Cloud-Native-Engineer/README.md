# Laboratory 04 - Cloud-Native Engineer

## Mission Overview

This laboratory activity focuses on understanding cloud-native engineering and containerization. The activity compares traditional Virtual Machines (VMs) with Containers and demonstrates the use of Docker through the KillerCoda Playground. An Nginx web server was deployed inside a Docker container, and its container lifecycle was managed using Docker CLI commands.

## Objectives

* Differentiate between Virtual Machines and Containers.
* Access and verify a Docker-enabled environment using KillerCoda.
* Execute fundamental Docker CLI commands.
* Pull, run, manage, and terminate an Nginx container.
* Understand Docker port mapping and container lifecycle.
* Create technical documentation using Markdown.
* Maintain an organized GitHub Cloud Computing Portfolio.

## Docker Commands Executed

### Check Docker Installation

```bash
docker --version
```

### Check Docker Status

```bash
sudo systemctl status docker --no-pager
```

### Pull the Nginx Image

```bash
docker pull nginx
```

### Run the Nginx Container

```bash
docker run -d --name nginx-server -p 8080:80 nginx
```

### List Running Con
