# Taking NGINX as base image
FROM nginx:stable

# Install git for cloning VDO.ninja
RUN apt update && apt install -y git && apt clean

# Clone VDO.ninja repository directly into the container
RUN git clone https://github.com/steveseguin/vdo.ninja.git /var/www/html/vdo.ninja

# Add copy of default nginx conf file
COPY default.conf /etc/nginx/conf.d/.

# Add modified entrypoint script
COPY ./init/entrypoint.sh /init/

# Configure working directory
WORKDIR /var/www/html

# Set run on start commands
CMD ["/init/entrypoint.sh"]
