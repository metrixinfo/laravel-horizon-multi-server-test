class workers::laravel {

  # Add qworkers.service
  file { 'qworkers':
    path => '/lib/systemd/system/qworkers.service',
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '644',
    audit => 'content',
    source => 'puppet:///modules/workers/lib/systemd/system/qworkers.service'
  }

  # Start the service
  service{'qworkers':
    ensure => running,
    require => [ File['qworkers'] ]
  }


}