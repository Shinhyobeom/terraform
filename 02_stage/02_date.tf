module "hb_stage" {
  source = "../01_main"

  region       = "ap-northeast-2" #리전 변수
  name         = "hb"
  key          = "hb-key"
  ava_zone     = ["a", "c"]
  cidr_main    = "10.0.0.0/16"
  pub_sub      = ["10.0.0.0/24", "10.0.1.0/24"]
  pri_sub      = ["10.0.2.0/24", "10.0.3.0/24"]
  pri_subdb    = ["10.0.4.0/24", "10.0.5.0/24"]
  cidr_route   = "0.0.0.0/0"
  cidr_routev6 = "::/0"
  ssh          = "ssh"
  http         = "http"
  icmp         = "icmp"
  mysql        = "mysql"
  port_ssh     = 22
  port_http    = 80
  port_mysql   = 3306
  port_zero    = 0
  port_traf    = "traffic-port"
  minus        = -1
  pro_tcp      = "tcp"
  pro_icmp     = "icmp"
  pro_udp      = "udp"
  pro_http     = "HTTP"
  nul          = null
  ins_t2m      = "t2.micro"
  pri_ip       = "10.0.0.11"
  lb_api       = "application"
  role         = "admin_role"
  db_name      = "hb"
  db_user      = "admin"
  db_password  = "1q2w3e4r"

}
