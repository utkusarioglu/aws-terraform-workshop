

module "vpc" {
  provider   = aws.eu_central_1
  create_vpc = false
  source     = "terraform-aws-modules/vpc/aws"

  name = "aws-terraform-workshop"
  cidr = "10.0.0.0/16"

  azs = data.aws_availability_zones.eu_central_1.names
  private_subnets = [
    for s in range(length(data.aws_availability_zones.eu_central_1.names))
    : "10.0.${s + 1}.0/24"
  ]
  public_subnets = [
    for s in range(length(data.aws_availability_zones.eu_central_1.names))
    : "10.0.${s + 101}.0/24"
  ]

  enable_nat_gateway = false
  enable_vpn_gateway = false
  single_nat_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
