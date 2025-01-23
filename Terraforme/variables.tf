# VPC Configuration
variable "vpc_cidr_block" {
  description = "CIDR block pour le VPC"
  type        = string
}

variable "subnet_cidr_block" {
  description = "CIDR block pour le sous-réseau"
  type        = string
}

variable "availability_zone" {
  description = "Zone de disponibilité AWS"
  type        = string
}

# SSH Configuration
variable "key_name" {
  description = "Nom de la clé SSH"
  type        = string
}

variable "public_key_path" {
  description = "Chemin du fichier de clé publique SSH"
  type        = string
}

# EC2 Instances
variable "ami" {
  description = "AMI pour les instances EC2"
  type        = string
}

variable "instance_type" {
  description = "Type d'instance EC2"
  type        = string
}

# S3 Bucket
variable "s3_bucket_name" {
  description = "Nom unique pour le bucket S3"
  type        = string
}
