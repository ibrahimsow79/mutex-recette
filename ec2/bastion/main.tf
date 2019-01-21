module "ami" {
  source = "../ec2discovery"
}

# Define bastion inside the public subnet
resource "aws_instance" "bastion" {
  ami                         = "${module.ami.ami_id}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_pair}"
  subnet_id                   = "${var.public_subnet_id}"
  vpc_security_group_ids      = ["${var.sg_bastion_id}"]
  associate_public_ip_address = true
  private_ip                  = "${var.private_ip}"
  source_dest_check           = false
  iam_instance_profile        = "aws-s3-read-policy"
  user_data                   = "${file("ec2/bastion/install.sh")}"

  tags {
    Name          = "Bastion"
    location      = "paris"
    environnement = "${var.env}"
    client        = "mutex"
  }
}
