user { 'trial':
  ensure     => present,
  shell      => '/bin/bash',
  comment    => 'puppet user',
  home       => '/home/trial',
  password   => 'P@ssw0rd',
  managehome => true
}

file { '/home/trial/.ssh':
   ensure            =>  directory,
   owner             =>  'trial',
   group             =>  'trial',
   mode              =>  '0700'
 }

ssh_keygen { 'trial':
  home => '/home/trial',
  type => 'rsa',
  filename => '/home/trial/.ssh/id_rsa'
}
