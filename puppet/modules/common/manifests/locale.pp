class common::locale {

  class { 'locales':
    default_locale  => 'en_US.UTF-8',
    locales         => ['en_US.UTF-8 UTF-8', 'es_US.UTF-8 UTF-8', 'en_GB.UTF-8 UTF-8'],
  }

}