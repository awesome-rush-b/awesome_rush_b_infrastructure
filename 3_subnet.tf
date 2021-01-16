resource "aws_subnet" "alpha_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.0.0/18"

  tags = {
    Name = "${var.project_name}_alpha_subnet"
  }
}

resource "aws_subnet" "beta_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.64.0/18"

  tags = {
    Name = "${var.project_name}_beta_subnet"
  }
}

resource "aws_subnet" "charle_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.128.0/18"

  tags = {
    Name = "${var.project_name}_charle_subnet"
  }
}

resource "aws_subnet" "delta_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.192.0/18"

  tags = {
    Name = "${var.project_name}_delta_subnet"
  }
}

// create db subnet
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db_subnet"

  subnet_ids = [aws_subnet.beta_subnet.id,aws_subnet.charle_subnet.id]

  tags = {
    Name = "${var.project_name}_database_db_subnet"
  }

  depends_on = [aws_vpc.vpc,aws_subnet.beta_subnet,aws_subnet.charle_subnet]
}