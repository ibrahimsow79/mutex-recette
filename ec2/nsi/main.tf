resource "aws_instance" "nsi-epargne" {
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.key_pair}"
  subnet_id              = "${var.subnet_nsi_id}"
  vpc_security_group_ids = ["${var.sg_nsi_id}"]
  source_dest_check      = false

  private_ip = "${var.private_ip}"

  tags {
    Name          = "NSI Epargne"
    location      = "paris"
    environnement = "dev"
    client        = "mutex"
  }
}
