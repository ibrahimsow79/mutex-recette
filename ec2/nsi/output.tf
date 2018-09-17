output "nsi_id" {
  value = "${aws_instance.nsi-epargne.*.private_ip}"
}
