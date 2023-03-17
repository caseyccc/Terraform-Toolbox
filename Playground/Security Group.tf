resource "aws_security_group" "Casey_TF_SG" {
  name        = "Casey_TF_SG"
  description = "Allow SSH and Pinging inbound"
  vpc_id      = aws_vpc.Casey_TF_VPC.id

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22 #Same number means we can ONLY use this port
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] #This determines which IPs can hit this
    ipv6_cidr_blocks = ["::/0"]
  }

    /* ingress {
    description      = "ICMP"
    from_port        = icmp
    to_port          = icmp 
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"] #This determines which IPs can hit this
    ipv6_cidr_blocks = ["::/0"]
  } */

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" #Any Protocol Allowed
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Casey_TF_SG"
  }
}