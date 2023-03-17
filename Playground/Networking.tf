
#This will create a VPC with the subnet of 10.88.0.0/16 ensure that any subnets will be located in this subnet

resource "aws_vpc" "Casey_TF_VPC" {
  cidr_block       = "10.88.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Casey_TF_VPC"
    Departmnet = "CS"
    Owner = "Casey"
    Temp = "True"
  }
}

#Create a subnet inside of our TF created VPC, ensuring we are inside of the CIDR block above
resource "aws_subnet" "Casey_TF_Subnet" {
  vpc_id     = aws_vpc.Casey_TF_VPC.id
  cidr_block = "10.88.1.0/24"

  tags = {
    Name = "Casey_TF_Subnet"
    Departmnet = "CS"
    Owner = "Casey"
    Temp = "True"
  }
}

#Create an IGW to ensure that we can reach the internet on our EC2, referencing our VPC above
resource "aws_internet_gateway" "Casey_TF_IGW" {
  vpc_id = aws_vpc.Casey_TF_VPC.id

  tags = {
    Name = "Casey_TF_IGW"
    Departmnet = "CS"
    Owner = "Casey"
    Temp = "True"
  }
}

#Creates route Table
resource "aws_route_table" "Casey_TF_Route_Table" {
  vpc_id = aws_vpc.Casey_TF_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Casey_TF_IGW.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    gateway_id = aws_internet_gateway.Casey_TF_IGW.id
  }  

  tags = {
    Name = "Casey_TF_IGW"
    Departmnet = "CS"
    Owner = "Casey"
    Temp = "True"
  }
}

#RTA
resource "aws_route_table_association" "Casey_TF_RTA" {
  subnet_id      = aws_subnet.Casey_TF_Subnet.id
  route_table_id = aws_route_table.Casey_TF_Route_Table.id
}