
resource "aws_instance" "Casey_TF_EC2_Ubuntu" {
  ami           = "ami-0d2017e886fc2c0ab"
  instance_type = "t2.micro"
  availability_zone = "us-west-2a"
  network_interface {
    device_index = 0 
    network_interface_id = aws_network_interface.Casey_TF_Network_Interface.id
  }
  #key_name = "Casey.pem"

  tags = {
    Name = "Casey_TF_EC2_Ubuntu"
    Department = "CS"
    Owner = "Casey"
    Temp = "True"
  }
}




