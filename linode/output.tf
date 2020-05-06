output "public_ips" {
  value = {
    for instance in linode_instance.instance:
    instance.label => ["root", instance.ip_address, var.private_key_path]
  }
}
