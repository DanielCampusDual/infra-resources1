output "vpc_id" {
  value = data.aws_vpc.existing_vpc.id
}

output "subnet_ids" {
  value = [
    data.aws_subnets.public_subnet_1.ids[0],  
    data.aws_subnets.public_subnet_2.ids[0]   
  ]
}

output "security_group_id" {
  value = aws_security_group.ec2_sg.id
}