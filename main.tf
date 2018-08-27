module "ec2" {
  source = "modules/ec2/"
  ami_id = "ami-08569b978cc4dfa10"
  aws_instance_type = "t2.nano"
  key_name = "quhang"
  key_path = "~/.aws/quhang.pem"
  vpc_security_group_ids = ["${module.security.security_group_id}"] 
  tag_name = "quhang-terraform"
}

module "route53" {
  source = "modules/route53/"
  domain_name = "quhang.workshop.oc-tw.net."
  zone_id = "Z2F25J92GG08RZ"
  records = ["${module.ec2.web-public-ip}"]
}

module "security" {
  source = "modules/security/"
  http_port = 80
  ssh_port = 22
}



