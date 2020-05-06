provider "azurerm" {
  version = "=2.0.0"
  features {}

  subscription_id             = var.subscription_id
  client_id                   = var.client_id
  client_certificate_path     = var.client_certificate_path
  client_certificate_password = var.client_certificate_password
  tenant_id                   = var.tenant_id
}

resource "azurerm_resource_group" "rg" {
  for_each = toset(var.regions)

  name     = "location-resource-group-${each.value}"
  location = each.value
}

resource "azurerm_virtual_network" "vpc" {
  for_each = azurerm_resource_group.rg

  name                = "vpc-network-${each.value["location"]}"
  address_space       = ["10.0.0.0/16"]
  location            = each.value["location"]
  resource_group_name = each.value["name"]

  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_subnet" "subnet" {
  for_each = azurerm_resource_group.rg

  name                 = "internal-${each.value["location"]}"
  resource_group_name  = each.value["name"]
  virtual_network_name = azurerm_virtual_network.vpc[each.value["location"]].name
  address_prefix       = "10.0.2.0/24"

  depends_on = [azurerm_virtual_network.vpc]
}

resource "azurerm_public_ip" "public_ip" {
  for_each = azurerm_resource_group.rg

  name                    = "public-ip-${each.value["location"]}"
  location                = each.value["location"]
  resource_group_name     = each.value["name"]
  allocation_method       = "Dynamic"
}

resource "azurerm_network_interface" "nic" {
  for_each = azurerm_resource_group.rg

  name                = "nic-${each.value["location"]}"
  location            = each.value["location"]
  resource_group_name = each.value["name"]

  ip_configuration {
    name                          = "interanet-${each.value["location"]}"
    subnet_id                     = azurerm_subnet.subnet[each.value["location"]].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.public_ip[each.value["location"]].id
  }

  depends_on = [azurerm_subnet.subnet, azurerm_public_ip.public_ip]
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each = azurerm_resource_group.rg
  
  name                = "azure-vm-${each.value["location"]}"
  resource_group_name = each.value["name"]
  location            = each.value["location"]

  size                = "Standard_F2s_v2"
  admin_username      = "adminus"
  
  network_interface_ids = [
    azurerm_network_interface.nic[each.value["location"]].id,
  ]

  admin_ssh_key {
    username   = "adminus"
    public_key = file(var.public_key_path)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Debian"
    offer     = "debian-10"
    sku       = "10"
    version   = "0.20200210.166"
  }

  depends_on = [azurerm_resource_group.rg, azurerm_network_interface.nic]
}
