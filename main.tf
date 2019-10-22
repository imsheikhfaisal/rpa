provider "aws" {
  profile = "default"
  region  = var.region
}
#--------------VPC Creation

resource "aws_vpc" "rpa-vpc" {
  cidr_block = var.rpa-vpc
  tags = {
    Name        = "rpa-vpc"
    Envrionment = "poc"
    Owner       = "gss"
  }
}


#--------------Subnet Creation

resource "aws_subnet" "rpa-exposed" {
  cidr_block = var.rpa-exposed
  vpc_id     = "${aws_vpc.rpa-vpc.id}"

  tags = {
    Name        = "rpa-exposed"
    Envrionment = "poc"
    Owner       = "gss"
  }

}
resource "aws_subnet" "rpa-nonexposed" {
  cidr_block = var.rpa-nonexposed
  vpc_id     = "${aws_vpc.rpa-vpc.id}"
  tags = {
    Name        = "rpa-nonexposed"
    Envrionment = "poc"
    Owner       = "gss"
  }
}
resource "aws_subnet" "rpa-secure" {
  cidr_block = var.rpa-secure
  vpc_id     = "${aws_vpc.rpa-vpc.id}"
  tags = {
    Name        = "rpa-secure"
    Envrionment = "poc"
    Owner       = "gss"
  }
}
resource "aws_subnet" "rpa-management" {
  cidr_block = var.rpa-management
  vpc_id     = "${aws_vpc.rpa-vpc.id}"
  tags = {
    Name        = "rpa-management"
    Envrionment = "poc"
    Owner       = "gss"
  }
}

#--------------Route Rables

resource "aws_route_table" "rpa-exposed" {
  vpc_id = "${aws_vpc.rpa-vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.rpa-igw.id}"
  }
  tags = {
    Name        = "rpa-exposed"
    Envrionment = "poc"
    Owner       = "gss"
  }
}
resource "aws_route_table_association" "rpa-exposed" {
  route_table_id = "${aws_route_table.rpa-exposed.id}"
  subnet_id      = "${aws_subnet.rpa-exposed.id}"
}
resource "aws_route_table" "rpa-nonexposed" {
  vpc_id = "${aws_vpc.rpa-vpc.id}"
  tags = {
    Name        = "rpa-nonexposed"
    Envrionment = "poc"
    Owner       = "gss"
  }
}
resource "aws_route_table_association" "rpa-nonexposed" {
  route_table_id = "${aws_route_table.rpa-nonexposed.id}"
  subnet_id      = "${aws_subnet.rpa-nonexposed.id}"

}
resource "aws_route_table" "rpa-secure" {
  vpc_id = "${aws_vpc.rpa-vpc.id}"
  tags = {
    Name        = "rpa-secure"
    Envrionment = "poc"
    Owner       = "gss"
  }
}
resource "aws_route_table_association" "rpa-secure" {
  route_table_id = "${aws_route_table.rpa-secure.id}"
  subnet_id      = "${aws_subnet.rpa-secure.id}"
}

resource "aws_route_table" "rpa-management" {
  vpc_id = "${aws_vpc.rpa-vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.rpa-igw.id}"
  }
  tags = {
    Name        = "rpa-management"
    Envrionment = "poc"
    Owner       = "gss"
  }
}
resource "aws_route_table_association" "rpa-management" {
  route_table_id = "${aws_route_table.rpa-management.id}"
  subnet_id      = "${aws_subnet.rpa-management.id}"
}
#-----------Internet Gateway
resource "aws_internet_gateway" "rpa-igw" {
  vpc_id = "${aws_vpc.rpa-vpc.id}"
  tags = {
    Name        = "rpa-igw"
    Envrionment = "poc"
    Owner       = "gss"
  }
}
