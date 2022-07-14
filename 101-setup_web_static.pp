#using puppet setup web static like task 0

package { 'nginx':
  ensure => 'installed',
}

$cont = '<html>\n  <head>\n  </head>\n  <body>\n    Holberton School\n  </body>\n</html>'

exec {'folder':
  command => '/usr/bin/env mkdir -p /data/web_static/releases/test/',
}
exec {'own':
  command => '/usr/bin/env chown -R ubuntu:ubuntu /data',
}
exec {'folderr':
  command => '/usr/bin/env mkdir -p /data/web_static/shared/',
}
exec {'ech':
  command => '/usr/bin/env echo $cont > /data/web_static/releases/test/index.html',
}
exec {'lnking':
  command => '/usr/bin/env ln -sf /data/web_static/releases/test /data/web_static/current',
}

$cont2 = '\nserver {\n	listen 80 default_server;\n	server_name _;\n	location / {\n		try_files \$uri \$uri/ =404;\n	}\n	location /hbnb_static {\n		alias /data/web_static/current;\n		index index.html;\n		try_files \$uri \$uri /hbnb_static/index.html;\n	}\n}\n'

exec {'serverr':
  command => '/usr/bin/env sudo echo -e "$cont2" >> /etc/nginx/sites-available/default',
}

$temp = '/listen 80 default_server/a location /hbnb_static/ { alias /data/web_static/current/;}'
exec {'servearr':
  command => '/usr/bin/env sed -i "$temp" /etc/nginx/sites-available/default',
}
exec {'restrating':
  command => '/usr/bin/env service nginx restart',
}
