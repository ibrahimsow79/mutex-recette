resource "aws_instance" "sso" {
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.key_pair}"
  subnet_id              = "${var.private_subnet_id}"
  private_ip			 = "${var.private_ip}"
  vpc_security_group_ids = ["${var.sg_bastion_id}"]
  iam_instance_profile   = "aws-s3-read-policy"
  source_dest_check      = false


  tags {
    Name          = "Server SSO"
    location      = "paris"
    environnement = "recette"
    client        = "mutex"
  }
}
