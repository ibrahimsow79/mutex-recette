output "backend_ip" {
  value = "${aws_instance.backend.*.private_ip}"
}
