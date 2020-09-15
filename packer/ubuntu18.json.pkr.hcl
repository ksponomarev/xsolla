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
  boot_command         = ["<esc><wait>","<esc><wait>","<enter><wait>","/install/vmlinuz<wait>"," initrd=/install/initrd.gz"," auto-install/enable=true"," debconf/priority=critical"," preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ubuntu18.cfg<wait>"," -- <wait>","<enter><wait>"]
  boot_wait            = "10s"
  disk_size            = "10000"
  format               = "ova"
  guest_os_type        = "Ubuntu_64"
  hard_drive_interface = "sata"
  headless             = "true"
  http_directory       = "http"
  iso_checksum         = "sha256:${var.checksum}"
  iso_interface        = "sata"
  iso_urls             = [var.iso_name, var.url_iso]
  keep_registered      = "true"
  output_directory     = "${var.out_path}/p2"
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
                           ["modifyvm", "{{.Name}}", "--vrde", "off"]
                           ]
}

source "virtualbox-iso" "p0" {
  boot_command         = ["<esc><wait>","<esc><wait>","<enter><wait>","/install/vmlinuz<wait>"," initrd=/install/initrd.gz"," auto-install/enable=true"," debconf/priority=critical"," preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ubuntu18.cfg<wait>"," -- <wait>","<enter><wait>"]
  boot_wait            = "10s"
  disk_size            = "10000"
  format               = "ova"
  guest_os_type        = "Ubuntu_64"
  hard_drive_interface = "sata"
  headless             = "true"
  http_directory       = "http"
  iso_checksum         = "sha256:${var.checksum}"
  iso_interface        = "sata"
  iso_urls             = [var.iso_name, var.url_iso]
  keep_registered      = "true"
  output_directory     = "${var.out_path}/p0"
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
                           ["modifyvm", "{{.Name}}", "--vrde", "off"]
                           ]
}

source "virtualbox-iso" "p1" {
  boot_command         = ["<esc><wait>","<esc><wait>","<enter><wait>","/install/vmlinuz<wait>"," initrd=/install/initrd.gz"," auto-install/enable=true"," debconf/priority=critical"," preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ubuntu18.cfg<wait>"," -- <wait>","<enter><wait>"]
  boot_wait            = "10s"
  disk_size            = "10000"
  format               = "ova"
  guest_os_type        = "Ubuntu_64"
  hard_drive_interface = "sata"
  headless             = "true"
  http_directory       = "http"
  iso_checksum         = "sha256:${var.checksum}"
  iso_interface        = "sata"
  iso_urls             = [var.iso_name, var.url_iso]
  keep_registered      = "true"
  output_directory     = "${var.out_path}/p1"
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
                           ["modifyvm", "{{.Name}}", "--vrde", "off"]
                           ]
}

# a build block invokes sources and runs provisionning steps on them. The
# documentation for build blocks can be found here:
# https://www.packer.io/docs/from-1.5/blocks/build
// build {
//   name = "p2"
//   sources = ["source.virtualbox-iso.p2"]

//   provisioner "shell" {
//     inline = ["echo ${var.ssh_password}|sudo -S apt-get update -y", 
//               "wget https://apt.puppetlabs.com/puppet6-release-bionic.deb -o /tmp/puppet6-release-bionic.deb",
//               "sudo dpkg -i /tmp/puppet6-release-bionic.deb",
//               "sudo apt-get install aptitude python puppet-agent -y",
//               "sudo sed -ie 's/%sudo\tALL=(ALL:ALL) ALL/%sudo\tALL=(ALL:ALL) NOPASSWD:ALL/g' /etc/sudoers",
//               "mkdir -p ~/.ssh", "chmod 700 ~/.ssh","echo ${var.ssh_pub} > ~/.ssh/authorized_keys"]
//   }
// }

build {
  name = "p0"
  sources = [
    "source.virtualbox-iso.p0"
    ]

  provisioner "shell" {
    inline = ["echo ${var.ssh_password}|sudo -S apt-get update -qq",
              "sudo hostnamectl  set-hostname p0",
              "sudo sed -ie 's/%sudo\tALL=(ALL:ALL) ALL/%sudo\tALL=(ALL:ALL) NOPASSWD:ALL/g' /etc/sudoers",
              "mkdir -p ~/.ssh", "chmod 700 ~/.ssh","echo ${var.ssh_pub} > ~/.ssh/authorized_keys"]
  }

  provisioner "ansible" {
      playbook_file = "ansible/puppet.yml"
  }
  
  provisioner "ansible" {
      playbook_file = "ansible/puppet-agent.yml"
  }
  
  provisioner "file"{
    source = "files/p0/hosts"
    destination = "/etc/hosts"
  }
}

// build {
//   name = "p1"
//   sources = ["source.virtualbox-iso.p1"]

//   provisioner "shell" 
//     inline = ["echo ${var.ssh_password}|sudo -S apt-get update -y",
//               "wget https://apt.puppetlabs.com/puppet6-release-bionic.deb -o /tmp/puppet6-release-bionic.deb",
//               "sudo dpkg -i /tmp/puppet6-release-bionic.deb",
//               "sudo apt-get install aptitude python puppet-agent -y",
//               "sudo sed -ie 's/%sudo\tALL=(ALL:ALL) ALL/%sudo\tALL=(ALL:ALL) NOPASSWD:ALL/g' /etc/sudoers",
//               "mkdir -p ~/.ssh", "chmod 700 ~/.ssh","echo ${var.ssh_pub} > ~/.ssh/authorized_keys"]
//   }
// }
