variable "region" {}
variable "rpa-vpc" {}
variable "rpa-exposed" {}
variable "rpa-nonexposed" {}
variable "rpa-secure" {}
variable "rpa-management" {}
variable "domain-name" {}
variable "short-name" {}
variable "win_ami" {
  default = "ami-0f5f9d68472051b47"
}
variable "vpc_id_rpa" {
  default = "vpc-0bd1773e9f3dd560e"
}
