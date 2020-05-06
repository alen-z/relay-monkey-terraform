#######
# AWS #
#######

module "ec2-us-east-1" {
  source = "./ec2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "us-east-1"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
}

module "ec2-us-east-2" {
  source = "./ec2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "us-east-2"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
}

module "ec2-us-west-1" {
  source = "./ec2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "us-west-1"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
}

module "ec2-us-west-2" {
  source = "./ec2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "us-west-2"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
}

module "ec2-ap-east-1" {
  source = "./ec2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "ap-east-1"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
}

module "ec2-ap-south-1" {
  source = "./ec2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "ap-south-1"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
}

module "ec2-ap-northeast-2" {
  source = "./ec2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "ap-northeast-2"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
}

module "ec2-ap-southeast-1" {
  source = "./ec2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "ap-southeast-1"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
}

module "ec2-ap-southeast-2" {
  source = "./ec2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "ap-southeast-2"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
}

module "ec2-ap-northeast-1" {
  source = "./ec2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "ap-northeast-1"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
}

module "ec2-ca-central-1" {
  source = "./ec2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "ca-central-1"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
}

module "ec2-eu-central-1" {
  source = "./ec2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "eu-central-1"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
}

module "ec2-eu-west-1" {
  source = "./ec2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "eu-west-1"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
}

module "ec2-eu-west-2" {
  source = "./ec2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "eu-west-2"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
}

module "ec2-eu-west-3" {
  source = "./ec2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "eu-west-3"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
}

module "ec2-eu-north-1" {
  source = "./ec2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "eu-north-1"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
}

module "ec2-me-south-1" {
  source = "./ec2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "me-south-1"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
}

module "ec2-sa-east-1" {
  source = "./ec2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "sa-east-1"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
}

#########
# Azure #
#########

module "azure" {
  source = "./azure"
  regions = [
    "canadacentral",
    "centralus",
    "eastus",
    "eastus2",
    "japaneast",
    "koreacentral",
    "koreasouth",
    "southcentralus",
    "southeastasia",
    "westeurope",
    "westus",
    "westus2",
    # "australiacentral",
    # "australiaeast",
    # "australiasoutheast",
    # "brazilsouth",
    # "canadaeast",
    # "centralindia",
    # "eastasia",
    # "francecentral",
    # "germanywestcentral",
    # "japanwest",
    # "northcentralus",
    # "northeurope",
    # "norwayeast",
    # "southafricanorth",
    # "southindia",
    # "switzerlandnorth",
    # "uaenorth",
    # "uksouth",
    # "ukwest",
    # "westcentralus",
    # "westindia",
  ]
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
  subscription_id = var.azure_subscription_id
  client_id = var.azure_client_id
  client_certificate_path = var.azure_client_certificate_path
  client_certificate_password = var.azure_client_certificate_password
  tenant_id = var.azure_tenant_id
}

################
# DigitalOcean #
################

module "digitalocean" {
  source = "./digitalocean"
  public_key_path = var.public_key_path
  do_token = var.do_token
  private_key_path = var.private_key_path
}

###########
# Hetzner #
###########

module "hetzner" {
  source = "./hetzner"
  hcloud_token = var.hcloud_token
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
}

###########
# Alibaba #
###########

module "ali-cn-heyuan" {
  source = "./alibaba"
  region = "cn-heyuan"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
  alicloud_access_key = var.alicloud_access_key
  alicloud_secret_key = var.alicloud_secret_key
}


module "ali-cn-hongkong" {
  source = "./alibaba"
  region = "cn-hongkong"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
  alicloud_access_key = var.alicloud_access_key
  alicloud_secret_key = var.alicloud_secret_key
}

module "ali-ap-southeast-1" {
  source = "./alibaba"
  region = "ap-southeast-1"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
  alicloud_access_key = var.alicloud_access_key
  alicloud_secret_key = var.alicloud_secret_key
}

module "ali-ap-southeast-2" {
  source = "./alibaba"
  region = "ap-southeast-2"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
  alicloud_access_key = var.alicloud_access_key
  alicloud_secret_key = var.alicloud_secret_key
}

module "ali-ap-southeast-3" {
  source = "./alibaba"
  region = "ap-southeast-3"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
  alicloud_access_key = var.alicloud_access_key
  alicloud_secret_key = var.alicloud_secret_key
}

module "ali-ap-southeast-5" {
  source = "./alibaba"
  region = "ap-southeast-5"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
  alicloud_access_key = var.alicloud_access_key
  alicloud_secret_key = var.alicloud_secret_key
}

