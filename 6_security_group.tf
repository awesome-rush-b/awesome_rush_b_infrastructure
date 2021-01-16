resource "aws_security_group" "ec2_security_group" {
    
    name = "${var.project_name}_ec2_security_group"

    vpc_id = aws_vpc.vpc.id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress  {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    } 
}

// database_security_group----------------------------------------------------------------
resource "aws_security_group" "database_security_group" {
    name        = "database_security_group"
    description = "database security group"
    vpc_id      = aws_vpc.vpc.id

    ingress {
        from_port   = 3306
        to_port     = 3306
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress  {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    } 

    tags = {
        Name = "${var.project_name}_database_security_group"
    }

}

resource "aws_security_group_rule" "database_between_webapp" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id = aws_security_group.ec2_security_group.id
  security_group_id = aws_security_group.database_security_group.id


}
