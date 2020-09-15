# xsolla

Run `packer` for building VMs:
```bash
$ packer build -var 'ssh_key=<your_pub_shh_key>' ubuntu18.json.pkr.hcl
```


For init agents:
```bash
$ ssh ubuntu@127.0.0.1 -p 2202 -t 'sudo /opt/puppetlabs/bin/puppet agent -t'
$ ssh ubuntu@127.0.0.1 -p 2201 -t 'sudo /opt/puppetlabs/bin/puppet agent -t'
$ ssh ubuntu@127.0.0.1 -p 2200 -t 'sudo /opt/puppetlabs/bin/puppetserver ca sign --all'
```

For ssh to VMs:
```bash
$ ssh ubuntu@127.0.0.1 -p 2200 #Puppet server
$ ssh ubuntu@127.0.0.1 -p 2201 #Puppet 1
$ ssh ubuntu@127.0.0.1 -p 2202 #Puppet 2
```
