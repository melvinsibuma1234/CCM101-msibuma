# Docker Deployment and Container Lifecycle

## Nginx Container Deployment

### Pull the Nginx Image

```bash
docker pull nginx
```

This command downloads the official Nginx image from Docker Hub.

### Run the Nginx Container

```bash
docker run -d --name nginx-server -p 8080:80 nginx
```

This command runs the Nginx container in detached mode and maps host port 8080 to container port 80.

### Test the Nginx Web Server

```bash
curl http://localhost:8080
```

This command sends an HTTP request to the Nginx web server to verify that it is running.

## Container Lifecycle

### 1. List Running Containers

```bash
docker ps
```

This command lists all currently running Docker containers.

### 2. Stop the Running Container

```bash
docker stop nginx-server
```

This command stops the running Nginx container.

### 3. Verify the Container is Stopped

```bash
docker ps -a
```

This command displays all containers, including stopped containers, to verify the Nginx container has stopped.

### 4. Remove the Container Completely

```bash
docker rm nginx-server
```

This command permanently removes the Nginx container.

## Container Lifecycle Summary

The container lifecycle demonstrated in this activity is:

**Run → List → Stop → Verify → Remove**
