output "public_ips" {
  value = {
    for instance in azurerm_linux_virtual_machine.vm:
    instance.name => [instance.admin_username, instance.public_ip_address, var.private_key_path]
  }
}
