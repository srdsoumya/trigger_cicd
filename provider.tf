terraform {
  backend "s3" {
    bucket = "mybucktest755"
    key    = "development/terraform/aws-s3/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = "DCP Project"
      Name        = "DCP Prod"
    }
  }
}

