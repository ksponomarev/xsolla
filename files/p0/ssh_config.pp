package { "openssh-server":
    ensure => latest,
  }

file_line { 'PasswordAuthentication':
  ensure            => present,
  path              => '/etc/ssh/sshd_config',
  line              => 'PasswordAuthentication no',
  match             => '#PasswordAuthentication yes',
  replace           => true
}

file_line { 'PubkeyAuthentication':
  ensure            => present,
  path              => '/etc/ssh/sshd_config',
  line              => 'PubkeyAuthentication yes',
  match             => '#PubkeyAuthentication yes',
  replace           => true
}

@@ssh_authorized_keys{"${home_dir}/.ssh/authorized_keys"

}
