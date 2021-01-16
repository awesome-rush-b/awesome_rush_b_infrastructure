// create rds instance------------------------------------------------------------
// create instance
resource "aws_db_instance" "database" {
  allocated_storage    = 30
  storage_type         = "gp2"

  engine               = "mysql"
  engine_version       = "5.7"

  instance_class       = "db.t3.micro"

  multi_az = false

  name                 = "${var.project_name}_Mysql" // This will be the schema name
  username             = var.database_username // this will be the login user name
  password             = var.database_password // this will be the login user password

  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name

  storage_encrypted = true

  vpc_security_group_ids = [aws_security_group.database_security_group.id]

  publicly_accessible = true

  skip_final_snapshot = true

  tags = {
    "name" = "${var.project_name}_database"
  }

  depends_on = [ aws_db_subnet_group.db_subnet_group ]
}