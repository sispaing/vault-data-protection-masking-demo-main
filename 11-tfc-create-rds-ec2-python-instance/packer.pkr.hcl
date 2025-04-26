packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
  }
}

locals {
  packerstarttime = formatdate("YYYY-MM-DD-hhmm", timestamp())
  # Also here I believe naming this variable `buildtime` could lead to 
  # confusion mainly because this is evaluated a 'parsing-time'.
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "py-app-ubuntu-aws-${local.packerstarttime}"
  instance_type = "t2.micro"
  region        = "ap-southeast-1"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

build {
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
  provisioner "file" {
  source = "./app"
  destination = "/tmp"
}
  provisioner "shell" {
  inline = [
    "echo Create /opt/app",
    "sleep 5",
    "sudo apt-get update",
    "sudo mkdir /opt/app",
    "sudo mv /tmp/app/* /opt/app/",
    "cd /opt/app",
    "echo Installing python3-pip",
    "sleep 5",
    "sudo apt install -y python3-pip",
    "echo Installing Required Python Libraries",
    "sleep 5",
    "sudo pip3 install mysql-connector-python hvac flask --break-system-packages",
    
  ]
}

  provisioner "file" {
  source = "./entry-app.service"
  destination = "/tmp/entry-app.service"
}

  provisioner "shell" {
  inline = [
    "echo move the service file",
    "sleep 5",
    "sudo mv /tmp/entry-app.service /lib/systemd/system/",  
  ]
}
}




