variable "ami" {
  description = "Windows NSI Epargne"
  default     = "ami-0aba22e4ae1962730"
}

variable "subnet_nsi_id" {
  description = "NSI Subnet"
}

variable "instance_type" {
  description = "Instance Type"
  default     = "t2.medium"
}

variable "key_pair" {
  description = "Identifier of the key pair used to connect to root"
}

variable "sg_nsi_id" {
  description = "Security Group for Windows"
}

variable "private_ip" {
  description = "Private IP of the NSI Server"
  default     = "10.0.4.5"
}
