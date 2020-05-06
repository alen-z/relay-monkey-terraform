output "aws_public_ips" {
  value = [
    module.ec2-ap-east-1.public_ips,
    module.ec2-ap-northeast-1.public_ips,
    module.ec2-ap-northeast-2.public_ips,
    module.ec2-ap-south-1.public_ips,
    module.ec2-ap-southeast-1.public_ips,
    module.ec2-ap-southeast-2.public_ips,
    module.ec2-ca-central-1.public_ips,
    module.ec2-eu-central-1.public_ips,
    module.ec2-eu-north-1.public_ips,
    module.ec2-eu-west-1.public_ips,
    module.ec2-eu-west-2.public_ips,
    module.ec2-eu-west-3.public_ips,
    module.ec2-me-south-1.public_ips,
    module.ec2-sa-east-1.public_ips,
    module.ec2-us-east-1.public_ips,
    module.ec2-us-east-2.public_ips,
    module.ec2-us-west-1.public_ips,
    module.ec2-us-west-2.public_ips,
  ]
}

output "azure_public_ips" {
  value = [
    module.azure.public_ips
  ]
}

output "digitalocean_public_ips" {
  value = [
    module.digitalocean.public_ips
  ]
}

output "hetzner_public_ips" {
  value = [
    module.hetzner.public_ips
  ]
}

output "alibaba_public_ips" {
  value = [
    # module.ali-cn-beijing.public_ips,
    # module.ali-cn-chengdu.public_ips,
    # module.ali-cn-hangzhou.public_ips,
    # module.ali-cn-huhehaote.public_ips,
    # module.ali-cn-qingdao.public_ips,
    # module.ali-cn-shanghai.public_ips,
    # module.ali-cn-shenzhen.public_ips,
    # module.ali-cn-zhangjiakou.public_ips,
    module.ali-ap-northeast-1.public_ips,
    module.ali-ap-south-1.public_ips,
    module.ali-ap-southeast-1.public_ips,
    module.ali-ap-southeast-2.public_ips,
    module.ali-ap-southeast-3.public_ips,
    module.ali-ap-southeast-5.public_ips,
    module.ali-cn-heyuan.public_ips,
    module.ali-cn-hongkong.public_ips,
    module.ali-eu-central-1.public_ips,
    module.ali-eu-west-1.public_ips,
    module.ali-me-east-1.public_ips,
    module.ali-us-east-1.public_ips,
    module.ali-us-west-1.public_ips,
  ]
}

output "gcp_public_ips" {
  value = [
    module.gcp.public_ips
  ]
}

output "linode_public_ips" {
  value = [
    module.linode.public_ips
  ]
}
