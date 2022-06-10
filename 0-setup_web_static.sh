#!/usr/bin/env bash
# Bash script to setup a web server.

apt-get update -y
apt-get install -y nginx
service nginx start
mkdir -p /data/web_static/releases/test/
mkdir -p /data/web_static/shared/
echo "simple contest to test my Nginx conf" > /data/web_static/releases/test/index.html
ln -sf /data/web_static/current /data/web_static/releases/test
chown -R ubuntu:ubuntu /data/
sudo sed -i '38i\\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}\n' /etc/nginx/sites-available/default
service nginx restart
