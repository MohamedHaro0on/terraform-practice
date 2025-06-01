# VPC VARIABLES
variable "main_vpc" {
    description = "Configuration for the VPC"
    type = object ({
        cidr_block = string
        name = string
        tenancy = string
    })
}

# SUBNET VARIABLES
variable "subnets_list" {
    description = "List of Subnets to Create"
    type = list(object ({
        cidr_block = string
        name = string
        availability_zone = string
        map_public_ip_on_launch = bool
    }))
}
# EC2 INSTANCE VARIABLES

variable "ec2_configuration" {
    description = "Configuration for the EC2 Instance"
    type = object ({
        instance_type = string
        ami_id = string
        key_name = string
    })
}

variable "region" {
    description = "AWS region"
    type = string
    default = "us-east-1"
}