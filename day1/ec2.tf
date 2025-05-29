resource "aws_key_pair" "ssh_keys" {
    key_name   = "ssh_keys"
    public_key = file("~/.ssh/id_rsa.pub")
}


resource "aws_instance" "bastion_host" {
    ami           = "ami-0e449927258d45bc4" 
    instance_type = "t2.micro"
    subnet_id     = aws_subnet.public1.id
    key_name      = aws_key_pair.ssh_keys.key_name 
    associate_public_ip_address = true
    tags = {
        Name        = "bastion_host"
        Environment = "dev"
    }
    
    vpc_security_group_ids = [aws_security_group.bastion_host_sg.id]
}


resource "aws_instance" "private_instance" {
    ami           = "ami-0e449927258d45bc4"
    instance_type = "t2.micro"
    subnet_id     = aws_subnet.private1.id
    key_name      = aws_key_pair.ssh_keys.key_name 
    
    tags = {
        Name        = "private_instance"
        Environment = "dev"
    }
    
    vpc_security_group_ids = [aws_security_group.private_instance_sg.id]
}