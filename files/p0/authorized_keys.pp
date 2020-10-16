@@file{ $::hostname:
  content    =>  "/home/ubuntu/.ssh/authorized_keys",
  
}

File <<| tag == "${::hostname}" |>>
