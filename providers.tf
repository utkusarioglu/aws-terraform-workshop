terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.11.0"
    }
  }
  backend "s3" {
    bucket         = "ws-aws-terraform-state"
    key            = "global/s3/terraform.tfstate"
    region         = local.region
    dynamodb_table = "ws-aws-terraform-gh-actions-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = local.region
}
