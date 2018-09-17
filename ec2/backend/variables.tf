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

variable "aws_az_private" {
  description = "AZ for Private Subnet"
  default     = "eu-west-3b"
}

variable "aws_az_public" {
  description = "AZ for Public Subnet"
  default     = "eu-west-3a"
}

variable "ami" {
  description = "Amazon Linux AMI"
  default     = "ami-4fffc834"
}



variable "sgweb_id" {
  description = "Security Group Web Identifier"
}


variable "public_subnet_id" {
}


variable "private_subnet_id" {
}

variable "sg_sgbd_id" {
}

variable "instance_type" {
  description = "Instance Type"
  default = "t2.micro"
}

variable "key_pair" {
  description ="Identifier of the key pair used to connect to root"
}
