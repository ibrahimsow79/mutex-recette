output "bastion_id" {
   value = "${aws_instance.bastion.*.public_ip}"
}
