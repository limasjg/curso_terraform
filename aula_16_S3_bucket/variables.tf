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

variable "ami" {
  type        = string
  description = ""
  default     = "ami-0420311e572d1298d"
}

variable "instance_type" {
  type        = string
  description = ""
  default     = "t2.micro"
}

