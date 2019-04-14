class db::mysql {

  class { '::mysql::server':
    package_name            => 'mysql-server-5.7',
    config_file             => '/etc/mysql/my.cnf',
    root_password           => 'root',
    remove_default_accounts => true,
    service_manage => false,
    manage_config_file => false
  }

  service {'mysql':
    ensure => 'running',
    require => Class['::mysql::server']
  }

  # Add server conf
  file { 'mysqld.cnf':
    path => '/etc/mysql/mysql.conf.d/mysqld.cnf',
    ensure => file,
    mode => '0664',
    audit => 'content',
    require => Class['::mysql::server'],
    notify => Service['mysql'],
    source => 'puppet:///modules/db/etc/mysql/mysql.conf.d/mysqld.cnf',
  }

  mysql_grant{'root@%/*.*':
    user       => 'root@%',
    ensure     => 'present',
    options    => ['GRANT'],
    privileges => ['ALL'],
    table      => '*.*',
    require => Service['mysql'],
  }

  mysql::db{ ['laravel']:
    ensure  => present,
    user     => 'root',
    password => 'root',
    host => '%',
    grant    => ['ALL'],
    require => Service['mysql'],
  }

}