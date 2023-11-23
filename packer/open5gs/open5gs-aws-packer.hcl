packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "open5gs"
  instance_type = "t2.micro"
  region        = "ap-southeast-2"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

build {
  name = "open5gs"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]

  provisioner "shell" {
    environment_vars = [
      "FOO=hello world",
    ]
    inline = [
      "echo Installing Open5GS",
      "sleep 30",
      "sudo apt-get -y update",
      "sudo apt-get install -y gnupg wget tcpdump",
      "echo 'deb http://security.ubuntu.com/ubuntu focal-security main' | sudo tee /etc/apt/sources.list.d/focal-security.list",
      "sudo apt-get update",
      "sudo apt-get install libssl1.1",
      "sudo rm /etc/apt/sources.list.d/focal-security.list",
      "wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc > key.asc ",
      "sudo apt-key add key.asc",
      "echo 'deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse' | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list",
      "sleep 20",
      "sudo apt-get -y update",
      "sudo apt install -y mongodb-org",
      "sudo systemctl start mongod",
      "sudo systemctl enable mongod",
      "sudo add-apt-repository ppa:open5gs/latest",
      "sudo apt-get install -y software-properties-common",
      "sudo apt-get -y update",
      "sudo apt install -y open5gs",
      "sudo apt-get update && sudo apt-get install -y ca-certificates curl gnupg",
      "curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg",
      "echo 'deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main' | sudo tee /etc/apt/sources.list.d/nodesource.list",
      "sleep 30",
      "sudo apt-get update && sudo apt-get install nodejs -y",
      "sudo mkdir -p /usr/lib/node_modules/open5gs",
      "sudo curl -fsSL https://open5gs.org/open5gs/assets/webui/install | sudo -E bash -",
      "sudo systemctl daemon-reload",
      "sudo systemctl restart open5gs-webui",

    ]
  }

  provisioner "shell" {
    inline = ["echo Open5GS installed"]
  }
}