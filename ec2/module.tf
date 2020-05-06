provider "aws" {
  profile    = "default"
  version    = "2.58"
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ami" "debian" {
  most_recent = true

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  owners = ["136693071363"]
}

data "aws_ec2_instance_type_offering" "type" {
  count             = length(data.aws_availability_zones.available.names)

  filter {
    name   = "location"
    values = [element(data.aws_availability_zones.available.names, count.index)]
  }


  preferred_instance_types = ["t2.micro", "t3.micro", "t2.small", "t3.small", "t1.micro", "t1.small"]

  location_type = "availability-zone"
}

resource "aws_instance" "ec2" {
  count             = length(data.aws_availability_zones.available.names)
  ami               = data.aws_ami.debian.id
  instance_type     = data.aws_ec2_instance_type_offering.type[count.index].instance_type # "t2.micro"
  key_name          = "global_latency"
  security_groups   = [aws_security_group.global_latency_security_group.name]
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
}

resource "aws_key_pair" "global_ssh_key" {
  key_name   = "global_latency"
  public_key = file(var.public_key_path)
}

resource "aws_security_group" "global_latency_security_group" {
  name = "global_latency_security_group"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
