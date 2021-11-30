variable "region" {
  type    = string           #타입 문자
}

variable "name" {
  type    = string
}

variable "ava_zone" {
  type    = list(any)
}

variable "key" {
  type    = string
}

variable "cidr_main" {
  type    = string
}

variable "pub_sub" {
  type    = list(any) #리스트
}

variable "pri_sub" {
  type    = list(any)
}

variable "pri_subdb" {
  type    = list(any)
}

variable "cidr_route" {
  type    = string
}

variable "cidr_routev6" {
  type    = string
}

variable "ssh" {
  type    = string
}

variable "http" {
  type    = string
}

variable "icmp" {
  type    = string
}

variable "mysql" {
  type    = string
}

variable "port_ssh" {
  type    = number
}

variable "port_http" {
  type    = number
}

variable "port_mysql" {
  type    = number
}

variable "port_zero" {
  type    = number
}

variable "port_traf" {
  type = string
}
variable "minus" {
}

variable "pro_tcp" {
  type    = string
}

variable "pro_icmp" {
  type    = string
}

variable "pro_udp" {
  type    = string
}

variable "pro_http" {
  type = string
}

variable "nul" {
    default = null
}

variable "ins_t2m" {
  type    = string
}

variable "pri_ip" {
  type    = string
}

variable "lb_api" {
  type = string
}

variable "role" {
  type = string
}

variable "db_name" {
  type = string
}

variable "db_user" {
  type = string
}

variable "db_password" {
  type = string
}