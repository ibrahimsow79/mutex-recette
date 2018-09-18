output "bastion_ip" {
  value = "${module.bastion.bastion_ip}"
}

output "backend1_ip" {
  value = "${module.backend1.backend_ip}"
}

output "database_ip" {
  value = "${module.database.database_ip}"
}
