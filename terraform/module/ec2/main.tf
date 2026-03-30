resource "aws_instance" "vm_ansible" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id     = var.subnet_id
    key_name      = var.key_name

    vpc_security_group_ids = [var.security_group_id]
    associate_public_ip_address = true

    tags = {
        name = "vm-zabbix-agent"
    }

    user_data = base64encode(<<EOF
#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd

echo "Hello from Auto Scaling instance" > /var/www/html/index.html
EOF
  )
}