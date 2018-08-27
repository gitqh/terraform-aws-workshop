variable "ami_id" {
  description = "ami id"
}

variable "aws_instance_type" {
  description = "aws instance type"
}

variable "tag_name" {
  description = "name of tag"
}

variable "key_name" {
  description = "Name of your AWS key pair"
}

variable "vpc_security_group_ids" {
  description = "the security group ids in vpc"
  type = "list"
}

variable "key_path" {
  description = "path to your private key file"
}