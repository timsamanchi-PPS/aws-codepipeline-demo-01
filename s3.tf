
# create S3 bucket to store aws-codebuild arifacts
# acl: private
# versioning: enabled
# encryption: enabled

# 1- s3 bucket
resource "aws_s3_bucket" "aws-codepipeline-artifacts-demo-01" {
    bucket = "aws-codepipeline-artifacts-demo-01"
    tags = {
      Name = "aws-codepipeline-artifacts-demo-01"
    }
}
# 2- acl
resource "aws_s3_bucket_acl" "artifact-acl" {
    bucket = aws_s3_bucket.aws-codepipeline-artifacts-demo-01.id
    acl = "private"
}
# 3- versioning
resource "aws_s3_bucket_versioning" "artifacts-versioning" {
    bucket = aws_s3_bucket.aws-codepipeline-artifacts-demo-01.id
    versioning_configuration {
      status = "Enabled" 
    }
}
# 4- encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "artifacts-encryption" {
    bucket = aws_s3_bucket.aws-codepipeline-artifacts-demo-01.id
    rule {
      apply_server_side_encryption_by_default {
          sse_algorithm = "AES256"
      }
    }
}