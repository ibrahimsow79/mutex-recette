# Define AWS as our provider
provider "aws" {
  region = "${var.aws_region}"
  shared_credentials_file = "${var.my_credentials}"
  profile = "${var.my_profile}"
}


# Define SSH key pair for our instances
resource "aws_key_pair" "default" {
  key_name   = "vpc_keypair"
  public_key = "${file("${var.key_path}")}"
}

# Mettre le fichier tfstate sur S3 : mutex-er-admin- - Terraform ne permet dpas la variabilisation du backend
terraform {
  backend "s3" {
  bucket = "mutex-er-recette-configuration"
  key    = "mutex/main/terraform.tfstate"
  region =  "eu-west-3"
  }
}

data "aws_iam_role" "iam-read-s3" {
  name = "aws-s3-read-policy"
}

# Ai rajouté les lignes pour variabilser les "availability zone" dans le script terraform
data "aws_availability_zones" "available" {}

module "vpc" {
  source = "vpc/"

  aws_az_private = "${var.aws_az_private}"
  aws_az_public  = "${var.aws_az_public}"
}

module "bastion" {
  source = "ec2/bastion"

  sg_bastion_id     = "${module.vpc.sg_bastion_id}"
  sg_sgbd_id        = "${module.vpc.sg_api}"
  public_subnet_id  = "${module.vpc.public_subnet_id}"
  private_subnet_id = "${module.vpc.private_subnet_id}"
  key_pair          = "${aws_key_pair.default.id}"
}

resource "aws_eip" "bastion_public_ip" {
  instance = "${module.bastion.bastion_id}"
  vpc      = true
  tags {
    Name          = "EIP Bastion"
    location      = "paris"
    environnement = "${var.env}"
    client        = "mutex"
  }
}

module "backend1" {
  source = "ec2/backend"

  sg_bastion_id     = "${module.vpc.sg_bastion_id}"
  sg_api_id         = "${module.vpc.sg_api}"
  public_subnet_id  = "${module.vpc.public_subnet_id}"
  private_subnet_id = "${module.vpc.private_subnet_id}"
  key_pair          = "${aws_key_pair.default.id}"
  name              = "Server API 1"
  private_ip        = "${var.private_ip_backend1}"
  instance_type     = "t2.medium"
}

#module "backend2" {
#  source = "ec2/backend"

#  sg_bastion_id     = "${module.vpc.sg_bastion_id}"
#  sg_api_id         = "${module.vpc.sg_api}"
#  public_subnet_id  = "${module.vpc.public_subnet_id}"
#  private_subnet_id = "${module.vpc.private_subnet_id}"
#  key_pair          = "${aws_key_pair.default.id}"
#  name              = "Server API 2"
#  private_ip        = "${var.private_ip_backend1}"
#  instance_type     = "t2.medium"
#}

module "gateway" {
  source = "ec2/backend"

  sg_bastion_id     = "${module.vpc.sg_bastion_id}"
  sg_api_id         = "${module.vpc.sg_api}"
  public_subnet_id  = "${module.vpc.public_subnet_id}"
  private_subnet_id = "${module.vpc.private_subnet_id}"
  key_pair          = "${aws_key_pair.default.id}"
  name              = "Gateway API"
  private_ip        = "${var.private_ip_gateway}"
}

module "database" {
  source = "ec2/database"

  sg_bastion_id     = "${module.vpc.sg_bastion_id}"
  sg_sgbd_id        = "${module.vpc.sg_datastore}"
  public_subnet_id  = "${module.vpc.public_subnet_id}"
  private_subnet_id = "${module.vpc.subnet_datastore}"
  key_pair          = "${aws_key_pair.default.id}"
  name              = "Database 1"
  private_ip        = "${var.private_ip_database}"
}
/* 
module "nsi" {
  source = "ec2/nsi"

  sg_nsi_id     = "${module.vpc.sg_nsi}"
  subnet_nsi_id = "${module.vpc.subnet_nsi}"
  key_pair      = "${aws_key_pair.default.id}"
}
*/
module "sso" {
  source = "ec2/backend"

  sg_bastion_id     = "${module.vpc.sg_bastion_id}"
  sg_api_id         = "${module.vpc.sg_api}"
  public_subnet_id  = "${module.vpc.public_subnet_id}"
  private_subnet_id = "${module.vpc.private_subnet_id}"
  key_pair          = "${aws_key_pair.default.id}"
  name              = "Server SSO"
  private_ip        = "${var.private_ip_sso}"
  script            = "script/sso/install.sh"
  instance_type     = "t3.medium"
}

/*
module "ci" {
  source = "ec2/backend"

  sg_bastion_id         = "${module.vpc.sg_bastion_id}"
  sg_api_id             = "${module.vpc.sg_ci}"
  public_subnet_id      = "${module.vpc.public_subnet_id}"
  private_subnet_id     = "${module.vpc.subnet_ci}"
  key_pair              = "${aws_key_pair.default.id}"
  name                  = "Server CI"
  private_ip            = "${var.private_ip_ci}"
  script                = "script/ci/install.sh"
  instance_type         = "t3.large"
  ebs_size              = "200"
}


module "gitlab" {
  source = "ec2/backend"

  sg_bastion_id         = "${module.vpc.sg_bastion_id}"
  sg_api_id             = "${module.vpc.sg_ci}"
  public_subnet_id      = "${module.vpc.public_subnet_id}"
  private_subnet_id     = "${module.vpc.subnet_ci}"
  key_pair              = "${aws_key_pair.default.id}"
  name                  = "Server Gitlab"
  private_ip            = "${var.private_ip_gitlab}"
  script                = "script/gitlab/install.sh"
  instance_type         = "t3.medium"
  ebs_size              = "100"
}
*/