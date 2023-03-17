output "public_ip1" {
  description = "Public IP of instance"
  value       = aws_instance.server1.public_ip
}
output "public_ip2" {
  description = "Public IP of instance"
  value       = aws_instance.server2.public_ip
}
output "ami1" {
  description = "AMI of instance"
  value       = aws_instance.server1.ami
}
output "ami2" {
  description = "AMI of instance"
  value       = aws_instance.server2.ami
}
data "aws_caller_identity" "current" {
}
output "user_identity" {
  description = "My identity"
  value       = data.aws_caller_identity.current
}
output "az_subnet_r1" {
  value = aws_subnet.subnet_r1.availability_zone
  #value = element(data.aws_availability_zones.azs_available_r1[*].names[1],1)
}
output "az_subnet_r2" {
  value = aws_subnet.subnet_r2.availability_zone
  #value = element(data.aws_availability_zones.azs_available_r2[*].names[1],1)
}
