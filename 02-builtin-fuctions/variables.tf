variable "aws_region" {
  type = string
  description = ""
  default = "sa-east-1"
}

variable "aws_profile" {
  type = string
  description = ""
  default = "tf-test"
}

variable "env" {}

variable "instance_ami" {
  type = string
  description = ""
  default = "ami-09e4e8dc0d28dd778"

  validation {
    condition = length(var.instance_ami) > 4 && substr(var.instance_ami, 0, 4) == "ami-"
    error_message = "The instance_ami value must be valid AMI id, starting with \"ami-\"."
  }

}

variable "instance_number" {
  type = object({
    dev = number
    prod = number
  })
  description = "Number of instances to create"
  default = {
    dev = 1
    prod = 3
  }
}
variable "instance_type" {
  type = object({
    dev = string
    prod = string
  })
  description = ""
  default = {
    dev = "t3.micro"
    prod = "t3.medium"
  }
}

