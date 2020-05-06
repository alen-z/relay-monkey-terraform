provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_regions" "available" {
  filter {
    key = "available"
    values = ["true"]
  }
}

resource "digitalocean_ssh_key" "pub" {
  name       = "Terraform Public Key"
  public_key = file(var.public_key_path)
}

resource "digitalocean_droplet" "droplet" {
  count = length(data.digitalocean_regions.available.regions)

  image  = "debian-10-x64"
  name   = "droplet-${data.digitalocean_regions.available.regions[count.index]["slug"]}"
  region = data.digitalocean_regions.available.regions[count.index]["slug"]
  size   = "s-1vcpu-2gb"

  ssh_keys = [digitalocean_ssh_key.pub.fingerprint]
}
