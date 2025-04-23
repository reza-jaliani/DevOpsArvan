# Step By Step tp Learn Docker

Day 1
-------------------

***Installation:***

***Work with Docker Hub:***

Day 2
-------------------

***Running Your First Custom Container***

        docker run -d -p 8080:80 --name mynginx nginx

-d: Run a container in detached mode. In this mode, the container run and keep running in the background.

-p 8080:80: Maps port 8080 on your local machine to port 80 inside the container. This means you’ll be able to access the web server at http://localhost:8080 on your browser.

--name: to set a name on your container.

***Running Your Second Custom Container***

        docker run -d -p 8080:80 --name mynginx  -v ~/Desktop/mynginx:/usr/share/nginx/html nginx 

-v /path/to/your/local/directory:/usr/share/nginx/html: This maps a local directory on your machine to the /usr/share/nginx/html directory in the container, which is where Nginx serves web files from.

This means:

You’re telling Docker to run an Nginx server.

Port 8080 on your PC is linked to port 80 in the container (so you access it at http://localhost:8080).

Most importantly, the container's web root /usr/share/nginx/html is linked to your local folder ~/Desktop/mynginx.

So what happens now?
Whatever HTML or files you put into ~/Desktop/mynginx on your system will automatically show up in the Nginx web server.

You don’t need to rebuild the container to update your website — just edit the files locally.

For example:

        echo "<h1>Hello from Docker Volume!</h1>" > ~/Desktop/mynginx/index.html

And then you can see your changes on your webpage!
