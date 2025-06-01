resource "aws_key_pair" "ssh_keys" {
    key_name   = "ssh_keys"
    public_key = file("~/.ssh/id_rsa.pub")
}

data "aws_ami" "ubuntu" {
  owners = ["099720109477"]
  most_recent = true
  
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


resource "aws_instance" "bastion_host" {
    ami           = data.aws_ami.ubuntu.id
    instance_type = var.ec2_configuration.instance_type
    subnet_id     = aws_subnet.subnets ["public_subnet_1"].id
    key_name      = aws_key_pair.ssh_keys.key_name 
    associate_public_ip_address = true
    tags = {
        Name        = "bastion_host"
        Environment = "dev"
    }
    
    vpc_security_group_ids = [aws_security_group.bastion_host_sg.id]
}


resource "aws_instance" "private_instance" {
    ami           = data.aws_ami.ubuntu.id
    instance_type = var.ec2_configuration.instance_type
    subnet_id     = aws_subnet.subnets ["private_subnet_1"].id
    key_name      = aws_key_pair.ssh_keys.key_name 
    
    tags = {
        Name        = "private_instance"
        Environment = "dev"
    }
    
    vpc_security_group_ids = [aws_security_group.private_instance_sg.id]
}