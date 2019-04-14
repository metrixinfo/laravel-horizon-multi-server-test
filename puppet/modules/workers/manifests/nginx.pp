class workers::nginx {

  package { 'nginx':
    ensure => 'present'
  }

  # Get our nginx.conf file
  file { 'nginx.conf':
    path => '/etc/nginx/nginx.conf',
    ensure => file,
    audit => 'content',
    require => Package['nginx'],
    notify => Service['nginx'],
    source => 'puppet:///modules/workers/etc/nginx/nginx.conf',
  }

  # Add a host template
  file { 'vagrant-nginx':
    path => '/etc/nginx/sites-available/test.conf',
    ensure => file,
    audit => 'content',
    require => Package['nginx'],
    notify => Service['nginx'],
    source => 'puppet:///modules/workers/etc/nginx/sites-available/test.conf',
  }

  # Disable the default nginx vhost
  file { 'default-nginx-disable':
    path => '/etc/nginx/sites-enabled/default',
    ensure => absent,
    require => Package['nginx'],
  }

  # Symlink our vhost in sites-enabled to enable it
  file { 'vagrant-nginx-enable':
    path => '/etc/nginx/sites-enabled/test.conf',
    target => '/etc/nginx/sites-available/test.conf',
    ensure => link,
    notify => Service['nginx'],
    require => [
      File['vagrant-nginx'],
      File['default-nginx-disable']
    ]
  }

  # Make sure that the nginx service is running
  service { 'nginx':
    ensure => running,
    require => Package['nginx']
  }

}
