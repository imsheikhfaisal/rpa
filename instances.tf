resource "aws_instance" "rpa_vdi" {
  instance_type = "t2.large"
  ami           = "${var.win_ami}"
  subnet_id     = "${aws_subnet.rpa-exposed.id}"


  tags = {
    Name        = "rpa-vdi"
    Envrionment = "poc"
    Owner       = "gss"
  }
  key_name = "${aws_key_pair.tf_auth.id}"

}
