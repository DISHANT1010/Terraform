# key_pair 

resource "aws_key_pair" "terraform_key" {
   key_name = "terraform_key"
   public_key = file("terrakey-ec2.pub")
}

# vpc & security group

resource "aws_default_vpc" "default_vpc" {
   tags = {
    name = "Defualt vpc"
   }
}

resource "aws_security_group" "secutiy_group" {
  name = "allow_tls"
  description = "This security group created using TF"
  vpc_id = aws_default_vpc.default_vpc.id

#  inbound rule
ingress {
    to_port = 22
    from_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH open"
}

ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP open"
}

ingress {
    from_port = 8000
    to_port = 8000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Django App"
}
# outbound rule
egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "open for all"
}

  tags = {
    name = "allow_tls"
  }
}

# EC2 instance

resource "aws_instance" "terraform-instance" {
   key_name = aws_key_pair.terraform_key.key_name
   security_groups = [aws_security_group.secutiy_group.name]
   instance_type = "t2.micro"
   ami = "ami-04f167a56786e4b09"

   root_block_device {
     volume_size = 15
     volume_type = "gp3"
   }

   tags = {
    Name = "terraform-instance"
   }
}