terraform {
    backend "s3" {
        bucket = "aws-codepipeline-tfstate-backend-demo-01"
        key = "global/codepipeline/terraform.tfstate"
        region = "eu-west-1"
        dynamodb_table = "tfstate-locking-DB-demo-01"
        encrypt = true
    }
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.0"
        }
    }
}
provider "aws" {
    region = "eu-west-1"
}
