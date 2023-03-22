
resource "aws_instance" "Casey_TF_EC2_Ubuntu" {
  ami           = "ami-0d2017e886fc2c0ab"
  instance_type = "t2.micro"
  availability_zone = "us-west-2a"
  key_name = var.Key_Pair
  network_interface {
    device_index = 0 
    network_interface_id = aws_network_interface.Casey_TF_Network_Interface.id
  }


  tags = {
    Name = "TF_EC2_Ubuntu"
    Department = "CS"
    Owner = var.Owner_Name
    Temp = "True"
  }
}


  output "Server_Public_IP" {
    value = aws_eip.Casey_TF_Elastic_IP.public_ip  
  }



