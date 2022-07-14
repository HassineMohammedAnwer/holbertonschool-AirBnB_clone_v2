#using puppet setup web static like task 0

package { 'nginx':
  ensure => 'installed',
}

service {'nginx':
  ensure  => 'running',
  require => file_line['ADDING A LOCATION']
}

$cont = '<html>\n  <head>\n  </head>\n  <body>\n    Holberton School\n  </body>\n</html>'

file { '/data':
  ensure  => 'directory',
  owner   => 'ubuntu',
  group   => 'ubuntu',
  mode   => '0777',
}

file { '/data/web_static':
  ensure  => 'directory',
  owner   => 'ubuntu',
  group   => 'ubuntu',
  mode   => '0751',
}

file { ['/data/web_static/shared', '/data/web_static/releases', '/data/web_static/releases/test']:
  ensure  => 'directory',
  owner   => 'ubuntu',
  group   => 'ubuntu',
  mode   => '0751',
}

file { '/data/web_static/current':
  ensure => 'link',
  target => '/data/web_static/releases/test',
  mode   => '0777',
  force  => true
}

file { '/data/web_static/releases/test/index.html':
  ensure  => 'present',
  content => $cont,
  require => Package['nginx']
}

service {'nginx':
  ensure  => 'running',
  require => file_line['ADDING A LOCATION']
}
