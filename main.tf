# Define AWS as our provider
provider "aws" {
  region = "${var.aws_region}"
}

# Define SSH key pair for our instances
resource "aws_key_pair" "default" {
  key_name   = "vpc_keypair"
  public_key = "${file("${var.key_path}")}"
}

data "aws_iam_role" "iam-read-s3" {
  name = "aws-s3-read-policy"
}

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
    environnement = "dev"
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
  private_ip        = "10.0.2.10"
}

module "gateway" {
  source = "ec2/backend"

  sg_bastion_id     = "${module.vpc.sg_bastion_id}"
  sg_api_id         = "${module.vpc.sg_api}"
  public_subnet_id  = "${module.vpc.public_subnet_id}"
  private_subnet_id = "${module.vpc.private_subnet_id}"
  key_pair          = "${aws_key_pair.default.id}"
  name              = "Gateway API"
  private_ip        = "10.0.2.5"
}

module "database" {
  source = "ec2/database"

  sg_bastion_id     = "${module.vpc.sg_bastion_id}"
  sg_sgbd_id        = "${module.vpc.sg_datastore}"
  public_subnet_id  = "${module.vpc.public_subnet_id}"
  private_subnet_id = "${module.vpc.subnet_datastore}"
  key_pair          = "${aws_key_pair.default.id}"
  name              = "Database 1"
  private_ip        = "10.0.3.10"
}

module "nsi" {
  source = "ec2/nsi"

  sg_nsi_id     = "${module.vpc.sg_nsi}"
  subnet_nsi_id = "${module.vpc.subnet_nsi}"
  key_pair      = "${aws_key_pair.default.id}"
}
