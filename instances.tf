#-----------------VDI-management----------
resource "aws_instance" "rpa_vdi" {
  instance_type = "t2.large"
  ami           = "${var.win_ami}"
  subnet_id     = "${aws_subnet.rpa-management.id}"

  root_block_device {
    volume_type = "gp2"
    volume_size = "100"
  }
  tags = {
    Name        = "rpa-vdi"
    Envrionment = "poc"
    Owner       = "gss"
  }
  key_name               = "${aws_key_pair.sshkey.id}"
  vpc_security_group_ids = ["${aws_security_group.management.id}"]

}

#----------------Orchestorator-nonexposed-------
resource "aws_instance" "rpa_orchestrator" {
  instance_type = "t2.large"
  ami           = "${var.win_ami}"
  subnet_id     = "${aws_subnet.rpa-nonexposed.id}"

  root_block_device {
    volume_type = "gp2"
    volume_size = "200"
  }
  tags = {
    Name        = "rpa-rpa_orchestrator"
    Envrionment = "poc"
    Owner       = "gss"
  }
  key_name               = "${aws_key_pair.sshkey.id}"
  vpc_security_group_ids = ["${aws_security_group.orchestrator.id}"]
}
