# Puppet installer

node 'all' {
  # Install pip3
  package { 'python3-pip':
    ensure => installed,
  }

  # Install Flask
  exec { 'install_flask':
    command => 'pip3 install flask==2.1.0',
    path => ['/usr/bin/'],
  }
}
