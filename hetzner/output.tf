output "public_ips" {
  value = {
    for instance in hcloud_server.hetzner_node:
    instance.name => ["root", instance.ipv4_address, var.private_key_path]
  }
}
