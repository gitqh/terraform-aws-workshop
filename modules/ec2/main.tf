resource "aws_instance" "server" {
  ami           = "${var.ami_id}"
  instance_type = "${var.aws_instance_type}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  key_name = "${var.key_name}"
  provisioner "file" {
    connection {
      user = "ec2-user"
      type        = "ssh"
      private_key = "${tls_private_key.bootstrap_private_key.private_key_pem}"
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
  tags = "${map("Name", "${var.tag_name}")}"
}

resource "tls_private_key" "bootstrap_private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "bootstrap_generated_key" {
  key_name   = "${var.key_name}"
  public_key = "${tls_private_key.bootstrap_private_key.public_key_openssh}"
}