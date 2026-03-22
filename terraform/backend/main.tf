provider "aws" {
    region = "us-west-2"
  
}

resource "aws_s3_bucket" "terraform_state" {
    bucket = "devops-platform-terraform-state-navneet"

    tags = {
      Name = "terraform-state"
    }
  
}
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}