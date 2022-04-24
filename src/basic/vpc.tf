resource "aws_vpc" "test_vpc" {
  count = var.enabled ? 1 : 0
  cidr_block = "10.0.0.0/16"
}

output "aws_vpc_id" {
  value = aws_vpc.test_vpc.id
}
