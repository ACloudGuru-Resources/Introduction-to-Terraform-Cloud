terraform {
  cloud {
    organization = "terraform-cloud-organization"

    workspaces {
      name = "common"
    }
  }
}

resource "random_pet" "vpc" {}
resource "random_pet" "s3" {}
resource "random_pet" "ec2" {}
resource "random_pet" "lambda" {}
