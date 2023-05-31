
variable "root_region" {
  type=string
}

variable "root_environment" {
  type=string
}

variable "root_vpc_cidr" {
  type=string
}

variable "root_public_subnets_cidr" {
  type=list(any)
}

variable "root_private_subnets_cidr" {
  type=list(any)
}




