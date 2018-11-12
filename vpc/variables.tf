variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the private subnet"
  default     = "10.0.2.0/24"
}

variable "datastore_subnet_cidr" {
  description = "CIDR for the nsi subnet"
  default     = "10.0.3.0/24"
}

variable "nsi_subnet_cidr" {
  description = "CIDR for the nsi subnet"
  default     = "10.0.4.0/24"
}

variable "ci_subnet_cidr" {
  description = "CIDR for the ci subnet"
  default     = "10.0.5.0/24"
}

variable "aws_az_private" {
  description = "AZ for Private Subnet"
  default     = "eu-west-3b"
}

variable "aws_az_public" {
  description = "AZ for Public Subnet"
  default     = "eu-west-3b"
}
variable "env" {
 description = "environnement : prod, dev, int,rec"
 default = "dev"
}
