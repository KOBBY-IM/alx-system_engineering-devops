# Install Nginx web server (w/ Puppet)
package { 'nginx':
  ensure => installed,
}

file_line { 'redirect_line':
  ensure => present,
  path   => '/etc/nginx/sites-available/default',
  line   => 'return 301 https://www.fosstechnix.com/how-to-install-nginx-on-ubuntu-22-04$request_uri;',
  match  => '^server_name _;',
}

file { '/var/www/html/index.html':
  content => 'Hello World',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
