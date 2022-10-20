################################################################################
# Supporting Resources
################################################################################

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_elb_service_account" "current" {}


#####################
### VPC, Availability Zones and Subnets
#####################


data "aws_vpc" "custom" {
  default = false
}

data "aws_subnet" "private_a" {
  vpc_id = data.aws_vpc.custom.id

  tags = {
    Name = "*-private-a"
  }
}

data "aws_subnet" "private_b" {
  vpc_id = data.aws_vpc.custom.id

  tags = {
    Name = "*-private-b"
  }
}

data "aws_subnet" "public_a" {
  vpc_id = data.aws_vpc.custom.id

  tags = {
    Name = "*-public-a"
  }
}

data "aws_subnet" "public_b" {
  vpc_id = data.aws_vpc.custom.id

  tags = {
    Name = "*-public-b"
  }
}

data "aws_acm_certificate" "atlantis" {
  domain      = "atlantis-ecs-236211037.us-east-1.elb.amazonaws.com" #"${local.name}.${var.domain}"
  most_recent = true
  statuses    = ["ISSUED"]
  types       = ["IMPORTED"]
  key_types   = ["RSA_2048"]
}
