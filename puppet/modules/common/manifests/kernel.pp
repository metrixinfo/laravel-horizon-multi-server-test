class common::kernel {

  # Add rc.local
  file { 'rc.local':
    path => '/etc/rc.local',
    ensure => file,
    mode   => '755',
    owner => 'root',
    group => 'root',
    audit => 'content',
    source => 'puppet:///modules/common/etc/rc.local',
  }

  # Add sysctl.conf
  file { 'sysctl.conf':
    path => '/etc/sysctl.conf',
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '644',
    audit => 'content',
    source => 'puppet:///modules/common/etc/sysctl.conf',
  }

  # Add a global aliases file
  file { 'bash.bashrc':
    path => '/etc/bash.bashrc',
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '644',
    audit => 'content',
    source => 'puppet:///modules/common/etc/bash.bashrc'
  }

}