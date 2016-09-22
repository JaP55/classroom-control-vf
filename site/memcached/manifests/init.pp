class memcached {
  package {'memcached':
    ensure => present,
    before => File['/etc/sysconfig/memcached']
  }

  file {'/etc/sysconfig/memcached':
    ensure => file,
    path => '/etc/sysconfig/memcached.conf',
    source => 'puppet:///modules/memcached/sysconfig/memcached',
    require => Package['memcached'],
    }

  service {'memcached':
    ensure => running,
    enable => true,
  }
}
