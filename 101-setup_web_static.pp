#using puppet setup web static like task 0

package { 'nginx':
  ensure => 'installed',
}

$cont = '<html>\n  <head>\n  </head>\n  <body>\n    Holberton School\n  </body>\n</html>'

-> exec {'folder':
  command => '/usr/bin/env mkdir -p /data/web_static/releases/test/',
}
-> exec {'own':
  command => '/usr/bin/env chown -R ubuntu:ubuntu /data',
}
-> exec {'folderr':
  command => '/usr/bin/env mkdir -p /data/web_static/shared/',
}
-> exec {'ech':
  command => '/usr/bin/env echo $cont > /data/web_static/releases/test/index.html',
}
-> exec {'lnking':
  command => '/usr/bin/env ln -sf /data/web_static/releases/test /data/web_static/current',
}
-> exec {'restrating':
  command => '/usr/bin/env service nginx restart',
}
