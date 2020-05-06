provider "google" {
  credentials = file(var.gcp_credentials_path)
  project     = "global-latency"
}

data "google_compute_regions" "available" {
  status = "UP"
}

data "google_compute_zones" "available" {
  for_each = toset(data.google_compute_regions.available.names)

  region = each.value
  status = "UP"
}

locals {
  region-zone = flatten([
    for region in data.google_compute_regions.available.names : [
      for zone in data.google_compute_zones.available[region].names : {
        region   = region
        zone = zone
      } if contains(var.exclude_zones, zone) != true
    ]
  ])
}

resource "google_compute_address" "static_ip" {
  count = length(local.region-zone)

  name = "ipv4-address-${local.region-zone[count.index].zone}-${count.index}"
  region = local.region-zone[count.index].region
}

resource "google_compute_instance" "gcp_instance" {
  count = length(local.region-zone)

  name         = "gcp-instance-${local.region-zone[count.index].zone}"
  machine_type = "n1-standard-1"
  zone         = local.region-zone[count.index].zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  metadata = {
   ssh-keys = "admin:${file(var.public_key_path)}"
  }

  network_interface {
    network = "default"

    access_config {
      nat_ip = google_compute_address.static_ip[count.index].address
    }
  }
}
