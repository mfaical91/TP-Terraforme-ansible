# Création du VPC
resource "aws_vpc" "faical_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "faical-vpc"
  }
}

# Création du Subnet Public
resource "aws_subnet" "faical_subnet" {
  vpc_id                  = aws_vpc.faical_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "faical-public-subnet"
  }
}

# Création de l'Internet Gateway
resource "aws_internet_gateway" "faical_igw" {
  vpc_id = aws_vpc.faical_vpc.id

  tags = {
    Name = "faical-internet-gateway"
  }
}

# Route Table pour permettre l'accès à Internet via l'Internet Gateway
resource "aws_route_table" "faical_route_table" {
  vpc_id = aws_vpc.faical_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.faical_igw.id
  }

  tags = {
    Name = "faical-route-table"
  }
}

# Associer la Route Table au Subnet
resource "aws_route_table_association" "faical_subnet_association" {
  subnet_id      = aws_subnet.faical_subnet.id
  route_table_id = aws_route_table.faical_route_table.id
}

# Groupe de sécurité pour les instances
resource "aws_security_group" "faical_sg" {
  name        = "faical-security-group"
  description = "Allow SSH and HTTP/HTTPS access"
  vpc_id      = aws_vpc.faical_vpc.id
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Accès SSH
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Accès HTTP
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Accès HTTPS
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "faical-sg"
  }
}
# Clé SSH
resource "aws_key_pair" "faical_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}



# Création des instances EC2 dans le Subnet public
resource "aws_instance" "master_faical" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.faical_subnet.id
  vpc_security_group_ids = [aws_security_group.faical_sg.id]  # Utilisation du groupe de sécurité
  key_name               = var.key_name

  tags = {
    Name = "master-faical"
  }
}

resource "aws_instance" "note1_faical" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.faical_subnet.id
  vpc_security_group_ids = [aws_security_group.faical_sg.id]  # Utilisation du groupe de sécurité
  key_name               = var.key_name

  tags = {
    Name = "note1-faical"
  }
}

resource "aws_instance" "note2_faical" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.faical_subnet.id
  vpc_security_group_ids = [aws_security_group.faical_sg.id]  # Utilisation du groupe de sécurité
  key_name               = var.key_name

  tags = {
    Name = "note2-faical"
  }
}

# Bucket S3
resource "aws_s3_bucket" "faical_bucket" {
  bucket = var.s3_bucket_name

  tags = {
   Name = "faical-bucket"
 }
}

