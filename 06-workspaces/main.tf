terraform {
  required_version = "1.1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.73.0"
    }
  }

    backend "s3" {
    bucket         = "tfstate-665372969802"
    key            = "06-workspaces/terraform.tfstate"
    region         = "sa-east-1"
    profile        = "tf-test"
    dynamodb_table = "tflock-tfstate-665372969802"
  }

}

provider "aws" {
  region  = lookup(var.aws_region, local.env)
  profile = "tf-test"
}

locals {
  env = terraform.workspace == "default" ? "dev" : terraform.workspace
}

resource "aws_instance" "web" {
  count = lookup(var.instance, local.env)["number"]

  ami           = lookup(var.instance, local.env)["ami"]
  instance_type = lookup(var.instance, local.env)["type"]

  tags = {
    Name = "Minha máquina web ${local.env}"
    Env  = local.env
  }
}