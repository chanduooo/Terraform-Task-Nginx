resource "aws_instance" "task_instance" {
  ami           = var.ami-id 
  instance_type = var.instance-type
  key_name      = var.key-name
  subnet_id = aws_subnet.public-subnet.id
  vpc_security_group_ids  = [ aws_security_group.web_sg.id ]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y nginx
              systemctl start nginx
              systemctl enable nginx
              echo "Hello, This is Nginx Server!" > /usr/nginx/www/html/index.html
              EOF

  tags = {
    Name = "Task-Instance"
  }
}

output "instance_public_ip" {
  value = aws_instance.task_instance.public_ip
}