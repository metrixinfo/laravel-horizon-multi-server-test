class workers {

  file { '/var/www/test.local':
    ensure => 'directory'
  }

  include common
  include workers::php
  include workers::nginx
  include workers::nodejs
  include workers::laravel
}
