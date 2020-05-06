output "public_ips" {
  value = {
    for instance in google_compute_instance.gcp_instance:
    instance.name => ["admin", lookup(lookup(instance.network_interface[0], "access_config")[0], "nat_ip"), var.private_key_path]
  }
}
