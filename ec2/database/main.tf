# Define database inside the private subnet
resource "aws_instance" "database" {
  ami                    = "${var.ami_id}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.key_pair}"
  subnet_id              = "${var.private_subnet_id}"
  vpc_security_group_ids = ["${var.sg_sgbd_id}"]
  source_dest_check      = false
  user_data              = "${file("ec2/database/install.sh")}"
  iam_instance_profile   = "aws-s3-read-policy"
  private_ip             = "${var.private_ip}"
  root_block_device = {
	volume_size			= "${var.ebs_size}"
    }

/*  
  ebs_block_device = {
    device_name           = "/dev/sdg"
    volume_size           = "${var.ebs_size}"
    volume_type           = "gp2"
    delete_on_termination = true
  }
*/

  tags {
    Name          = "${var.name}"
    location      = "paris"
    environnement = "${var.env}"
    client        = "mutex"
  }
}
