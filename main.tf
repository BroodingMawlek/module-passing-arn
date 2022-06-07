terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "3.74.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

  module "s3_bucket" {
  source = "./modules/S3"
  kms_master_key_id = module.kms.kms_arn
}

  module "kms" {
  source = "./modules/kms"
}

