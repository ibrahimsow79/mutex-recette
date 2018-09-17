variable "aws_region" {
  description = "Region for the VPC"
  default     = "eu-west-3"
}

variable "aws_az_private" {
  description = "AZ for Private Subnet"
  default     = "eu-west-3b"
}

variable "aws_az_public" {
  description = "AZ for Public Subnet"
  default     = "eu-west-3a"
}

variable "key_path" {
  description = "SSH Public Key path"
  default     = "/home/nicolas/.ssh/id_rsa.pub"
}

