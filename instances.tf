resource "aws_instance" "rpa_vdi" {
  instance_type = "t2.large"
  ami           = "${var.win_ami}"
  vpc_id        = "${var.rpa_vpc_id}"
  subnet_id     = "${aws_subnet.rpa-exposed.id}"

  tags = {
    Name        = "rpa-vdi"
    Envrionment = "poc"
    Owner       = "gss"
  }


}
