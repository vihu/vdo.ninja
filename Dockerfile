# Taking NGINX as base image
FROM nginx:stable

# Adding labels
LABEL "com.umlatt.description"="VDO Ninja (No SSL)"
LABEL "maintainer"="Your Name <your.email@example.com>"

# Get vdo.ninja webserver files
COPY ./vdo.ninja /var/www/html/vdo.ninja

# Add copy of default nginx conf file
COPY default.conf /etc/nginx/conf.d/.

# Add modified entrypoint script
COPY ./init/entrypoint.sh /init/entrypoint.sh
RUN chmod +x /init/entrypoint.sh

# Configure working directory
WORKDIR /var/www/html

# Set run on start commands
CMD ["/init/entrypoint.sh"]
