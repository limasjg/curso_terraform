variable "name" {
  type        = string
  description = "bucket name"
}

variable "acl" {
  type        = string
  description = ""
  default     = "private"
}

variable "policy" {
  type        = string
  description = ""
  default     = null
}

variable "tags" {
  type        = map(string)
  description = ""
  default     = {}
}

variable "website" {
  type        = map(string)
  description = ""
  default     = {}
}