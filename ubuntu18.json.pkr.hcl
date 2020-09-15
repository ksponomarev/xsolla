variable "checksum" {
  type    = string
  default = "8c5fc24894394035402f66f3824beb7234b757dd2b5531379cb310cedfdf0996"
}

variable "iso_name" {
  type    = string
  default = "ubuntu-18.04.5-server-amd64.iso"
}

variable "out_path" {
  type    = string
  default = "/home/p/VirtualBox/ova"
}

variable "ssh_password" {
  type    = string
  default = "ubuntu"
}

variable "output_folder" {
  default = "/tmp/"
}

variable "ssh_user" {
  type    = string
  default = "ubuntu"
}

variable "url_iso" {
  type    = string
  default = "http://cdimage.ubuntu.com/releases/bionic/release/ubuntu-18.04.5-server-amd64.iso"
}

variable "ssh_pub"{}

# "timestamp" template function replacement
locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "virtualbox-iso" "p2" {
  boot_command         = ["<esc><wait>","<esc><wait>",
                          "<enter><wait>","/install/vmlinuz<wait>",
                          " initrd=/install/initrd.gz"," auto-install/enable=true",
                          " interface=enp0s3",
                          " debconf/priority=critical"," preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ubuntu18.cfg<wait>",
                          " -- <wait>","<enter><wait>"
                          ]
  boot_wait            = "10s"
  disk_size            = "5000"
  format               = "ova"
  guest_os_type        = "Ubuntu_64"
  hard_drive_interface = "sata"
  headless             = "true"
  http_directory       = "http"
  iso_checksum         = "sha256:${var.checksum}"
  iso_interface        = "sata"
  iso_urls             = [var.iso_name, var.url_iso]
  keep_registered      = "true"
  // output_directory     = "${var.output_folder}/p0"
  shutdown_command     = "echo ${var.ssh_password}|sudo -S shutdown -P now"
  skip_export          = "true"
  ssh_password         = var.ssh_password
  ssh_port             = "22"
  ssh_pty              = "true"
  ssh_timeout          = "60m"
  ssh_username         = var.ssh_user
  vboxmanage           = [["modifyvm", "{{.Name}}", "--memory", "2048"], 
                           ["modifyvm", "{{.Name}}", "--cpus", "1"],
                           ["modifyvm", "{{.Name}}", "--audio", "none"], 
                           ["modifyvm", "{{.Name}}", "--vram", "16"], 
                           ["modifyvm", "{{.Name}}", "--usb", "off"], 
                           ["modifyvm", "{{.Name}}", "--clipboard", "bidirectional"], 
                           ["modifyvm", "{{.Name}}", "--vrde", "off"],
                           ["modifyvm", "{{.Name}}", "--nic1", "nat"],
                           ["modifyvm", "{{.Name}}", "--natpf1", "ssh,tcp,127.0.0.1,22202,,22"],
                           ["modifyvm", "{{.Name}}", "--nic2", "intnet"],
                           ["modifyvm", "{{.Name}}", "--intnet1", "intnet"],
                           ["modifyvm", "{{.Name}}", "--graphicscontroller","vmsvga"]
                           ]
}

