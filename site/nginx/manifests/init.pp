class nginx {
  package {'nginx':
    ensure => present,
    before => File['/etc/nginx/nginx.conf']
    before => File['/etc/nginx/conf.d/default.conf']
  }
  file {'/etc/nginx/nginx.conf':
    ensure => file,
    path => '/etc/nginx/nginx.conf',
    source => 'puppet:///modules/nginx/files/nginx.conf',
    require => Package['nginx']
  }
    
  file {'/etc/nginx/conf.d/default.conf':
    ensure => file,
    path => '/etc/nginx/conf.d/default.conf',
    source => 'puppet:///modules/nginx/files/nginx.conf',
    require => Package['nginx']
  }
  service {'ngnix':
    ensure => running,
    enable => true,
  }
}
