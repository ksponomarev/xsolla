# xsolla



Run [packer](https://www.packer.io/downloads) for building VMs:
```bash
$ packer build -force -var 'ssh_pub=<your_pub_shh_key>' ubuntu18.json.pkr.hcl
```


If you want you can force init agents. But after start VMs they will connect to server during 2 minutes:
```bash
$ ssh ubuntu@127.0.0.1 -p 22202 -t 'sudo /opt/puppetlabs/bin/puppet agent -t'
$ ssh ubuntu@127.0.0.1 -p 22201 -t 'sudo /opt/puppetlabs/bin/puppet agent -t'
```

For ssh to VMs:
```bash
$ ssh ubuntu@127.0.0.1 -p 22200 #Puppet server
$ ssh ubuntu@127.0.0.1 -p 22201 #Puppet 1
$ ssh ubuntu@127.0.0.1 -p 22202 #Puppet 2
```
## TODO
Sync ssh_authorized_keys between agents
