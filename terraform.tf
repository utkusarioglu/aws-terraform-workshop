module "basic" {
  enabled = false
  source  = "./src/basic"

  providers = {
    aws.eu_central_1 = aws.eu_central_1
  }
}

output "basic_vpc_id" {
  value = module.basic
}
