# Fichier outputs.tf pour afficher les informations de sortie utiles

# Afficher l'adresse IP publique de l'instance master-faical
output "master_faical_public_ip" {
  value = aws_instance.master_faical.public_ip
  description = "Public IP address of the master-faical instance"
}

# Afficher l'adresse IP publique de l'instance note1-faical
output "note1_faical_public_ip" {
  value = aws_instance.note1_faical.public_ip
  description = "Public IP address of the note1-faical instance"
}

# Afficher l'adresse IP publique de l'instance note2-faical
output "note2_faical_public_ip" {
  value = aws_instance.note2_faical.public_ip
  description = "Public IP address of the note2-faical instance"
}

# Afficher le nom du bucket S3 créé
output "faical_bucket_name" {
  value = aws_s3_bucket.faical_bucket.bucket
  description = "Name of the S3 bucket"
}

# Afficher l'ID du VPC créé
output "faical_vpc_id" {
  value = aws_vpc.faical_vpc.id
  description = "ID of the VPC"
}

# Afficher l'ID du groupe de sécurité créé
output "faical_security_group_id" {
  value = aws_security_group.faical_sg.id
  description = "ID of the security group"
}
