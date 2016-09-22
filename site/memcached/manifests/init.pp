package {'memcached':
  ensure => present,
  before => File['/etc/sysconfig/memcached.conf']
}

file {'/etc/sysconfig/memcached.conf':
  ensure => file,
  content => "PORT="11211",
  content => "USER="memcached"",
  content => "MAXCONN="96"",
  content => ""32"",
  content => "OPTIONS=""",
  source => 'puppet:///modules/memcached/memcached.conf',
  notify => Service['memcached'],
}

service {'memcached':
  ensure => running,
  enable => true,
}
