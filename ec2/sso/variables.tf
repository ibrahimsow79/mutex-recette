variable "ami" {
  description = "SSO"
  default     = "ami-04d1289ed857811a7"
}

variable "instance_type" {
	description = "Instance Type"
	default = "t3.medium"
}

variable "key_pair" {
	description = "Identifier of the key pair to connect to the instance"
}

variable "private_subnet_id" {
	description = "Private Subnet"
}

variable "public_subnet_id" {
	description = "Public Subnet"
}

variable "sg_api_id" {
	description = "Security Group"
}


variable "sg_bastion_id" {
	description = "Security Group"
}

variable "private_ip" {
	description = "Private IP of SSO Server"
	default = "10.60.2.6"
}