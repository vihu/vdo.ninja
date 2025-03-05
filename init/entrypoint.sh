#!/bin/bash
echo "Skipping SSL Setup - use Caddy for SSL termination"
if pidof /usr/sbin/nginx >/dev/null; then
    echo "Nginx is running."
else
    echo "Nginx is starting..."
    /usr/sbin/nginx -g "daemon off;"
fi
echo "Nginx service killed. Container exiting"

