terraform {
  cloud {
    organization = "terraform-cloud-organization"

    workspaces {
      name = "production"
    }
  }
}

data "terraform_remote_state" "common" {
  backend = "remote"

  config = {
    organization = "terraform-cloud-organization"
    workspaces = {
      name = "common"
    }
  }
}

resource "aws_s3_bucket" "main" {
  bucket_prefix = "migrate-me"
}

module "vpc-acg" {
  source  = "app.terraform.io/terraform-cloud-organization/vpc-acg/aws"
  version = "1.0.3"
  cidr    = var.tfc_subnet_cidr
  name    = data.terraform_remote_state.common.outputs.vpc_name
}

variable "tfc_subnet_cidr" {}
