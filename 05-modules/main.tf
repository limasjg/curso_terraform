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

resource "random_pet" "this" {
  length = 5
}

module "bucket" {
  source = "./s3_modules"
  name   = random_pet.this.id
  versioning = {
    enabled = true
  }
}

resource "random_pet" "website" {
  length = 5
}

module "website" {
  source = "./s3_modules"
  name   = random_pet.website.id
  acl    = "public-read"
  files  = "${path.root}/website"
  website = {
    index_document = "index.html"
    error_document = "error.html"
  }

  policy = <<EOT
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${random_pet.website.id}/*"
            ]
        }
    ]
}
EOT
}