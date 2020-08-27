# create vpc

data "aws_availability_zones" "aws-az" {
  state = "available"
}

#resource "aws_vpc" "aws-vpc" {
  #cidr_block = var.aws_vpc_cidr
	#id = "${aws_vpc.aws-vpc.id}"
	#id=	var.aws_vpc_id
	#id=aws_vpc.aws-vpc.id
	#cidr_block = aws_vpc.aws-vpc.cidr_block

#}

resource "aws_vpc" "aws-vpc" {
  cidr_block = var.aws_vpc_cidr
  #id = var.aws_vpc_id
}

#data "aws_vpc" "aws-vpc" {
  #default = true
  #id = var.aws_vpc_id
#}

#@NoDestroy
data "aws_subnet_ids" "subnet" {
  vpc_id = aws_vpc.aws-vpc.id
}



