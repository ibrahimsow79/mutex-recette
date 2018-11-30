output "sg_bastion_id" {
  value = "${aws_security_group.sg_bastion.id}"
}

output "public_subnet_id" {
  value = "${aws_subnet.bastion-public-subnet.id}"
}

output "private_subnet_id" {
  value = "${aws_subnet.api-private-subnet.id}"
}

output "sg_api" {
  value = "${aws_security_group.sg_api.id}"
}

output "sg_nsi" {
  value = "${aws_security_group.sg_nsi.id}"
}

output "subnet_nsi" {
  value = "${aws_subnet.nsi-private-subnet.id}"
}

output "subnet_datastore" {
  value = "${aws_subnet.datastore-private-subnet.id}"
}

output "sg_datastore" {
  value = "${aws_security_group.sg_datastore.id}"
}

output "subnet_ci" {
  value = "${aws_subnet.ci-private-subnet.id}"
}

output "sg_ci" {
  value = "${aws_security_group.sg_ci.id}"
}
