💪 Provisionamento de Infraestrutura com Terraform e Ansible (Windows + IIS na AWS)

🇧🇷 Descrição (Português)

Este projeto tem como objetivo provisionar uma instância Windows Server na AWS EC2, utilizando Terraform para infraestrutura como código (IaC) e Ansible para instalação e configuração automatizada do IIS (Internet Information Services).

✅ Funcionalidades

Criação de infraestrutura com Terraform

Instalação e configuração do IIS com Ansible

Acesso remoto via RDP

Validação via navegador da página do IIS

🔧 Tecnologias Utilizadas

Terraform

Ansible

AWS EC2

Windows Server 2019

Git / GitHub

🚀 Como Executar

Clone o repositório:

git clone https://github.com/lgrando12/iac-terraform-ansible-iis.git
cd iac-terraform-ansible-iis

Configure suas credenciais AWS:

aws configure

Preencha o arquivo terraform.tfvars:

key_name           = "nome-da-sua-chave"
subnet_id          = "subnet-xxxx"
security_group_id  = "sg-xxxx"
win_password       = "SenhaComplexaAqui123!"

Provisione a infraestrutura:

terraform init
terraform apply

Copie o public_ip retornado no output.

Atualize o arquivo ansible/inventory.ini com o IP e a senha:

[windows]
<public_ip>

[windows:vars]
ansible_user=Administrator
ansible_password=<Senha>
ansible_port=5985
ansible_connection=winrm
ansible_winrm_transport=basic
ansible_winrm_server_cert_validation=ignore

Execute o playbook do Ansible:

ansible-playbook -i ansible/inventory.ini ansible/playbook.yml

Acesse o navegador:

http://<public_ip>

🇺🇸 Description (English)

This project aims to provision a Windows Server instance on AWS EC2 using Terraform as infrastructure as code (IaC) and Ansible for automated installation and configuration of IIS (Internet Information Services).

✅ Features

Infrastructure creation using Terraform

Automated IIS setup with Ansible

Remote access via RDP

IIS page accessible via browser

🔧 Technologies Used

Terraform

Ansible

AWS EC2

Windows Server 2019

Git / GitHub

🚀 How to Run

Clone this repository:

git clone https://github.com/lgrando12/iac-terraform-ansible-iis.git
cd iac-terraform-ansible-iis

Configure AWS credentials:

aws configure

Fill the terraform.tfvars file:

key_name           = "your-key-name"
subnet_id          = "subnet-xxxx"
security_group_id  = "sg-xxxx"
win_password       = "StrongPassword123!"

Provision the infrastructure:

terraform init
terraform apply

Copy the output public_ip.

Update the ansible/inventory.ini file with the IP and password:

[windows]
<public_ip>

[windows:vars]
ansible_user=Administrator
ansible_password=<Password>
ansible_port=5985
ansible_connection=winrm
ansible_winrm_transport=basic
ansible_winrm_server_cert_validation=ignore

Run the Ansible playbook:

ansible-playbook -i ansible/inventory.ini ansible/playbook.yml

Open your browser:

http://<public_ip>

📌 Author: Lucas Grando📁 Repository: https://github.com/lgrando12/iac-terraform-ansible-iis🗓️ Project Type: DevOps / IaC / Automation

