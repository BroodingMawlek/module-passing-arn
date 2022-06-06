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

}


  module "kms" {
  source = "./modules/kms"
}

