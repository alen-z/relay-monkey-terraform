# TODO: Try with one security zone.

provider "alicloud" {
  access_key = var.alicloud_access_key
  secret_key = var.alicloud_secret_key
  region     = var.region
}

# Slow query
data "alicloud_images" "default" {
  name_regex  = "^debian_10"
  most_recent = true
  owners      = "system"
}

# Zones for region configured in provider
data "alicloud_zones" "small_instance" {
  available_instance_type = var.instance_type
}

resource "alicloud_vpc" "vpc" {
  count = length(data.alicloud_zones.small_instance.zones)

  name = "vpc-${data.alicloud_zones.small_instance.zones[count.index].id}"
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_security_group" "group" {
  count = length(data.alicloud_zones.small_instance.zones)

  name   = "terraform-group-${data.alicloud_zones.small_instance.zones[count.index].id}"
  vpc_id = alicloud_vpc.vpc[count.index].id
}

resource "alicloud_security_group_rule" "allow_all_in" {
  count = length(data.alicloud_zones.small_instance.zones)

  type              = "ingress"
  ip_protocol       = "all"
  port_range        = "1/65535"
  security_group_id = alicloud_security_group.group[count.index].id
  cidr_ip           = "0.0.0.0/0"
}

resource "alicloud_security_group_rule" "allow_all_out" {
  count = length(data.alicloud_zones.small_instance.zones)

  type              = "egress"
  ip_protocol       = "all"
  port_range        = "1/65535"
  security_group_id = alicloud_security_group.group[count.index].id
  cidr_ip           = "0.0.0.0/0"
}

resource "alicloud_key_pair" "pub" {
  count = length(data.alicloud_zones.small_instance.zones)

  resource_group_id = alicloud_vpc.vpc[count.index].resource_group_id
  key_name_prefix = "terraform-pub-${data.alicloud_zones.small_instance.zones[count.index].id}"
  public_key = file(var.public_key_path)
}

resource "alicloud_vswitch" "vsw" {
  count = length(data.alicloud_zones.small_instance.zones)

  name = "vsw-${data.alicloud_zones.small_instance.zones[count.index].id}"
  availability_zone = data.alicloud_zones.small_instance.zones[count.index].id
  vpc_id            = alicloud_vpc.vpc[count.index].id
  cidr_block        = "172.16.0.0/21"
}

resource "alicloud_instance" "instance" {
  count = length(data.alicloud_zones.small_instance.zones)

  availability_zone = data.alicloud_zones.small_instance.zones[count.index].id
  image_id              = data.alicloud_images.default.images.0.id

  instance_type        = var.instance_type
  security_groups      = [alicloud_security_group.group[count.index].id]
  instance_name        = "ali-${data.alicloud_zones.small_instance.zones[count.index].id}"
  vswitch_id           = alicloud_vswitch.vsw[count.index].id
  system_disk_size     = 20
  key_name             = alicloud_key_pair.pub[count.index].key_name

  # Add public IP
  internet_max_bandwidth_out = 1
}
