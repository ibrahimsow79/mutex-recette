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

variable "my_private_ip_backen1" {
 description = "private ip for backend1"
 default = "10.50.2.10"
}
  variable "my_private_ip_backend2" {
 description = "private ip for backend2"
 default = "10.50.2.11"
}
variable "my_private_ip_gateway" {
 description = "private ip for gateway"
 default = "10.50.2.5"
}
variable "my_private_ip_database" {
 description = "private ip for  databse"
 default = "10.50.3.10"
}
variable "my_private_ip_sso" {
 description = "private ip for sso "
 default = "10.50.2.6"
}
variable "my_private_ip_ci" {
 description = "private ip for ci"
 default = "10.50.5.5"
}
variable "my_private_ip_gitlab" {
 description = "private ip for gitlab"
 default = "10.50.5.6"
}
 
 