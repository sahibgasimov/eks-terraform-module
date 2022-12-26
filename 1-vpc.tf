provider "aws"{
    region = "us-east-1"
}
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.3"

  name = "main"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"] 
  private_subnets = ["10.0.0.0/19", "10.0.32.0/19"] #nodes are on NAT GW
  public_subnets  = ["10.0.64.0/19", "10.0.96.0/19"] # Public needs for applications to be exposed publicly

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  enable_dns_hostnames = true
  enable_dns_support   = true # needs for many services like efs 

  tags = {
    Environment = "staging"
  }
}
