resource "aws_subnet" "eks_subnet_private_la" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 3)
  availability_zone = "${data.aws_region.current.name}a"

  tags = merge(
    var.tags,
    {
      Name                              = "comunidadedevops-vpc"
      Name                              = "${var.project_name}-priv-subnet-1a"
      "kubernetes.io/role/internal-elb" = 1
    }

  )

}

resource "aws_subnet" "eks_subnet_private_lb" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 4)
  availability_zone = "${data.aws_region.current.name}b"
  tags = merge(
    var.tags,
    {
      Name                              = "comunidadedevops-vpc"
      Name                              = "${var.project_name}-priv-subnet-1b"
      "kubernetes.io/role/internal-elb" = 1


    }
  )
}

resource "aws_route_table_association" "eks_rtb_assio_priv_1a" {
  subnet_id      = aws_subnet.eks_subnet_private_la.id
  route_table_id = aws_route_table.eks_private_route_table_1a.id

}

resource "aws_route_table_association" "eks_rtb_assio_priv_1b" {
  subnet_id      = aws_subnet.eks_subnet_private_lb.id
  route_table_id = aws_route_table.eks_private_route_table_1b.id

}
