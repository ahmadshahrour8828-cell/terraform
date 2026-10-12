terraform {
  required_version = ">= 1.6.0"
  
  backend "s3" {
    bucket = "terraform-state-backend-qasem-smart"
    key = "tfstate"
    region = "eu-central-1"
    profile = "default"
    encrypt = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.60, < 7.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.30"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.14"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}