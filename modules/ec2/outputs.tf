output "web-public-dns" { value = "${aws_instance.server.public_dns}" }
output "web-public-ip"  { value = "${aws_instance.server.public_ip}" }