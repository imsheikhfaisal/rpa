resource "aws_eip" "rpa_vdi" {
  instance = "${aws_instance.rpa_vdi.id}"
  vpc      = true
  tags = {
    Name        = "rpa-vdi"
    Envrionment = "poc"
    Owner       = "gss"
  }

}


#------------NAT gateway
resource "aws_eip" "natgw" {
  vpc = true
}
