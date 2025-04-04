variable "ec2_instance_type" {
   default = "t2.micro"
   type = string
}

variable "ec2_storage_size" {
  default = 15
  type = number
}

variable "ec2_image_id" {
  default = "ami-0e35ddab05955cf57"
  type = string
}

variable "env" {
  default = "dev"
  type = string
}