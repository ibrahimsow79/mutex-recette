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