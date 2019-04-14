class common::apparmor{

  service{'apparmor':
    ensure => stopped,
  }

}
