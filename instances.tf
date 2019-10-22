resource "aws_instance" "rpa_vdi" {
  instance_type = "t2.large"
  ami           = "${var.win_ami}"
  subnet_id     = "${aws_subnet.rpa-exposed.id}"

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
  vpc_security_group_ids = ["${aws_security_group.sg-management.id}"]


}



resource "aws_instance" "rpa_orch" {
  instance_type = "t2.large"
  ami           = "${var.win_ami}"
  subnet_id     = "${aws_subnet.rpa-nonexposed.id}"

  root_block_device {
    volume_type = "gp2"
    volume_size = "200"
  }
  tags = {
    Name        = "rpa-orch"
    Envrionment = "poc"
    Owner       = "gss"
  }
  key_name               = "${aws_key_pair.sshkey.id}"
  vpc_security_group_ids = ["${aws_security_group.sg-nonexposed.id}"]


}


resource "aws_instance" "rpa_index" {
  instance_type = "t2.large"
  ami           = "${var.win_ami}"
  subnet_id     = "${aws_subnet.rpa-secure.id}"

  root_block_device {
    volume_type = "gp2"
    volume_size = "400"
  }
  tags = {
    Name        = "rpa-index"
    Envrionment = "poc"
    Owner       = "gss"
  }
  key_name               = "${aws_key_pair.sshkey.id}"
  vpc_security_group_ids = ["${aws_security_group.sg-secure.id}"]

}


resource "aws_instance" "rpa_activedir" {
  instance_type = "t2.large"
  ami           = "${var.win_ami}"
  subnet_id     = "${aws_subnet.rpa-secure.id}"

  root_block_device {
    volume_type = "gp2"
    volume_size = "400"
  }
  tags = {
    Name        = "rpa-index"
    Envrionment = "poc"
    Owner       = "gss"
  }
  key_name               = "${aws_key_pair.sshkey.id}"
  vpc_security_group_ids = ["${aws_security_group.sg-activedir.id}"]

}
