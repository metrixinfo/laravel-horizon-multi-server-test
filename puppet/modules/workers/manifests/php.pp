class workers::php {

  package { [
    'php7.2-cli',
    'php7.2-common',
    'php7.2-bcmath',
    'php7.2-curl',
    'php7.2-dev',
    'php7.2-fpm',
    'php7.2-gd',
    'php7.2-gmp',
    'php7.2-json',
    'php7.2-mbstring',
    'php7.2-mysql',
    'php7.2-opcache',
    'php7.2-readline',
    'php7.2-xml',
    'php7.2-zip',
    'php-imagick',
    'php-redis',
    'php-xdebug',
    'composer'
  ]:
    ensure => 'present',
    require => Class['apt::update']
  }

  # Add php.ini for fpm
  file { 'fpm-php-ini':
    path    => '/etc/php/7.2/fpm/php.ini',
    ensure  => file,
    audit   => 'content',
    require => Package['php7.2-fpm'],
    source  => 'puppet:///modules/workers/etc/php/7.2/fpm/php.ini',
    notify  => Service['php7.2-fpm']
  }

  # Add www.conf for fpm
  file { 'php-fpm-wwww.conf':
    path    => '/etc/php/7.2/fpm/pool.d/www.conf',
    ensure  => file,
    audit   => 'content',
    require => Package['php7.2-fpm'],
    source  => 'puppet:///modules/workers/etc/php/7.2/fpm/pool.d/www.conf',
    notify  => Service['php7.2-fpm']
  }

  # Create a log directory
  file { '/var/log/php':
    ensure => 'directory',
    owner  => 'www-data',
    group  => 'www-data',
    mode   => '2775'
  }

  # Start the service
  service {'php7.2-fpm':
    ensure  => running,
    require => [ Package['php7.2-fpm'], File['/var/log/php'] ]
  }

}