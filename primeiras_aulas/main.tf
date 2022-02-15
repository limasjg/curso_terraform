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
  region  = var.aws_region
  profile = var.aws_profile
}

resource "aws_instance" "web" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  tags = var.instance_tags

}

resource "aws_s3_bucket" "bucket-teste-bucket-v2" {
  bucket = "my-tf-test-bucket-v2-limasjg-0137481937498234"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Managedby   = "Terraform"
    Owner       = "Limasjg"
    UpdatedAt   = "24/01/2022"
  }
}