class common::ntp {

  package { [
    'ntp',
    'ntpstat',
    'ntpdate',
    'fake-hwclock'
  ]:
    ensure => 'present'
  }

  # Add ntp.comf
  file { 'timezone':
    path => '/etc/timezone',
    ensure => file,
    audit => 'content',
    notify => Service['ntp'],
    source => 'puppet:///modules/common/etc/timezone',
  }

  # Add ntp.conf
  file { 'ntp.conf':
    path => '/etc/ntp.conf',
    ensure => file,
    audit => 'content',
    require => Package['ntp'],
    notify => Service['ntp'],
    source => 'puppet:///modules/common/etc/ntp.conf',
  }

  # Make sure that the nginx service is running
  service { 'ntp':
    ensure => running,
    require => Package['ntp']
  }

  # Update the time
  # exec { 'ntp-update-time':
  #   command => 'ntpd -gq',
  #   path    => ['/usr/bin:/usr/sbin'],
  #   user    => 'root',
  #   require => Package['ntp']
  # }

}