terraform {
  required_version = "1.1.7"

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

resource "aws_dynamodb_table" "lock-table" {
  name = "tflock-${aws_s3_bucket.remote-state.bucket}"
  read_capacity  = 5
  write_capacity = 5
  hash_key = "LockID"

  attribute {
    
    name = "LockID"
    type = "S"
  }
}

output "remote_state_bucket" {
  value = aws_s3_bucket.remote-state.bucket
}

output "remote_state_bucket_arn" {
  value = aws_s3_bucket.remote-state.arn
}