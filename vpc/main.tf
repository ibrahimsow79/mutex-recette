# Define our VPC
resource "aws_vpc" "default" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name          = "mutex-recette-vpc"
    location      = "paris"
    environnement = "${var.env}"
    client        = "mutex"
  }
}

# Define the public subnet
resource "aws_subnet" "bastion-public-subnet" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "${var.public_subnet_cidr}"
  availability_zone = "${var.aws_az_public}"

  tags {
    Name          = "Bastion Public Subnet"
    location      = "paris"
    environnement = "${var.env}"
    client        = "mutex"
  }
}

# Define the private subnet for API
resource "aws_subnet" "api-private-subnet" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "${var.private_subnet_cidr}"
  availability_zone = "${var.aws_az_private}"

  tags {
    Name          = "api private subnet"
    location      = "paris"
    environnement = "${var.env}"
    client        = "mutex"
  }
}

resource "aws_subnet" "datastore-private-subnet" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "${var.datastore_subnet_cidr}"
  availability_zone = "${var.aws_az_private}"

  tags {
    Name          = "datastore private subnet"
    location      = "paris"
    environnement = "${var.env}"
    client        = "mutex"
  }
}

resource "aws_subnet" "nsi-private-subnet" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "${var.nsi_subnet_cidr}"
  availability_zone = "${var.aws_az_private}"

  tags {
    Name          = "nsi private subnet"
    location      = "paris"
    environnement = "${var.env}"
    client        = "mutex"
  }
}

# Define the internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name          = "VPC IGW"
    location      = "paris"
    environnement = "${var.env}"
    client        = "mutex"
  }
}

# Define the route table
resource "aws_route_table" "web-public-rt" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name          = "Public Subnet RT"
    location      = "paris"
    environnement = "${var.env}"
    client        = "mutex"
  }
}

# Assign the route table to the public Subnet
resource "aws_route_table_association" "web-public-rt" {
  subnet_id      = "${aws_subnet.bastion-public-subnet.id}"
  route_table_id = "${aws_route_table.web-public-rt.id}"
}

# Create NAT for accessing to internet from the private subnet
resource "aws_eip" "nat-gateway-api" {
  vpc                       = true
  associate_with_private_ip = "10.50.1.5"
  tags {
    Name          = "EIP for NAT"
    location      = "paris"
    environnement = "${var.env}"
    client        = "mutex"
  }
}

resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = "${aws_eip.nat-gateway-api.id}"
  subnet_id     = "${aws_subnet.bastion-public-subnet.id}"
}

resource "aws_route_table" "private-subnet-rt" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat-gateway.id}"
  }

  tags {
    Name          = "Private Subnet RT"
    location      = "paris"
    environnement = "${var.env}"
    client        = "mutex"
  }
}

resource "aws_route_table_association" "private-subnet-rt" {
  subnet_id      = "${aws_subnet.api-private-subnet.id}"
  route_table_id = "${aws_route_table.private-subnet-rt.id}"
}

resource "aws_route_table_association" "nsi-subnet-rt" {
  subnet_id      = "${aws_subnet.nsi-private-subnet.id}"
  route_table_id = "${aws_route_table.private-subnet-rt.id}"
}

resource "aws_route_table_association" "datastore-subnet-rt" {
  subnet_id      = "${aws_subnet.datastore-private-subnet.id}"
  route_table_id = "${aws_route_table.private-subnet-rt.id}"
}


# Define the security group for public subnet
resource "aws_security_group" "sg_bastion" {
  name        = "sg_bastion_web"
  description = "Allow incoming HTTP connections & SSH access"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["62.129.10.227/32"]
	description = "IP Publique Mutex"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["62.129.10.163/32"]
	description = "IP Publique Mutex"
  }
  
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["62.129.10.227/32"]
	description = "IP Publique Mutex"
  }
   ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["62.129.10.163/32"]
	description = "IP Publique Mutex"
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["62.129.10.227/32"]
	description = "IP Publique Mutex"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["62.129.10.162/32"]
	description = "IP Publique Mutex"
  } 
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
	description = "Security Group Peering environnement Dev"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name          = "sg bastion"
    location      = "paris"
    environnement = "${var.env}"
    client        = "mutex"
  }
}

# Define the security group for api private subnet
resource "aws_security_group" "sg_api" {
  name        = "sg_api"
  description = "Allow traffic from public subnet"

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["${var.public_subnet_cidr}"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.public_subnet_cidr}"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.public_subnet_cidr}"]
  }

  ingress {
    from_port   = 8090
    to_port     = 8090
    protocol    = "tcp"
    cidr_blocks = ["${var.ci_subnet_cidr}"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["${var.public_subnet_cidr}"]
  }

  ingress {
    from_port   = 8090
    to_port     = 8090
    protocol    = "tcp"
    cidr_blocks = ["${var.public_subnet_cidr}"]
  }
   ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
	description = "Security Group Peering environnement Dev"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name          = "sg api "
    location      = "paris"
    environnement = "${var.env}"
    client        = "mutex"
  }
}

resource "aws_security_group" "sg_nsi" {
  name        = "sg_nsi"
  description = "Allow traffic from from API & RDP"

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["${var.public_subnet_cidr}"]
    description = "RDP Port"
  }

  ingress {
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["${var.public_subnet_cidr}"]
    description = "SQL Server Port (access by tunnel)"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.public_subnet_cidr}"]
    description = "Http port for IIS"
  }

  ingress {
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["${var.private_subnet_cidr}"]
    description = "SQL Server Port (access by API)"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.private_subnet_cidr}"]
    description = "Http port for IIS"
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["${var.public_subnet_cidr}"]
  }
   ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
	description = "Security Group Peering environnement Dev"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name          = "sg nsi epargne "
    location      = "paris"
    environnement = "${var.env}"
    client        = "mutex"
  }
}

resource "aws_security_group" "sg_datastore" {
  name        = "sg_datastore"
  description = "Allow traffic from from API"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["${var.private_subnet_cidr}"]
    description = "MySQL Server Port"
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["${var.public_subnet_cidr}"]
    description = "MySQL Server Port (For Developper)"
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["${var.private_subnet_cidr}"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.public_subnet_cidr}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
	description = "Security Group Peering environnement Dev"
  }

  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name          = "sg datastore epargne"
    location      = "paris"
    environnement = "${var.env}"
    client        = "mutex"
  }
}

