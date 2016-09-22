class nginx {
  package {'nginx':
    ensure => present,
    before => File['/etc/nginx/nginx.conf','/etc/nginx/conf.d/default.conf'],
    }
  file {'/etc/nginx/nginx.conf':
    ensure => file,
    path => '/etc/nginx/nginx.conf',
    onwer => 'root',
    group => 'root',
    mode  => '0664',
    source => 'puppet:///modules/nginx/files/nginx.conf',
    require => Package['nginx'],
    }
  file {'/etc/nginx/conf.d/default.conf':
    ensure => file,
    path => '/etc/nginx/conf.d/default.conf',
    onwer => 'root',
    group => 'root',
    mode  => '0664',
    source => 'puppet:///modules/nginx/files/default.conf',
    require => Package['nginx'],
    }
  file { 'index.html':
    ensure => file,
    source => 'puppet:///modules/nginx/files/index.html',
    }
  service {'ngnix':
    ensure => running,
    enable => true,
    }
}
