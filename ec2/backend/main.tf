# Define database inside the private subnet
resource "aws_instance" "backend" {
  ami                    = "${var.ami_id}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.key_pair}"
  subnet_id              = "${var.private_subnet_id}"
  vpc_security_group_ids = ["${var.sg_api_id}"]
  source_dest_check      = false
  user_data              = "${file(var.script)}"
  iam_instance_profile   = "aws-s3-read-policy"
  private_ip             = "${var.private_ip}"

  ebs_block_device = {
    device_name           = "/dev/sdg"
    volume_size           = "${var.ebs_size}"
    volume_type           = "gp2"
    delete_on_termination = "${var.delete_on_terminaison}"
  }

  tags {
    Name          = "${var.name}"
    location      = "paris"
    environnement = "${var.env}"
    client        = "mutex"
  }
}
