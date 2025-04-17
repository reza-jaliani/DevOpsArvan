# 🐳 Complete Docker Tutorial (Beginner-Friendly)

This document is a comprehensive and practical guide to getting started with Docker. It covers basic concepts, essential commands, image creation, container management, volumes, networking, Docker Compose, and registries.

---

## 🔹 Basic Concepts

- **Image**: A read-only template used to create containers.
- **Container**: A runnable instance of an image, isolated from the host system.
- **Dockerfile**: A script containing instructions to build a Docker image.
- **Volume**: Persistent storage that can be shared between containers.
- **Network**: A virtual network allowing containers to communicate.
- **Docker Hub**: A public registry for sharing Docker images.

---

## 🔧 Installing Docker

### On Ubuntu:
```bash
sudo apt update
sudo apt install docker.io -y
sudo systemctl enable --now docker
```

---

## ⚙️ Basic Commands

### Check Docker status:
```bash
docker --version
docker info
```

### Working with containers:
```bash
docker run hello-world                      # Test Docker installation
docker ps                                   # List running containers
docker ps -a                                # List all containers
docker start <id>                           # Start a container
docker stop <id>                            # Stop a container
docker rm <id>                              # Remove a container
docker logs <id>                            # View container logs
docker exec -it <id> bash                   # Access shell inside container
```

### Working with images:
```bash
docker images                               # List local images
docker rmi <image_id>                       # Remove an image
docker pull ubuntu                          # Download image from Docker Hub
docker inspect <image_or_container_id>      # View detailed info
```

---

## 🧱 Creating Docker Images with Dockerfile

To containerize an application, you'll typically create a `Dockerfile` with instructions to set up your app.

### 🔸 General Example for Any Language:

```Dockerfile
FROM alpine:latest
WORKDIR /app
COPY . .
RUN apk add --no-cache gcc g++ make   # Example for compiled languages
CMD ["./your-binary"]
```

You can adjust the base image and build steps based on the language or framework.

### 🔹 Example: Dockerizing a Node.js App

```Dockerfile
FROM node:18
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
CMD ["node", "server.js"]
```

Then run:

```bash
docker build -t my-app .
docker run -p 3000:3000 my-app
```

---

## 📂 Using `.dockerignore`

To avoid copying unnecessary files into the image, add a `.dockerignore` file:

```
node_modules
*.log
.env
```

---

## 🗂️ Volumes

### Create and use a volume:
```bash
docker volume create mydata
docker run -v mydata:/app/data alpine
```

### Inspect or delete volumes:
```bash
docker volume ls
docker volume inspect mydata
docker volume rm mydata
```

---

## 🌐 Docker Networking

### Create and use a custom network:
```bash
docker network create mynet
docker run -dit --name db --network=mynet mysql
docker run -dit --name app --network=mynet myapp
```

---

## 🧩 Docker Compose

`docker-compose.yml` example:
```yaml
version: '3'
services:
  web:
    build: .
    ports:
      - "3000:3000"
  db:
    image: mongo
```

Usage:
```bash
docker compose up --build
docker compose down
```

---

## 🔐 Docker Registry

### Login and push to Docker Hub:
```bash
docker login
docker tag myapp username/myapp:latest
docker push username/myapp:latest
```

---

## 🧹 Clean Up Unused Resources

```bash
docker container prune
docker image prune
docker volume prune
docker system prune -a
```

---

✅ With these fundamentals, you're ready to containerize and manage almost any application!