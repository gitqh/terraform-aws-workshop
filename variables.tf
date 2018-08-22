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
  default = "quhang.pem"
}

variable "aws_instance_type" {
  description = "aws instance type"
  default = "t2.nano"
}

variable "ami_id" {
  description = "ami id"
  default = "ami-08569b978cc4dfa10"
}

variable "zone_id" {
  description = "hosted zone id"
  default = "Z2F25J92GG08RZ"
}

variable "domain_name" {
  description = "domain name under workshop.oc-tw.net."
  default = "quhang.workshop.oc-tw.net."
}

variable "tag_name" {
  description = "name of tags"
  default = "quhang"
}
