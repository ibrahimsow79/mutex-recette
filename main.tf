# Define AWS as our provider
provider "aws" {
  region = "${var.aws_region}"
}

# Define SSH key pair for our instances
resource "aws_key_pair" "default" {
  key_name   = "vpc_keypair"
  public_key = "${file("${var.key_path}")}"
}
module "vpc" {
  source ="vpc/"

  aws_az_private = "${var.aws_az_private}"
  aws_az_public = "${var.aws_az_public}"
}

module "bastion"{
  source ="ec2/bastion"
  
  sgweb_id = "${module.vpc.sgweb_id}"
  sg_sgbd_id = "${module.vpc.sg_sgbd_id}"
  public_subnet_id = "${module.vpc.public_subnet_id}"
  private_subnet_id = "${module.vpc.private_subnet_id}"
  key_pair = "${aws_key_pair.default.id}"
}

module "backend1"{
  source ="ec2/backend"
  
  sgweb_id = "${module.vpc.sgweb_id}"
  sg_sgbd_id = "${module.vpc.sg_sgbd_id}"
  public_subnet_id = "${module.vpc.public_subnet_id}"
  private_subnet_id = "${module.vpc.private_subnet_id}"
  key_pair = "${aws_key_pair.default.id}"
}