variable "ami_id" {
  type = string
  default = "ami-0c02fb55956c7d316"
}

variable "instance_type" {
  default = "t3.micro"
}
variable "key_name" {
  type    = string
  default = null
}
variable "security_group_id" {}

variable "subnet_id" {
  description = "Subnet onde a EC2 será criada"
  type        = string
}