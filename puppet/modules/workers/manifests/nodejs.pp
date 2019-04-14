class workers::nodejs{

  # Install the npm package. This relies on apt-get update
  package { [
      'nodejs',
    ]:
    ensure => 'present',
  }

}
