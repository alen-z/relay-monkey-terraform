output "public_ips" {
  value = {
    for instance in aws_instance.ec2:
    "aws-${instance.availability_zone}" => ["admin", instance.public_ip, var.private_key_path]
  }
}
