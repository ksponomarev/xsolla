variable "checksum" {
  type    = string
  default = "36f15879bd9dfd061cd588620a164a82972663fdd148cce1f70d57d314c21b73"
}

variable "iso_name" {
  type    = string
  default = "ubuntu-20.04-legacy-server-amd64.iso"
}

variable "vm_name" {
  type    = string
  default = "puppetserver"
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
  default = "http://cdimage.ubuntu.com/ubuntu-legacy-server/releases/20.04.1/release/ubuntu-20.04-legacy-server-amd64.iso"
}

# "timestamp" template function replacement
locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "virtualbox-iso" "puppetserver" {
  boot_command         = ["<esc><wait>","<esc><wait>","<enter><wait>","/install/vmlinuz<wait>"," auto<wait>"," console-setup/ask_detect=false<wait>"," console-setup/layoutcode=us<wait>"," console-setup/modelcode=pc105<wait>"," debconf/frontend=noninteractive<wait>"," debian-installer=en_US.UTF-8<wait>"," fb=false<wait>"," initrd=/install/initrd.gz<wait>"," kbd-chooser/method=us<wait>"," keyboard-configuration/layout=USA<wait>"," keyboard-configuration/variant=USA<wait>"," locale=en_US.UTF-8<wait>"," netcfg/get_domain=vm<wait>"," netcfg/get_hostname=ubuntu<wait>"," grub-installer/bootdev=/dev/sda<wait>"," noapic<wait>"," preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ubuntu18.cfg<wait>"," -- <wait>","<enter><wait>"]
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
  output_directory     = "${var.out_path}/puppetserver"
  shutdown_command     = "echo ${var.ssh_password}|sudo -S shutdown -P now"
  skip_export          = "true"
  ssh_password         = var.ssh_password
  ssh_port             = "22"
  ssh_pty              = "true"
  ssh_timeout          = "60m"
  ssh_username         = var.ssh_user
  vboxmanage           = [["modifyvm", "{{.Name}}", "--memory", "2048"], ["modifyvm", "{{.Name}}", "--cpus", "1"], ["modifyvm", "{{.Name}}", "--audio", "none"], ["modifyvm", "{{.Name}}", "--vram", "16"], ["modifyvm", "{{.Name}}", "--usb", "off"], ["modifyvm", "{{.Name}}", "--clipboard", "bidirectional"], ["modifyvm", "{{.Name}}", "--vrde", "off"]]
  vm_name              = "puppetserver"
}

source "virtualbox-iso" "p0" {
  boot_command         = ["<esc><wait>","<esc><wait>","<enter><wait>","/install/vmlinuz<wait>"," auto<wait>"," console-setup/ask_detect=false<wait>"," console-setup/layoutcode=us<wait>"," console-setup/modelcode=pc105<wait>"," debconf/frontend=noninteractive<wait>"," debian-installer=en_US.UTF-8<wait>"," fb=false<wait>"," initrd=/install/initrd.gz<wait>"," kbd-chooser/method=us<wait>"," keyboard-configuration/layout=USA<wait>"," keyboard-configuration/variant=USA<wait>"," locale=en_US.UTF-8<wait>"," netcfg/get_domain=vm<wait>"," netcfg/get_hostname=ubuntu<wait>"," grub-installer/bootdev=/dev/sda<wait>"," noapic<wait>"," preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ubuntu18.cfg<wait>"," -- <wait>","<enter><wait>"]
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
  vboxmanage           = [["modifyvm", "{{.Name}}", "--memory", "2048"], ["modifyvm", "{{.Name}}", "--cpus", "1"], ["modifyvm", "{{.Name}}", "--audio", "none"], ["modifyvm", "{{.Name}}", "--vram", "16"], ["modifyvm", "{{.Name}}", "--usb", "off"], ["modifyvm", "{{.Name}}", "--clipboard", "bidirectional"], ["modifyvm", "{{.Name}}", "--vrde", "off"]]
  vm_name              = "p0"
}

source "virtualbox-iso" "p1" {
  boot_command         = ["<esc><wait>","<esc><wait>","<enter><wait>","/install/vmlinuz<wait>"," auto<wait>"," console-setup/ask_detect=false<wait>"," console-setup/layoutcode=us<wait>"," console-setup/modelcode=pc105<wait>"," debconf/frontend=noninteractive<wait>"," debian-installer=en_US.UTF-8<wait>"," fb=false<wait>"," initrd=/install/initrd.gz<wait>"," kbd-chooser/method=us<wait>"," keyboard-configuration/layout=USA<wait>"," keyboard-configuration/variant=USA<wait>"," locale=en_US.UTF-8<wait>"," netcfg/get_domain=vm<wait>"," netcfg/get_hostname=ubuntu<wait>"," grub-installer/bootdev=/dev/sda<wait>"," noapic<wait>"," preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ubuntu18.cfg<wait>"," -- <wait>","<enter><wait>"]
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
  vboxmanage           = [["modifyvm", "{{.Name}}", "--memory", "2048"], ["modifyvm", "{{.Name}}", "--cpus", "1"], ["modifyvm", "{{.Name}}", "--audio", "none"], ["modifyvm", "{{.Name}}", "--vram", "16"], ["modifyvm", "{{.Name}}", "--usb", "off"], ["modifyvm", "{{.Name}}", "--clipboard", "bidirectional"], ["modifyvm", "{{.Name}}", "--vrde", "off"]]
  vm_name              = "p1"
}

# a build block invokes sources and runs provisionning steps on them. The
# documentation for build blocks can be found here:
# https://www.packer.io/docs/from-1.5/blocks/build
build {
  name = "puppetserver"
  sources = ["source.virtualbox-iso.puppetserver"]

  provisioner "shell" {
    inline = ["echo ${var.ssh_password}|sudo -S apt-get update -y", "sudo apt-get install aptitude python -y", "sudo sed -ie 's/%sudo\tALL=(ALL:ALL) ALL/%sudo\tALL=(ALL:ALL) NOPASSWD:ALL/g' /etc/sudoers"]
  }
}

build {
  name = "p0"
  sources = ["source.virtualbox-iso.p0"]

  provisioner "shell" {
    inline = ["echo ${var.ssh_password}|sudo -S apt-get update -y", "sudo apt-get install aptitude python -y", "sudo sed -ie 's/%sudo\tALL=(ALL:ALL) ALL/%sudo\tALL=(ALL:ALL) NOPASSWD:ALL/g' /etc/sudoers"]
  }
}

build {
  name = "p1"
  sources = ["source.virtualbox-iso.p1"]

  provisioner "shell" {
    inline = ["echo ${var.ssh_password}|sudo -S apt-get update -y", "sudo apt-get install aptitude python -y", "sudo sed -ie 's/%sudo\tALL=(ALL:ALL) ALL/%sudo\tALL=(ALL:ALL) NOPASSWD:ALL/g' /etc/sudoers"]
  }
}
