terraform {
  cloud {
    organization = "terraform-cloud-organization"

    workspaces {
      name = "production"
    }
  }
}

resource "aws_s3_bucket" "main" {
  bucket_prefix = "migrate-me"
}

module "vpc-acg" {
  source  = "app.terraform.io/terraform-cloud-organization/vpc-acg/aws"
  version = "1.0.2"
  cidr    = var.tfc_subnet_cidr
}

variable "tfc_subnet_cidr" {}
