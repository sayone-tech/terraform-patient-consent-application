resource "aws_security_group" "sg_ec2" {
  name        = "${var.App_Name}-${var.Name}-${var.Env_Type}-web"
  description = "Allow TLS inbound traffic"
  # vpc_id      =  data.aws_vpc.default.id

  ingress {
    description      = "HTTP connection from Web"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTPS connection from Web"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description = "Ssh connection to EC2 From Local"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.my_local_ip.response_body)}/32"]
  }

  ingress {
    description = "Ssh connection to EC2 From Sayone Jenkins"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["34.71.28.1/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}

# data "aws_vpc" "default" {
#   default = true
# }

data "http" "my_local_ip" {
  url = "https://ipv4.icanhazip.com"
}