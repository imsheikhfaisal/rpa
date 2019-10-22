resource "aws_instance" "rpa-management" {
  instance_type = "t2.large"
  ami           = "${var.win_ami}"
  vpc_id        = "${var.vpc_id_rpa}"
  subnet_id     = "${aws_subnet.rpa-management.id}"

  tags = {
    Name        = "rpa-vdi"
    Envrionment = "poc"
    Owner       = "gss-tpcssss"
  }
}
