module "ec2" {
  source = "github.com/gitqh/terraform-aws-workshop//modules/ec2?ref=v0.0.1"
  ami_id = "ami-08569b978cc4dfa10"
  aws_instance_type = "t2.nano"
  key_name = "quhang"
  key_path = "~/.aws/quhang.pem"
  vpc_security_group_ids = ["${module.security.security_group_id}"] 
  tag_name = "quhang-terraform"
}

module "route53" {
  source = "github.com/gitqh/terraform-aws-workshop//modules/route53?ref=v0.0.1"
  domain_name = "quhang.workshop.oc-tw.net."
  zone_id = "Z2F25J92GG08RZ"
  records = ["${module.ec2.web-public-ip}"]
}

module "security" {
  source = "github.com/gitqh/terraform-aws-workshop//modules/security?ref=v0.0.1"
  http_port = 80
  ssh_port = 22
}



