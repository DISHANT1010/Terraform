terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.91.0"
    }
  }

  backend "s3" {
    bucket = "remot_backend_s3"
    key = "terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "lockfile_dynamodb_table"

  }
}