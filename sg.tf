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
  name        = "management"
  description = "Nonexsped Orchestorator Server"
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
