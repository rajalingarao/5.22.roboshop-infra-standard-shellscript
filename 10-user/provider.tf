terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 6.37.0"
    }
  }
backend "s3" {
  bucket = "linga-devops-rs"
  key = "roboshop-infra-standard-user"
  region = "us-east-1"
  #dynamodb_table = "roboshop13-locking"
  use_lockfile = true
  }
}
provider "aws" {
  region = "us-east-1"
}