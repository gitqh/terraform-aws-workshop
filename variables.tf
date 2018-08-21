variable "http_port" {
  description = "define a variable http_port"
  default = 80
}

variable "ssh_port" {
  description = "define a variable ssh_port"
  default = 22
}

variable "key_name" {
  description = "Name of your AWS key pair"
  default = "quhang"
}

variable "key_path" {
  description = "path to your private key file"
  default = "credential.pem"
}

variable "aws_instance_type" {
  description = "aws instance type"
  default = "t2.nano"
}
