resource "aws_db_instance" "practica_recurso2" { 
  identifier        = "practica_recurso2-db" 
  engine            = "mysql" 
  instance_class    = "db.t4g.micro" 
  allocated_storage = 20 
  username          = "admin" 
  password          = "password" 
  db_name           = "primeradb" 
  publicly_accessible = true 
} 
resource "aws_instance" "practica_recursos2_instance" { 
  ami           = "ami-07dc1ccdcec3b4eab"  # Reemplaza con una AMI válida 
  instance_type = "t2.micro" 
  subnet_id     = aws_subnet.subnet.id 
  depends_on = [aws_db_instance.practica_recursos2]  # La instancia EC2 depende de la base de datos RDS 
} 