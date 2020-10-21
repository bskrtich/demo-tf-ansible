terraform {
  required_version = ">= 0.13"

  backend "s3" {
    profile        = "mycompany"
    region         = "us-east-1"       # This is where the s3 status bucket is held
    key            = "demo.tfstate" # Change this value for every tf set
    bucket         = "sunteck-terraform-state"
    dynamodb_table = "sunteck-terraform-state"
  }

  required_providers {
    aws = {
      version = "~> 3.0"
      source = "hashicorp/aws"
    }
    template = {
      version = "~> 2.1"
      source = "hashicorp/template"
    }
  }
}

provider "aws" {
  profile = "mycompany"
  region  = "us-west-1"
}

data "aws_region" "current" {}