module "ali-ap-south-1" {
  source = "./alibaba"
  region = "ap-south-1"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
  alicloud_access_key = var.alicloud_access_key
  alicloud_secret_key = var.alicloud_secret_key
}

module "ali-ap-northeast-1" {
  source = "./alibaba"
  region = "ap-northeast-1"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
  alicloud_access_key = var.alicloud_access_key
  alicloud_secret_key = var.alicloud_secret_key
}

module "ali-us-west-1" {
  source = "./alibaba"
  region = "us-west-1"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
  alicloud_access_key = var.alicloud_access_key
  alicloud_secret_key = var.alicloud_secret_key
}

module "ali-us-east-1" {
  source = "./alibaba"
  region = "us-east-1"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
  alicloud_access_key = var.alicloud_access_key
  alicloud_secret_key = var.alicloud_secret_key
}

module "ali-eu-central-1" {
  source = "./alibaba"
  region = "eu-central-1"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
  alicloud_access_key = var.alicloud_access_key
  alicloud_secret_key = var.alicloud_secret_key
}

module "ali-eu-west-1" {
  source = "./alibaba"
  region = "eu-west-1"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
  alicloud_access_key = var.alicloud_access_key
  alicloud_secret_key = var.alicloud_secret_key
}

module "ali-me-east-1" {
  source = "./alibaba"
  region = "me-east-1"
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
  alicloud_access_key = var.alicloud_access_key
  alicloud_secret_key = var.alicloud_secret_key
}

# module "ali-cn-beijing" {
#   source = "./alibaba"
#   region = "cn-beijing"
#   public_key_path = var.public_key_path
#   private_key_path = var.private_key_path
#   alicloud_access_key = var.alicloud_access_key
#   alicloud_secret_key = var.alicloud_secret_key
# }

# module "ali-cn-chengdu" {
#   source = "./alibaba"
#   region = "cn-chengdu"
#   public_key_path = var.public_key_path
#   private_key_path = var.private_key_path
#   alicloud_access_key = var.alicloud_access_key
#   alicloud_secret_key = var.alicloud_secret_key
# }

# module "ali-cn-huhehaote" {
#   source = "./alibaba"
#   region = "cn-huhehaote"
#   public_key_path = var.public_key_path
#   private_key_path = var.private_key_path
#   alicloud_access_key = var.alicloud_access_key
#   alicloud_secret_key = var.alicloud_secret_key
# }

# module "ali-cn-qingdao" {
#   source = "./alibaba"
#   region = "cn-qingdao"
#   public_key_path = var.public_key_path
#   private_key_path = var.private_key_path
#   alicloud_access_key = var.alicloud_access_key
#   alicloud_secret_key = var.alicloud_secret_key
# }

# module "ali-cn-hangzhou" {
#   source = "./alibaba"
#   region = "cn-hangzhou"
#   public_key_path = var.public_key_path
#   private_key_path = var.private_key_path
#   alicloud_access_key = var.alicloud_access_key
#   alicloud_secret_key = var.alicloud_secret_key
# }

# module "ali-cn-shanghai" {
#   source = "./alibaba"
#   region = "cn-shanghai"
#   public_key_path = var.public_key_path
#   private_key_path = var.private_key_path
#   alicloud_access_key = var.alicloud_access_key
#   alicloud_secret_key = var.alicloud_secret_key
# }

# module "ali-cn-shenzhen" {
#   source = "./alibaba"
#   region = "cn-shenzhen"
#   public_key_path = var.public_key_path
#   private_key_path = var.private_key_path
#   alicloud_access_key = var.alicloud_access_key
#   alicloud_secret_key = var.alicloud_secret_key
# }

# module "ali-cn-zhangjiakou" {
#   source = "./alibaba"
#   region = "cn-zhangjiakou"
#   public_key_path = var.public_key_path
#   private_key_path = var.private_key_path
#   alicloud_access_key = var.alicloud_access_key
#   alicloud_secret_key = var.alicloud_secret_key
# }

#######
# GCP #
#######

module "gcp" {
  source = "./gcp"
  gcp_credentials_path = var.gcp_credentials_path
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
}

##########
# Linode #
##########

module "linode" {
  source = "./linode"
  linode_token = var.linode_token
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
  regions = [
    "ap-northeast",
    "ap-south",
    "ap-southeast",
    "ap-west",
    "ca-central",
    "eu-central",
    "eu-west",
    "us-central",
    "us-east",
    "us-southeast",
    "us-west",
  ]
}
