data "terraform_remote_state" "sns" {
  backend = "s3"
  workspace = "default"

  config = {
    profile        = "sunteck"
    region         = "us-east-1"   # This is where the s3 status bucket is held
    key            = "sns.tfstate" # Change this value for every tf set
    bucket         = "sunteck-terraform-state"
    dynamodb_table = "sunteck-terraform-state"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  workspace = terraform.workspace

  config = {
    profile        = "sunteck"
    region         = "us-east-1"   # This is where the s3 status bucket is held
    key            = "vpc.tfstate" # Change this value for every tf set
    bucket         = "sunteck-terraform-state"
    dynamodb_table = "sunteck-terraform-state"
  }
}

data "terraform_remote_state" "sg" {
  backend = "s3"
  workspace = terraform.workspace

  config = {
    profile        = "sunteck"
    region         = "us-east-1"             # This is where the s3 status bucket is held
    key            = "securitygroup.tfstate" # Change this value for every tf set
    bucket         = "sunteck-terraform-state"
    dynamodb_table = "sunteck-terraform-state"
  }
}
