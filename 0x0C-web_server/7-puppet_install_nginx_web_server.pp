# Install Nginx web server (w/ Puppet)
package { 'nginx':
  ensure => installed,
}

file_line { 'line':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'server_name _',
  line   => 'rewrite ^/redirect_me https://www.fosstechnix.com/how-to-install-nginx-on-ubuntu-22-04 permanent;',
}i

file { '/var/www/html/index.html':
  content => 'Hello World',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
