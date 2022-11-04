resource "aws_instance" "web" {
   ami = var.AMI_ID
   instance_type = var.INTANCE_TYPE
   tags = {Name = "airbnb-web-server-instance"} 
   monitoring = true
   ebs_optimized = true
   root_block_device {
   encrypted     = true
     }
}