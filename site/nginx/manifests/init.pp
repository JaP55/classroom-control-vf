class nginx {
  package {'nginx':
    ensure => present,
    before => File['/etc/nginx/nginx.conf','/etc/nginx/conf.d/default.conf'],
    }
  file {'/etc/nginx/nginx.conf':
    ensure => file,
    path => '/etc/nginx/nginx.conf',
    owner => 'root',
    group => 'root',
    mode  => '0664',
    source => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
    notify  => Service['nginx'],
    }
  file {'/etc/nginx/conf.d/default.conf':
    ensure => file,
    path => '/etc/nginx/conf.d/default.conf',
    owner => 'root',
    group => 'root',
    mode  => '0664',
    source => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
    notify  => Service['nginx'],
    }
  file { '/etc/nginx/conf.d':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0775',
    }
  file { '/var/www':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0775',
    }
  file { '/var/www/index.html':
    ensure => file,
    path => '/var/www/index.html',
    owner => 'root',
    group => 'root',
    mode  => '0664',
    source => 'puppet:///modules/nginx/index.html',
    require => Package['nginx'],
    }
  service {'ngnix':
    ensure => running,
    enable => true,
    }
}
