variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "10.50.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default     = "10.50.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the private subnet"
  default     = "10.50.2.0/24"
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

variable "sg_bastion_id" {
  description = "Security Group Bastion Identifier"
}

variable "public_subnet_id" {}

variable "private_subnet_id" {}

variable "sg_api_id" {}

variable "instance_type" {
  description = "Instance Type"
  default     = "t2.micro"
}

variable "key_pair" {
  description = "Identifier of the key pair used to connect to root"
}

variable "name" {
  description = "Name of the EC2 Instance"
  default     = "backend"
}

variable "ebs_size" {
  default = "40"
}

variable "instance_name" {
  description = "Name of the instance. can use *"
  default     = "amzn2-ami-hvm-2.0.20180810-x86_64-gp2"
}

variable "ami_id" {
  default = "ami-262e9f5b"
}

variable "private_ip" {
  default = "10.50.2.10"
}

variable "script" {
  default = "ec2/backend/install.sh"
}

variable "delete_on_terminaison" {
  default = true
}
variable "env" {
 description = "environnement : prod, dev, int,rec"
 default = "dev"
}