resource "aws_eip" "nat_eip" {
    domain = "vpc"
    tags = {
        Name = "main_nat_eip"
    }
}

resource "aws_nat_gateway" "main_nat_gateway" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id     = aws_subnet.public1.id
    
    tags = {
        Name = "main_nat_gateway"
    }
}