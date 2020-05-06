output "public_ips" {
  value = {
    for instance in alicloud_instance.instance:
    instance.instance_name => ["root", instance.public_ip, var.private_key_path]
  }
}
