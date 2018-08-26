resource "aws_instance" "server" {
  ami           = "${var.ami_id}"
  instance_type = "${var.aws_instance_type}"
  vpc_security_group_ids = ["${aws_security_group.quhang-sg.id}"] 
  key_name = "${var.key_name}"
  provisioner "file" {
    connection {
      user = "ec2-user"
      private_key = "${file(var.key_path)}"
    }
    source      = "./html"
    destination = "/tmp"
  }
  provisioner "remote-exec" {
    connection {
      user = "ec2-user"
      private_key = "${file(var.key_path)}"
    }
    inline = [
      "sudo yum install -y nginx",
      "sudo rm -rf /usr/share/nginx/html",
      "sudo mv /tmp/html /usr/share/nginx",
      "sudo service nginx start"
    ]
  }
  tags {
    Name = "${var.tag_name}"
  }
}

resource "aws_security_group" "quhang-sg" {
  name = "quhang-sg"
  ingress {
    from_port   = "${var.http_port}"     
    to_port     = "${var.http_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "${var.ssh_port}"      
    to_port     = "${var.ssh_port}"
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
}
resource "aws_route53_record" "www" {
  zone_id = "${var.zone_id}"
  name    = "${var.domain_name}"
  type    = "A"
  ttl     = "900"
  records = ["${aws_instance.server.public_ip}"]
}
