resource "aws_security_group" "sg-management" {
  name        = "sg-management"
  description = "Management for Remote Access"
  vpc_id      = "${var.rpa_vpc_id}"
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "sg-nonexposed" {
  name        = "sg-nonexposed"
  description = "SG for Nonexposed"
  vpc_id      = "${var.rpa_vpc_id}"
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "sg-secure" {
  name        = "sg-secure"
  description = "SG for Secure"
  vpc_id      = "${var.rpa_vpc_id}"
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "sg-activedir" {
  name        = "sg-secure"
  description = "SG for activedir"
  vpc_id      = "${var.rpa_vpc_id}"
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
