#!/usr/bin/env bash
# sets up your web servers for the deployment of web_static
# Update the Nginx configuration
apt-get update -y
apt-get install -y nginx
service nginx start
mkdir -p /data/web_static/releases/test/
mkdir -p /data/web_static/shared/
echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" > /data/web_static/releases/test/index.html
ln -sf /data/web_static/releases/test /data/web_static/current
chown -R ubuntu:ubuntu /data/
content="
server {
	listen 80 default_server;
	server_name _;
	location / {
		try_files \$uri \$uri/ =404;
	}
	location /hbnb_static {
		alias /data/web_static/current;
		index index.html;
		try_files \$uri \$uri /hbnb_static/index.html;
	}
}
"
echo -e "$content" | sudo tee /etc/nginx/sites-available/default

service nginx restart
exit 0
