# example of killing a process

exec { 'pkill -f killmenow':
    path => ['/usr/bin', '/usr/sbin',],
}
