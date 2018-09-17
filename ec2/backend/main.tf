module "ami" {
  source = "../ec2discovery"
}

# Define database inside the private subnet
resource "aws_instance" "backend" {
  ami                    = "${module.ami.ami_id}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.key_pair}"
  subnet_id              = "${var.private_subnet_id}"
  vpc_security_group_ids = ["${var.sg_sgbd_id}"]
  source_dest_check      = false

  tags {
    Name          = "${var.name}"
    location      = "paris"
    environnement = "dev"
    client        = "mutex"
  }
}
