provider "aws" {
    region = var.region
  
}
terraform {
  backend "s3" {
    bucket = "devops-platform-terraform-state-navneet"
    key = "dev/terraform.tfstate"
    region = "us-west-1"

    use_lockfile = true
    
  }
}