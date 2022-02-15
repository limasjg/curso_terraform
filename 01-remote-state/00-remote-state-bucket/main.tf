terraform {
  required_version = "1.1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.73.0"
    }
  }
}

provider "aws" {
  region  = "sa-east-1"
  profile = "tf-test"
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "remote-state" {

    bucket = "tfstate-${data.aws_caller_identity.current.account_id}"

    versioning {
      enabled = true
    }

    tags = {
        description = "Stores terraform remote state files"
        ManagedBy = "Terraform"
        Owner = "Limasjg"
        CreatedAt = "01/02/2022"
    }
  
}

output "remote_state_bucket" {
  value = aws_s3_bucket.remote-state.bucket
}

output "remote_state_bucket_arn" {
  value = aws_s3_bucket.remote-state.arn
}