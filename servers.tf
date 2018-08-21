provider "aws" {
  region = "ap-southeast-1"
}
resource "aws_instance" "server" {
  ami           = "ami-08569b978cc4dfa10"
  # instance_type = "{$var.aws_instance_type}"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.quhang-sg.id}"] 
  key_name = "quhang"
  provisioner "remote-exec" {
    connection {
      user = "ec2-user"
      private_key = "${file(var.key_path)}"
    }
    
    inline = [
      "sudo yum install -y nginx",
      # "sudo rm -rf /usr/share/nginx/html",
      "sudo service nginx start"
    ]
  }
  tags {
    Name = "quhang"
  }
}

resource "aws_security_group" "quhang-sg" {
  ingress {
    from_port   = 80      
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22      
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  lifecycle {
    create_before_destroy = true
  }
  tags {
    Name = "quhang-sg"
  }
}

# resource "aws_route53_zone" "primary" {
#   name = "workshop.oc-tw.net."
# }

resource "aws_route53_record" "www" {
  # zone_id = "${aws_route53_zone.primary.zone_id}"
  zone_id = "Z2F25J92GG08RZ"
  name    = "quhang.workshop.oc-tw.net."
  type    = "CNAME"
  ttl     = "900"
  records = ["${aws_instance.server.public_ip}"]
}
