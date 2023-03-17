terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.59.0"
    }
  }
}

provider "aws" {
  # Change this region if needed, be aware referencing AMIs by name will change on Region
  region = "us-west-2"
}