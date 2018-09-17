output "sgweb_id" {
  value = "${aws_security_group.sgweb.id}"
}


output "public_subnet_id" {
  value = "${aws_subnet.public-subnet.id}"
}


output "private_subnet_id" {
  value = "${aws_subnet.private-subnet.id}"
}

output "sg_sgbd_id" {
  value = "${aws_security_group.sgdb.id}"
}
