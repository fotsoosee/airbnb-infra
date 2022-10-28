variable "AMI_ID" {
    type = string
    description = "AMI ID"
    default = "ami-065efef2c739d613b"
  
}
variable "INTANCE_TYPE" {
    type = string
    description = "type of ec2"
  default = "t2.nano"
}