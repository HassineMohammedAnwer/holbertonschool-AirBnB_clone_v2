#using puppet setup web static like task 0

package { 'nginx':
  ensure => 'installed',
}

service {'nginx':
  ensure  => 'running',
  require => file_line['ADDING A LOCATION']
}

$cont = '<html>\n  <head>\n  </head>\n  <body>\n    Holberton School\n  </body>\n</html>'

file { ['/data', '/data/web_static', '/data/web_static/shared', '/data/web_static/releases', '/data/web_static/releases/test'] :
  ensure  => 'directory',
  owner   => 'ubuntu',
  group   => 'ubuntu',
  mode   => '777',
  require =>  Package['nginx']
}

file { '/data/web_static/releases/test/index.html':
  ensure  => 'present',
  content => $cont,
  require => Package['nginx']
}

file { '/data/web_static/current':
  ensure => 'link',
  target => '/data/web_static/releases/test',
  force  => true
}

service {'nginx':
  ensure  => 'running',
  require => file_line['ADDING A LOCATION']
}