source "virtualbox-iso" "p0" {
  boot_command         = ["<esc><wait>","<esc><wait>",
                          "<enter><wait>","/install/vmlinuz<wait>",
                          " initrd=/install/initrd.gz"," auto-install/enable=true",
                          " interface=enp0s3",
                          " debconf/priority=critical"," preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ubuntu18.cfg<wait>",
                          " -- <wait>","<enter><wait>"
                          ]
  boot_wait            = "10s"
  disk_size            = "5000"
  format               = "ova"
  guest_os_type        = "Ubuntu_64"
  hard_drive_interface = "sata"
  headless             = "true"
  http_directory       = "http"
  iso_checksum         = "sha256:${var.checksum}"
  iso_interface        = "sata"
  iso_urls             = [var.iso_name, var.url_iso]
  keep_registered      = "true"
  // output_directory     = "${var.output_folder}/p0"
  shutdown_command     = "echo ${var.ssh_password}|sudo -S shutdown -P now"
  skip_export          = "true"
  ssh_password         = var.ssh_password
  ssh_port             = "22"
  ssh_pty              = "true"
  ssh_timeout          = "60m"
  ssh_username         = var.ssh_user
  vboxmanage           = [["modifyvm", "{{.Name}}", "--memory", "4096"], 
                           ["modifyvm", "{{.Name}}", "--cpus", "1"],
                           ["modifyvm", "{{.Name}}", "--audio", "none"], 
                           ["modifyvm", "{{.Name}}", "--vram", "16"], 
                           ["modifyvm", "{{.Name}}", "--usb", "off"], 
                           ["modifyvm", "{{.Name}}", "--clipboard", "bidirectional"], 
                           ["modifyvm", "{{.Name}}", "--vrde", "off"],
                           ["modifyvm", "{{.Name}}", "--nic1", "nat"],
                           ["modifyvm", "{{.Name}}", "--natpf1", "ssh,tcp,127.0.0.1,22200,,22"],
                           ["modifyvm", "{{.Name}}", "--nic2", "intnet"],
                           ["modifyvm", "{{.Name}}", "--intnet1", "intnet"],
                           ["modifyvm", "{{.Name}}", "--graphicscontroller","vmsvga"]
                           ]
}

source "virtualbox-iso" "p1" {
  boot_command         = ["<esc><wait>","<esc><wait>",
                          "<enter><wait>","/install/vmlinuz<wait>",
                          " initrd=/install/initrd.gz"," auto-install/enable=true",
                          " interface=enp0s3",
                          " debconf/priority=critical"," preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ubuntu18.cfg<wait>",
                          " -- <wait>","<enter><wait>"
                          ]
  boot_wait            = "10s"
  disk_size            = "5000"
  format               = "ova"
  guest_os_type        = "Ubuntu_64"
  hard_drive_interface = "sata"
  headless             = "true"
  http_directory       = "http"
  iso_checksum         = "sha256:${var.checksum}"
  iso_interface        = "sata"
  iso_urls             = [var.iso_name, var.url_iso]
  keep_registered      = "true"
  // output_directory     = var.output_folder
  shutdown_command     = "echo ${var.ssh_password}|sudo -S shutdown -P now"
  skip_export          = "true"
  ssh_password         = var.ssh_password
  ssh_port             = "22"
  ssh_pty              = "true"
  ssh_timeout          = "60m"
  ssh_username         = var.ssh_user
  vboxmanage           = [["modifyvm", "{{.Name}}", "--memory", "2048"], 
                           ["modifyvm", "{{.Name}}", "--cpus", "1"],
                           ["modifyvm", "{{.Name}}", "--audio", "none"], 
                           ["modifyvm", "{{.Name}}", "--vram", "16"], 
                           ["modifyvm", "{{.Name}}", "--usb", "off"], 
                           ["modifyvm", "{{.Name}}", "--clipboard", "bidirectional"], 
                           ["modifyvm", "{{.Name}}", "--vrde", "off"],
                           ["modifyvm", "{{.Name}}", "--nic1", "nat"],
                           ["modifyvm", "{{.Name}}", "--natpf1", "ssh,tcp,127.0.0.1,22201,,22"],
                           ["modifyvm", "{{.Name}}", "--nic2", "intnet"],
                           ["modifyvm", "{{.Name}}", "--intnet1", "intnet"],
                           ["modifyvm", "{{.Name}}", "--graphicscontroller","vmsvga"]
                           ]
}

build {
  sources = [
    "source.virtualbox-iso.p2"
    ]
  provisioner "file"{
    source = "files/p2/01-netcfg.yaml"
    destination = "/tmp/01-netcfg.yaml"
  }
  provisioner "shell" {
    inline = ["echo ${var.ssh_password}| sudo -S apt-get update -qq",
              "sudo sed -ie 's/%sudo\tALL=(ALL:ALL) ALL/%sudo\tALL=(ALL:ALL) NOPASSWD:ALL/g' /etc/sudoers",
              "sudo cp /tmp/01-netcfg.yaml /etc/netplan/01-netcfg.yaml",
              "sudo hostnamectl set-hostname p2",
              "echo '192.168.1.1 puppet.home.local puppet' | sudo tee -a /etc/hosts",
              "mkdir -p ~/.ssh", "chmod 700 ~/.ssh","echo ${var.ssh_pub} > ~/.ssh/authorized_keys",
              "wget https://apt.puppetlabs.com/puppet6-release-bionic.deb -O /tmp/puppet6-release-bionic.deb",
              "sudo dpkg -i /tmp/puppet6-release-bionic.deb",
              "sudo apt-get update -qq",
              "sudo apt-get install -y puppet-agent",
              "sudo /opt/puppetlabs/bin/puppet config set server puppet.home.local --section main",
              "sudo sed -i 's/#Domains=/Domains=home.local/' /etc/systemd/resolved.conf"]
  }
}

