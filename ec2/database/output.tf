output "database_ip" {
  value = "${aws_instance.database.*.private_ip}"
}
