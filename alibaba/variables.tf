variable "region" {}

variable "instance_type" {
  type = string
  default = "ecs.t5-lc1m2.small"
}

variable "public_key_path" {}

variable "private_key_path" {}

variable "alicloud_access_key" {}

variable "alicloud_secret_key" {}
