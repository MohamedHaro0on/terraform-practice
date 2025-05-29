resource "aws_security_group" "bastion_host_sg" {
  name        = "bastion_host_sg"
  description = "Security group for the bastion host"
  vpc_id      = aws_vpc.main_vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/8"] # Allow SSH from anywhere, consider restricting this to specific IPs
  }
      tags = {
        Name = "bastion_host_sg"
    }
}



resource "aws_security_group" "private_instance_sg" {
  name        = "private_instance_sg"
  description = "Security group for private instances"
  vpc_id      = aws_vpc.main_vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.bastion_host_sg.id] # Allow SSH from bastion host
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/8"]
  }
    tags = {
        Name = "private_instance_sg"
    }
}