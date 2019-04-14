package { [
  'lynx',
  'wget',
  'git',
  'zip',
  'build-essential'
  ]:
  ensure => present
}

host { 'db.local':
  ip => '192.168.60.100'
}

host { 'worker1.local':
  ip => '192.168.60.101'
}

host { 'worker2.local':
  ip => '192.168.60.102'
}

host { 'worker3.local':
  ip => '192.168.60.103'
}

host { 'worker4.local':
  ip => '192.168.60.104'
}

host { 'worker5.local':
  ip => '192.168.60.105'
}

class { 'apt':
  update => {
    frequency => 'daily',
  },
}

class { 'workers':
  require => Class['apt::update']
}
