resource "aws_instance" "example" {
  ami           = "ami-06cb61a83c506fe88"
  instance_type = "t3.medium"  
  tags = {
    Name = var.name
  }
}
