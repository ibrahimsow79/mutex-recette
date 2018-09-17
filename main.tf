# Define AWS as our provider
provider "aws" {
  region = "${var.aws_region}"
}

# Define SSH key pair for our instances
resource "aws_key_pair" "default" {
  key_name   = "vpc_keypair"
  public_key = "${file("${var.key_path}")}"
}

resource "aws_key_pair" "windows" {
  key_name   = "vpc_window_keypair"
  public_key = "${file("${var.windows_key_path}")}"
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

module "backend1" {
  source = "ec2/backend"

  sg_bastion_id     = "${module.vpc.sg_bastion_id}"
  sg_sgbd_id        = "${module.vpc.sg_api}"
  public_subnet_id  = "${module.vpc.public_subnet_id}"
  private_subnet_id = "${module.vpc.private_subnet_id}"
  key_pair          = "${aws_key_pair.default.id}"
  name              = "Server API 1"
}

module "nsi" {
  source = "ec2/nsi"

  sg_nsi_id     = "${module.vpc.sg_nsi}"
  subnet_nsi_id = "${module.vpc.subnet_nsi}"
  key_pair      = "${aws_key_pair.windows.id}"
}
