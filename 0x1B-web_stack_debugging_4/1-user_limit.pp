# Enable the user holberton to login and open files without error.

# Increase hard file limit for holberton user
exec { 'Change soft limit':
  command  => 'sed -i "s/holberton\ssoft.*/holberton\tsoft\tnofile\t10000/" /etc/security/limits.conf',
  provider => shell,
  path     => '/usr/local/bin/:/bin'
}

# Increase soft file limit
exec { 'Change hard limit':
  command  => 'sed -i "s/holberton\shard.*/holberton\thard\tnofile\t100000/" /etc/security/limits.conf',
  provider => shell,
  path     => '/usr/local/bin/:/bin'
}
