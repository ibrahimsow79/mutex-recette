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
  default = "C:\\Users\\isow\\.ssh\\id_rsa.pub"
}

variable "windows_key_path" {
  default = ".ssh/win.pem"
}

variable "env" {
 description = "environnement : prod, dev, int,rec"
 default = "recette"
}
variable "my_credentials" {
 description = " Credentials being used to connect to AWS"
 default = "/c/Users/isow/.aws/credentials"
}
 
variable "my_profile" {
 description = " profile being used to connect to AWS"
 default = "mutex-er-recette"
}

variable "private_ip_bastion" {
 description = "private ip for bastion"
 default = "10.60.1.10"
}

variable "private_ip_backend1" {
 description = "private ip for backend1"
 default = "10.60.2.10"
}
variable "private_ip_gateway" {
 description = "private ip for gateway"
 default = "10.60.2.5"
}

variable "private_ip_database" {
 description = "private ip for  database"
 default = "10.60.3.10"
}
variable "private_ip_sso" {
 description = "private ip for sso "
 default = "10.60.2.6"
}

 
 