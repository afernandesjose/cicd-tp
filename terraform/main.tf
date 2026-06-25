terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ec2 = "http://localhost:4566"
    s3  = "http://localhost:4566"
    ssm = "http://localhost:4566"
  }
}

variable "environment" {
  type        = string
  description = "Le nom de l'environnement"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket        = "my-bucket"
  force_destroy = true

  tags = {
    Environment = var.environment
  }
}
