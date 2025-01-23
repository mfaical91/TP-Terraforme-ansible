# VPC Configuration
vpc_cidr_block    = "10.0.0.0/16"
subnet_cidr_block = "10.0.1.0/24"
availability_zone = "us-east-1a"

# SSH Configuration
key_name        = "faical-key"
public_key_path = "~/.ssh/id_rsa.pub"

# EC2 Instances
ami            = "ami-04b4f1a9cf54c11d0"
instance_type  = "t2.micro"

# S3 Bucket
s3_bucket_name = "faical-bucket"
