variable "region" {}
variable "rpa-vpc" {}
variable "rpa-exposed" {}
variable "rpa-nonexposed" {}
variable "rpa-secure" {}
variable "rpa-management" {}
variable "win_ami" {}
variable "rpa_vpc_id" {}
variable "key_name" {
  default = "id_rsa.pub"
}
variable "public_key_path" {
  default = "/root/rpatera/sshkey/id_rsa.pub"
}
