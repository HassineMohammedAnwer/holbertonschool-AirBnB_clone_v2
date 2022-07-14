#using puppet setup web static like task 0 MAAAAANRVW

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

$cont2 ='\'38i\\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t\tautoindex off;\n\t}\n\''

exec {'serverr':
  provider => shell,
  command  => 'sudo sed -i $cont2 /etc/nginx/sites-available/default',
  before   => Exec['restrating'],
}

exec {'restrating':
  provider => shell,
  command  => 'sudo service nginx restart',
  before   => File['/data/']
}
