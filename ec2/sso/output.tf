output "sso_id" {
  value = "${aws_instance.sso.private_ip}"
}
