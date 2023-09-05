# Add a custom HTTP header with Puppet

exec { 'update':
  command  => 'sudo apt-get update',
  provider => shell,
}

package { 'nginx':
  ensure => present,
}

# Add custom HTTP header to Nginx configuration
file_line { 'header line':
  ensure => present,
  path   => '/etc/nginx/sites-available/default',
  line   => "\tlocation / {\n\t\tadd_header X-Served-By ${hostname};",
  match  => '^\tlocation / {',
}

exec { 'restart service':
  command  => 'sudo service nginx restart',
  provider => shell,
}

Exec['update'] -> Package['nginx'] -> File_line['header line'] -> Exec['restart service']
