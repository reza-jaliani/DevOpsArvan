# Docker Introduction

***Base Commands:***
----------------

**Show running containers:**

        docker ps

**Show running and closed containers:**

        docker ps -A

**Show images on local system:**

        docker image ls

**To start and stop running containers:**

        docker container stop/start <container_ID>

**To remove a container:** (When your container is runnning, you need to remove it forcefully with -f flag)

        docker container rm <container_ID>

        docker container rm -f <container_ID>

**To remove all stopped containers:**

        docker container prune

**Show status of a container:**

        docker container stats <container_ID>

**Show information of an image:**

        docker image inspect <image_ID_or_name>

**To run a command on a container:**

        docker exec <container_ID> <command>

**To have an interactive command-line with container:**

        docker exec -it <container_ID> bash

**run a new image:** (This command run an image and if this image doesn't exist on your system, it pulls that image from docker-hub online)

        docker run <image_name> [--name:your_name]

**run an image and don't close it, but stay at terminal of that container**

        docker run -it <image_name>

**To dockerize your project:**

Create a docker file in your project. Add these command in your docker file:

        FROM <image_name>

        COPY ./package.json /app/package.json
        COPY ./server.js /app/server.js

        RUN cd /app && npm install

RUN: run a command when you create an image
        
        CMD ["node","/app/server.js"]

CMD: run a command when you run an image

There's a special structure to type your commands in cmd. Search IT!

**Finally** you should run this command in directory of your project to create a customize image of your project:

        docker build .

        docker build . --no-cache

        docker build -t <name_tag> .

        docker build -t <name_tag>:<version_number> .

        

**Show image list:**

        docker images

**Expose port:**

        docker run -p <output_port>:<docker_port> <image_ID_or_name>

**Deattach container:** (Don't show the output of commands in container)

        docker run -d

**Determine Work Directory:** (In Docker file, type:)

        WORKDIR <Directory_Path>

**Determine exposed port:** (In Docker file, type:)

        EXPOSE <Port_number>

-----------------------

***Docker ignore***

When you want to prevent some files from putting in Docker, create a file in project directory named .dockerignore and put the file names of everything you want to ignore from docker image.

