variable "ami" {
  description = "Windows NSI Epargne"
  default     = "ami-0db62f1418a06a5d9"
}

variable "subnet_nsi_id" {
  description = "NSI Subnet"
}

variable "instance_type" {
  description = "Instance Type"
  default     = "t3.large"
}

variable "key_pair" {
  description = "Identifier of the key pair used to connect to root"
}

variable "sg_nsi_id" {
  description = "Security Group for Windows"
}

variable "private_ip" {
  description = "Private IP of the NSI Server"
  default     = "10.60.4.5"
}
