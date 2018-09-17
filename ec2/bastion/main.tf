
module "ami" {
  source = "../ec2discovery"
}


# Define bastion inside the public subnet
resource "aws_instance" "bastion" {
  ami                         = "${module.ami.ami_id}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_pair}"
  subnet_id                   = "${var.public_subnet_id}"
  vpc_security_group_ids      = ["${var.sgweb_id}"]
  associate_public_ip_address = true
  source_dest_check           = false
  user_data                   = "${file("ec2/bastion/install.sh")}"

  tags {
    name = "bastion",
    location = "paris",
    environnement = "dev"
    client = "mutex"
  }
}

