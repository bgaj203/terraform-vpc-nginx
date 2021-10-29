resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = var.aws_vpc_id

  tags = {
    Name = "${var.project_name}_${var.environment_name}_internet_gateway"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = var.aws_vpc_id
  cidr_block = var.aws_subnet_cidr
  map_public_ip_on_launch = var.map_public_ip_on_launch // Makes this a public subnet
  availability_zone       = var.aws_subnet_availability_zone

  tags = {
    Name = "${var.project_name}_${var.environment_name}_public_subnet"
  }
}

resource "aws_route_table" "aws_route_table" {
  vpc_id = var.aws_vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "${var.project_name}_${var.environment_name}_aws_route_table"
  }
}

resource "aws_route_table_association" "aws_route_table_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.aws_route_table.id
}

resource "aws_security_group" "aws_security_group_ssh_allowed" {

  vpc_id = var.aws_vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [var.ssh_ip_address]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}