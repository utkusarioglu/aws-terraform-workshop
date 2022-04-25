module "basic" {
  enabled = true
  source = "./src/basic"
}

output "basic_vpc_id" {
  value = module.basic
}