build {
  sources = [
    "source.virtualbox-iso.p0"
    ]

  provisioner "file"{
    source = "files/p0/01-netcfg.yaml"
    destination = "/tmp/01-netcfg.yaml"
  }

  provisioner "file"{
      source = "files/p0/ssh_config.pp"
      destination = "/tmp/ssh_config.pp"
    }
  
  provisioner "file"{
      source = "files/p0/user.pp"
      destination = "/tmp/user.pp"
    }

  provisioner "shell" {
    inline = ["echo ${var.ssh_password}| sudo -S apt-get update -qq",
              "sudo sed -ie 's/%sudo\tALL=(ALL:ALL) ALL/%sudo\tALL=(ALL:ALL) NOPASSWD:ALL/g' /etc/sudoers",
              "sudo cp /tmp/01-netcfg.yaml /etc/netplan/01-netcfg.yaml",
              "echo '127.0.0.1 puppet.home.local puppet' | sudo tee -a /etc/hosts",
              "mkdir -p ~/.ssh", "chmod 700 ~/.ssh","echo ${var.ssh_pub} > ~/.ssh/authorized_keys",
              "sudo hostnamectl set-hostname puppet",
              "wget https://apt.puppetlabs.com/puppet6-release-bionic.deb -O /tmp/puppet6-release-bionic.deb",
              "sudo dpkg -i /tmp/puppet6-release-bionic.deb",
              "sudo apt-get update -qq",
              "sudo apt-get install -y puppetserver",
              "sudo systemctl enable puppetserver",
              "sudo systemctl start puppetserver",
              "sudo cp /tmp/user.pp /etc/puppetlabs/code/environments/production/manifests/user.pp",
              "sudo cp /tmp/ssh_config.pp /etc/puppetlabs/code/environments/production/manifests/ssh_config.pp",
              "sudo /opt/puppetlabs/bin/puppet module install puppet-ssh_keygen",
              "sudo sed -i 's/#Domains=/Domains=home.local/' /etc/systemd/resolved.conf"]
  }
}


build {
  sources = [
    "source.virtualbox-iso.p1"
    ]
  provisioner "file"{
    source = "files/p1/01-netcfg.yaml"
    destination = "/tmp/01-netcfg.yaml"
  }
  provisioner "shell" {
    inline = ["echo ${var.ssh_password}| sudo -S apt-get update -qq",
              "sudo sed -ie 's/%sudo\tALL=(ALL:ALL) ALL/%sudo\tALL=(ALL:ALL) NOPASSWD:ALL/g' /etc/sudoers",
              "sudo cp /tmp/01-netcfg.yaml /etc/netplan/01-netcfg.yaml",
              "sudo hostnamectl set-hostname p1",
              "echo '192.168.1.1 puppet.home.local puppet' | sudo tee -a /etc/hosts",
              "mkdir -p ~/.ssh", "chmod 700 ~/.ssh","echo ${var.ssh_pub} > ~/.ssh/authorized_keys",
              "wget https://apt.puppetlabs.com/puppet6-release-bionic.deb -O /tmp/puppet6-release-bionic.deb",
              "sudo dpkg -i /tmp/puppet6-release-bionic.deb",
              "sudo apt-get update -qq",
              "sudo apt-get install -y puppet-agent",
              "sudo /opt/puppetlabs/bin/puppet config set server puppet.home.local --section main",
              "sudo sed -i 's/#Domains=/Domains=home.local/' /etc/systemd/resolved.conf"]
  }
}
