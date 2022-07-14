#using puppet setup web static like task 0 MAAAAANRVW

$cont = '<html>\n  <head>\n  </head>\n  <body>\n    Holberton School\n  </body>\n</html>'

exec {'get ngnx':
  provider => shell,
  command  => 'sudo apt-get -y install nginx',
}

exec {'startinx':
  provider => shell,
  command  => 'sudo service nginx start',
}

exec {'folder making':
  provider => shell,
  command  => 'sudo mkdir -p /data/web_static/releases/test/',
}

exec {'create second directory':
  provider => shell,
  command  => 'sudo mkdir -p /data/web_static/shared/',
}

exec {'content into html':
  provider => shell,
  command  => 'echo "$cont" | sudo tee /data/web_static/releases/test/index.html',
}

exec {'symbolic link':
  provider => shell,
  command  => 'sudo ln -sf /data/web_static/releases/test/ /data/web_static/current',
}

exec {'location put':
  provider => shell,
  command  => 'sudo sed -i \'38i\\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t\tautoindex off;\n\t}\n\' /etc/nginx/sites-available/default',
}

exec {'restartinx':
  provider => shell,
  command  => 'sudo service nginx restart',
}

file {'/data/':
  ensure  => directory,
  owner   => 'ubuntu',
  group   => 'ubuntu',
  recurse => true,
}
