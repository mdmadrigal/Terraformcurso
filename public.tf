resource "aws_subnet" "eks_subnet_public_la" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 1)
  availability_zone       = "${data.aws_region.current.name}a"
  map_public_ip_on_launch = true



  tags = merge(
    local.tags,
    {
      Name                         = "comunidadedevops-vpc"
      Name                         = "${var.project_name}-pub-subnet-1a"
      "kubernetes.io / role / elb" = 1
    }

  )

}

resource "aws_subnet" "eks_subnet_public_lb" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 2)
  availability_zone       = "${data.aws_region.current.name}b"
  map_public_ip_on_launch = true
  tags = merge(
    local.tags,
    {
      Name                         = "comunidadedevops-vpc"
      Name                         = "${var.project_name}-pub-subnet-1b"
      "kubernetes.io / role / elb" = 1


    }
  )
}

resource "aws_route_table_association" "eks_rtb_assio_1a" {
  subnet_id      = aws_subnet.eks_subnet_public_la.id
  route_table_id = aws_route_table.eks_public_route_table.id

}

resource "aws_route_table_association" "eks_rtb_assio_1b" {
  subnet_id      = aws_subnet.eks_subnet_public_lb.id
  route_table_id = aws_route_table.eks_public_route_table.id

}

