variable "environment" {
  type        = string
  description = ""
  default     = "dev"
}

variable "aws_region" {
  type        = string
  description = ""
  default     = "sa-east-1"
}

variable "aws_profile" {
  type        = string
  description = ""
  default     = "tf-test"
}