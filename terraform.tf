module "basic" {
  enabled = false
  source = "./src/basic"
}

output "basic_vpc_id" {
  value = module.basic
}
