provider "linode" {
  token = var.linode_token
}

resource "linode_instance" "instance" {
    for_each = toset(var.regions)

    label = "linode-instance-${each.value}"
    region = each.value

    image = "linode/debian10"
    type = "g6-standard-1"
    authorized_keys = [trimspace(file(var.public_key_path))]

    swap_size = 256
}
