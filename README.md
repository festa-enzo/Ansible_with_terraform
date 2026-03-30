Zabbix Agent Provisionado com Terraform + Ansible

Este projeto demonstra a automação completa de infraestrutura e configuração utilizando Terraform e Ansible para provisionar uma instância AWS e instalar/configurar o Zabbix Agent.

🚀 Visão Geral

O fluxo do projeto é:

Terraform provisiona a infraestrutura na AWS:
VPC
Subnet
Security Group
Instância EC2

Ansible realiza a configuração da instância:
Instala o Zabbix Agent
Configura o serviço
Libera comunicação com o servidor Zabbix

🧱 Tecnologias Utilizadas

Terraform → Provisionamento de infraestrutura (IaC)
Ansible → Configuração e automação
AWS EC2 → Servidor Linux
Zabbix Agent → Monitoramento
SSH → Comunicação com a instância

⚙️ Pré-requisitos

Antes de executar o projeto, você precisa ter:

Terraform instalado
Ansible instalado
Conta AWS configurada (aws configure)
Chave SSH configurada
Permissões adequadas na AWS (EC2, VPC, SG)

🏗️ Provisionando a Infraestrutura (Terraform)

Acesse a pasta:

cd terraform

Inicialize o Terraform:

terraform init

Planeje a execução:

terraform plan

Aplique:

terraform apply

Após a execução, o Terraform irá retornar outputs como:

IP público da instância
IDs de recursos

🔧 Configuração com Ansible

Após a criação da infraestrutura:

Atualize o inventory com o IP da EC2 (ou automatize via output)
Execute o playbook:
cd ../ansible

ansible-playbook -i inventory playbook.yml

📌 O que o Ansible faz?

O playbook:

Instala o Zabbix Agent

Configura o arquivo:

/etc/zabbix/zabbix_agentd.conf
Define:
Server (IP do Zabbix Server)
Hostname
Reinicia e habilita o serviço

🔐 Security Group

O módulo sg libera:

Porta 22 (SSH) → acesso remoto
Porta 10050 (Zabbix Agent) → comunicação com o servidor

🔄 Integração Terraform + Ansible

Este projeto pode ser melhorado com:

Uso de terraform output para alimentar o inventory automaticamente
Uso de dynamic inventory no Ansible
Pipeline CI/CD (GitHub Actions, GitLab CI)

📈 Possíveis Melhorias

Criar módulo para Zabbix Server
Automatizar registro do host no Zabbix
Usar Ansible roles
Implementar autoscaling
Adicionar Load Balancer
Usar SSM ao invés de SSH

🧠 Aprendizados

Este projeto cobre:

Infraestrutura como código (IaC)
Modularização no Terraform
Automação com Ansible
Integração entre ferramentas DevOps
Provisionamento + Configuração (Day 1 + Day 2)

👨‍💻 Autor

Projeto desenvolvido para estudo e prática de DevOps com foco em:

Terraform
AWS
Ansible
Monitoramento com Zabbix
