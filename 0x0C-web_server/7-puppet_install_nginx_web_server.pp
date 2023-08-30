# Install Nginx web server (w/ Puppet)
package { 'nginx':
  ensure => installed,
}

file { '/etc/nginx/sites-available/default':
  ensure => present,
  content => "
    server {
      listen 80 default_server;
      server_name _;

      location / {
        return 200 'Hello World!';
      }

      location /redirect_me {
        return 301 https://www.fosstechnix.com/how-to-install-nginx-on-ubuntu-22-04$request_uri;
      }
    }
  ",
  require => Package['nginx'],
}

service { 'nginx':
  ensure  => running,
  require => [Package['nginx'], File['/etc/nginx/sites-available/default']],
}
