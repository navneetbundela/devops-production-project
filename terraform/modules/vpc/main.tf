resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "devops-platform-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id

    tags = {
      Name = "devops-plateform-igw"
    }
  
}

resource "aws_subnet" "public_subnets" {
    count =length(var.public_subnets)

    vpc_id = aws_vpc.main.id
    cidr_block = var.public_subnets[count.index]

    availability_zone = "${var.region}${count.index == 0 ? "a" : "b"}"

    tags = {
      Name = "public-subnet-$(count.index)"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/devops-platform" = "shared"
    }
    
}

resource "aws_subnet" "private_subnets" {
    count = length(var.private_subnets)

    vpc_id = aws_vpc.main.id

    cidr_block = var.private_subnets[count.index]

    availability_zone = "${var.region}${count.index == 0 ? "a" : "b"}"

    tags = {

        Name = "private-subnet-$(count.index)"
          "kubernetes.io/role/internal-elb" = "1"
  "kubernetes.io/cluster/devops-platform" = "shared"
    }
  
}

resource "aws_eip" "eip_nat" {
    domain = "vpc"
  
}

resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.eip_nat.id

    subnet_id = aws_subnet.public_subnets[0].id

    tags = {
      Name = "devops-plateform-nat"
    }
  
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id

    route  {

        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

        tags = {
            Name = "public-rt"
        }

    
  
}

resource "aws_route_table" "private" {

    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat.id
    } 

    tags = {
      Name = "private-rt"
      
    }
}

resource "aws_route_table_association" "public_assoc" {
    count = length(aws_subnet.public_subnets)

    subnet_id = aws_subnet.public_subnets[count.index].id
    route_table_id = aws_route_table.public.id
  
}

resource "aws_route_table_association" "private_assoc" {
    count = length(aws_subnet.private_subnets)

    subnet_id = aws_subnet.private_subnets[count.index].id
    route_table_id = aws_route_table.private.id
    
}