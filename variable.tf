variable "ami-id"{
    type = string
    default = "ami-078701cc0905d44e4"
}
variable "key-name"{
  type = string
  default = "prasad-devops"
}
variable "instance-type"{
  type = string
  default = "t2.micro"
}
variable "cidr_block"{
    description = "VPC Cidr_block"
    type = string
    default = "192.0.0.0/16"
}
variable "public-subnet-cidr"{
  type = string
  default = "192.0.1.0/24"
}
variable "private_subnet_cidr"{
  type = string
  default = "192.0.2.0/24"
}