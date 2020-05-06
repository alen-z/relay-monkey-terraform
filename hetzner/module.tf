provider "hcloud" {
  token = var.hcloud_token
  version = "1.16"
}

data "hcloud_datacenters" "dc" {
}

# data "hcloud_locations" "ds" {
# }

resource "hcloud_ssh_key" "pub" {
  name = "Terraform"
  public_key = file(var.public_key_path)
}

resource "hcloud_server" "hetzner_node" {
  count = length(data.hcloud_datacenters.dc.names)
  # count = length(data.hcloud_locations.ds.names)

  name = "hetzner-node-${element(data.hcloud_datacenters.dc.names, count.index)}"
  # name = "hetzner-node-${element(data.hcloud_locations.ds.names, count.index)}"

  image = "debian-10"
  server_type = "cx11"
  
  datacenter = element(data.hcloud_datacenters.dc.names, count.index)
  # location = element(data.hcloud_locations.ds.names, count.index)

  ssh_keys = [hcloud_ssh_key.pub.id]
}
