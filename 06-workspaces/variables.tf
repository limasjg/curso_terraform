variable "aws_region" {
  description = "AWS region where the resources will be created"

  type = object({
    dev  = string
    prod = string
  })

  default = {
    dev  = "sa-east-1"
    prod = "us-east-1"
  }
}

variable "instance" {
  description = "Instance configuration per workspace"

  type = object({
    dev = object({
      ami    = string
      type   = string
      number = number
    })
    prod = object({
      ami    = string
      type   = string
      number = number
    })
  })

  default = {
    dev = {
      ami    = "ami-09344f463b780bd4c"
      type   = "t2.micro"
      number = 1
    }
    prod = {
      ami    = "ami-0c02fb55956c7d316"
      type   = "t2.micro"
      number = 3
    }
  }
}