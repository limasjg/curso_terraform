terraform {
  required_version = "1.1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.73.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
