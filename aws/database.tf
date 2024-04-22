resource "aws_db_parameter_group" "itp4121" {
  name   = "itp4121"
  family = "postgres14"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

resource "aws_db_instance" "itp4121" {
  identifier             = "itp4121-database"
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "14.11"
  username               = "postgres"
  password               = "postgres"
  db_subnet_group_name   = aws_db_subnet_group.vpc.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  parameter_group_name   = aws_db_parameter_group.itp4121.name
  publicly_accessible    = true
  skip_final_snapshot    = true
}