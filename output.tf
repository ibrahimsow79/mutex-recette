output "bastion_ip" {
  value = "${aws_eip.bastion_public_ip.public_ip}"
}

output "backend1_ip" {
  value = "${module.backend1.backend_ip}"
}

output "database_ip" {
  value = "${module.database.database_ip}"
}