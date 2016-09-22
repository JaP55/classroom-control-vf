class memcached {
  package {'memcached':
    ensure => present,
    before => File['/etc/sysconfig/memcached.conf']
  }

  file {'/etc/sysconfig/memcached.conf':
    ensure => file,
    path => '/etc/sysconfig/memcached.conf',
    source => 'puppet:///modules/memcached/memcached.conf',
    requier => ,
    }

  service {'memcached':
    ensure => running,
    enable => true,
  }
}
