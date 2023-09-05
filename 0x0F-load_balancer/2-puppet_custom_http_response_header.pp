# Add a custom HTTP header with Puppet

exec { 'apt-update':
  command => 'sudo apt -y update',
  before  => Exec['install_nginx'],
}

exec { 'install_nginx':
  command => 'sudo apt -y install nginx',
  before  => Exec['add_header'],
}

exec { 'add_header':
  command => 'sudo sed -i "/server_name/a add_header X-Served-By \$HOSTNAME;" /etc/nginx/sites-available/default',
  before  => Exec['restart_nginx_service'],
}

exec { 'restart_nginx_service':
  command => 'sudo service nginx restart',
}
