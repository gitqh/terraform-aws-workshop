variable "domain_name" {
  description = "domain name under workshop.oc-tw.net."
}

variable "zone_id" {
  description = "hosted zone id"
}

variable "records" {
  description = "public ip of ec2 instance"
  type = "list"
}
