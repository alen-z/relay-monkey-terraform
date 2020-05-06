output "public_ips" {
  value = {
    for instance in digitalocean_droplet.droplet:
    instance.name => ["root", instance.ipv4_address, var.private_key_path]
  }
}
