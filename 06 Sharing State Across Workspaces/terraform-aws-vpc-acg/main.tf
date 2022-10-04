resource "aws_vpc" "main" {
  cidr_block = var.cidr
  tags = {
    Name = var.name
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr
  tags = {
    Name = var.name
  }
}

variable "cidr" {}
variable "name" {}
