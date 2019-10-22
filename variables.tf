variable "region" {}
variable "rpa-vpc" {}
variable "rpa-exposed" {}
variable "rpa-nonexposed" {}
variable "rpa-secure" {}
variable "rpa-management" {}
variable "domain-name" {}
variable "short-name" {}
variable "win_ami" {}
variable "rpa_vpc_id" {}
variable "rpa-exposed-sub" {
  default = ""
}
