# NETWORKING 
main_vpc = {
  cidr_block="10.0.0.0/16"
  tenancy = "default"
  name = "main_vpc"
}


# Subnet CIDR blocks
subnets_list = [
    {
        cidr_block = "10.0.0.0/24",
        name = "public_subnet_1"
        availability_zone = "us-east-1a"
        map_public_ip_on_launch = true
    },
    {
        cidr_block = "10.0.1.0/24",
        name = "public_subnet_2"
        availability_zone = "us-east-1b"
        map_public_ip_on_launch = true
    },
    {
        cidr_block = "10.0.3.0/24",
        name = "private_subnet_1"
        availability_zone = "us-east-1a"
        map_public_ip_on_launch = false
    },
    {
        cidr_block = "10.0.4.0/24",
        name = "private_subnet_2"
        availability_zone = "us-east-1b"
        map_public_ip_on_launch = false
    }
]


# EC2 INSTANCE 

ec2_configuration = {
    instance_type="t2.micro"
    ami_id="ami-0e449927258d45bc4"
    key_name="ssh_keys"
}
