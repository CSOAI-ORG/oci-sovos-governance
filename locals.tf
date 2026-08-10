locals {
  protocol_number = {
    icmp   = 1
    icmpv6 = 58
    tcp    = 6
    udp    = 17
  }

  instance = {
    ubuntu = {
      shape : "VM.Standard.E2.1.Micro",
      operating_system = "Canonical Ubuntu",
      user_data : {
        runcmd : [
          "apt-get update",
          "apt-get install -y ca-certificates curl gnupg git",
          "install -m 0755 -d /etc/apt/keyrings",
          "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg",
          "chmod a+r /etc/apt/keyrings/docker.gpg",
          "echo \"deb [arch=\"$(dpkg --print-architecture)\" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo \"$VERSION_CODENAME\") stable\" | tee /etc/apt/sources.list.d/docker.list > /dev/null",
          "apt-get update",
          "apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin",
          "usermod -aG docker ubuntu",
          "curl -LsSf https://astral.sh/uv/install.sh | sh"
        ],
      },
    },
    oracle = {
      shape : "VM.Standard.A1.Flex",
      operating_system : "Oracle Linux",
      user_data : {
        runcmd : [
          "yum update -y",
          "yum install -y yum-utils device-mapper-persistent-data lvm2 git",
          "yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo",
          "yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin",
          "systemctl start docker",
          "systemctl enable docker",
          "usermod -aG docker opc",
          "curl -LsSf https://astral.sh/uv/install.sh | sh"
        ],
      },
    },
  }
}
