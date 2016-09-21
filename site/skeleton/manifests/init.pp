class skeleton { 
  file { '/etc/skel':
    ensure => directory,
    
  file {'/etc/skel/.bashre':
    ensure => file,
    source => 'puppet:///modules/skeleton/bashrc',
    }
