resource "aws_subnet" "subnets" {
    for_each =  {for subnet in var.subnets_list : subnet.name => subnet}
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = each.value.cidr_block 
    availability_zone = each.value.availability_zone
    map_public_ip_on_launch = each.value.map_public_ip_on_launch
    tags = {
        Name = each.value.name
    }
}