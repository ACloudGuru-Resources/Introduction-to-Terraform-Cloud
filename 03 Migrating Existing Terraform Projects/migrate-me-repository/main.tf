terraform {
  backend "s3" {
    bucket = "terraform-state-acloudguru"
    key    = "state.tfstate"
    region = "eu-west-1"
  }

  required_version = "1.2.9"
}

resource "aws_s3_bucket" "main" {
  bucket_prefix = "migrate-me"
}
