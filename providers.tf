terraform {

  required_version = "~> 1.5.2"

  backend "s3" {}

  required_providers {
    external = {
      source  = "hashicorp/external"
      version = "~> 2.3.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.7.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2.1"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}