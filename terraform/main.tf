provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "windows2019" {
  most_recent = true
  owners      = ["801119661308"]  # Microsoft
  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base-*"]
  }
}

resource "aws_instance" "windows" {
  ami = "ami-0ed9f8d63c9e8b95a"  # Windows Server 2019 Base - us-east-1
  instance_type = "t2.micro"
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "windows-iac"
  }

  user_data = <<-EOF
    <powershell>
    net user Administrator ${var.win_password}
    winrm quickconfig -quiet
    winrm set winrm/config/service '@{AllowUnencrypted="true"}'
    winrm set winrm/config/service/auth '@{Basic="true"}'
    Set-Item -Path WSMan:\\localhost\\Service\\AllowUnencrypted -Value $true
    Set-Item -Path WSMan:\\localhost\\Service\\Auth\\Basic -Value $true
    Enable-PSRemoting -Force
    Restart-Service WinRM
    New-NetFirewallRule -DisplayName "WinRM HTTP" -Direction Inbound -Protocol TCP -LocalPort 5985 -Action Allow
    New-NetFirewallRule -DisplayName "RDP" -Direction Inbound -Protocol TCP -LocalPort 3389 -Action Allow
    </powershell>
  EOF
}
