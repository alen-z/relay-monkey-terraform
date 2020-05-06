variable "gcp_credentials_path" {}

variable "public_key_path" {}

variable "private_key_path" {}

variable "exclude_zones" {
  type = list(string)
  default = [
    "asia-east2-a",
    "asia-northeast1-b",
    "asia-northeast1-c",
    "asia-south1-a",
    "asia-south1-b",
    "asia-south1-c",
    "australia-southeast1-c",
    "northamerica-northeast1-a",
    "us-west2-a",
  ]
}
