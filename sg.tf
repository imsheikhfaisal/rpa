#...............SG for VDI
resource "aws_security_group" "management" {
  name        = "management"
  description = "Management for Remote Access"
  vpc_id      = "${var.rpa_vpc_id}"
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


}

#---------SG for Orchestorator

resource "aws_security_group" "orchestrator" {
  name        = "orchestrator"
  description = "Nonexposed Orchestorator Server"
  vpc_id      = "${var.rpa_vpc_id}"
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["190.160.4.36/32"]
  }
  ingress {
    from_port   = 5601
    to_port     = 5601
    protocol    = "tcp"
    cidr_blocks = ["190.160.4.36/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

#................SG for index_name

resource "aws_security_group" "index" {
  name        = "index"
  description = "Nonexposed index Server"
  vpc_id      = "${var.rpa_vpc_id}"
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["190.160.4.36/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

#--------------SG for MSSQL


resource "aws_security_group" "db" {
  name        = "db"
  description = "Secure DB Server"
  vpc_id      = "${var.rpa_vpc_id}"
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["190.160.2.42/32"]
  }
  ingress {
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["190.160.2.42/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}


#--------------SG for proxy


resource "aws_security_group" "proxy" {
  name        = "proxy"
  description = "Exposed Proxy Server"
  vpc_id      = "${var.rpa_vpc_id}"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["190.160.4.36/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
