resource "aws_instance" "rpa_vdi" {
  instance_type = "t2.large"
  ami           = "${var.win_ami}"
  subnet_id     = "${aws_subnet.rpa-exposed.id}"
  volume_size   = "100"

  tags = {
    Name        = "rpa-vdi"
    Envrionment = "poc"
    Owner       = "gss"
  }
  key_name               = "${aws_key_pair.sshkey.id}"
  vpc_security_group_ids = "${aws_security_group.sg-management.id}"

}
