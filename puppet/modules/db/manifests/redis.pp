class db::redis {

  package { 'redis-server':
    ensure => 'present'
  }

  # Add a redis.conf
  file { 'redis.conf':
    path => '/etc/redis/redis.conf',
    ensure => file,
    audit => 'content',
    require => Package['redis-server'],
    notify => Service['redis-server'],
    source => 'puppet:///modules/db/etc/redis/redis.conf',
  }

  # Make sure that the redis service is running
  service { 'redis-server':
    ensure => running,
    require => Package['redis-server']
  }


}