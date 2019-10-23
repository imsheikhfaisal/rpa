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
    Name        = "rpa_orchestrator"
    Envrionment = "poc"
    Owner       = "gss"
  }
  key_name               = "${aws_key_pair.sshkey.id}"
  vpc_security_group_ids = ["${aws_security_group.orchestrator.id}"]
}

#........................Index..............

resource "aws_instance" "rpa_index" {
  instance_type = "t2.large"
  ami           = "${var.win_ami}"
  subnet_id     = "${aws_subnet.rpa-nonexposed.id}"

  root_block_device {
    volume_type = "gp2"
    volume_size = "400"
  }
  tags = {
    Name        = "rpa_index"
    Envrionment = "poc"
    Owner       = "gss"
  }
  key_name               = "${aws_key_pair.sshkey.id}"
  vpc_security_group_ids = ["${aws_security_group.index.id}"]
}

#........................DB..............

resource "aws_instance" "rpa_db" {
  instance_type = "t2.large"
  ami           = "${var.win_ami}"
  subnet_id     = "${aws_subnet.rpa-secure.id}"

  root_block_device {
    volume_type = "gp2"
    volume_size = "400"
  }
  tags = {
    Name        = "rpa_db"
    Envrionment = "poc"
    Owner       = "gss"
  }
  key_name               = "${aws_key_pair.sshkey.id}"
  vpc_security_group_ids = ["${aws_security_group.db.id}"]
}

#....................Proxy

resource "aws_instance" "rpa_proxy" {
  instance_type = "t2.large"
  ami           = "${var.linux_ami}"
  subnet_id     = "${aws_subnet.rpa-exposed.id}"

  root_block_device {
    volume_type = "gp2"
    volume_size = "200"
  }
  tags = {
    Name        = "rpa_proxy"
    Envrionment = "poc"
    Owner       = "gss"
  }
  key_name               = "${aws_key_pair.sshkey.id}"
  vpc_security_group_ids = ["${aws_security_group.proxy.id}"]
}
