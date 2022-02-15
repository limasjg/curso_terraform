locals {

  ips_filepath = "ips.json"

  common_tags = {

    service     = "Curso terrafom"
    Environment = var.environment
    Managedby   = "Terraform"
    Owner       = "Limasjg"
    UpdatedAt   = "29/01/2022"
  }
}