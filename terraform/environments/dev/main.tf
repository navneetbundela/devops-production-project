module "vpc" {
    source = "../../modules/vpc"
    region = var.region
    vpc_cidr =  var.cidr_block
    private_subnets = var.private_subnets
    public_subnets = var.public_subnets
}

module "ecr" {
    source = "../../modules/ecr"
    repository_name = "registration_app"
  
}