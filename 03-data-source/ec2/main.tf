terraform {
  required_version = "1.1.7"

  required_providers {
      aws = {
          source = "hashicorp/aws"
          version = "3.73.0"
      }
  }

    backend "s3" {
        bucket = "tfstate-665372969802"
        key = "dev/03-data-sources-s3/terraform.tfstate"
        region = "sa-east-1"
        profile = "tf-test"
    }

}

provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}