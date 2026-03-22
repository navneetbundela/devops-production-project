module "vpc" {
    source = "../../modules/vpc"
    region = var.region
    vpc_cidr =  var.cidr_block
    private_subnets = var.private_subnets
    public_subnets = var.public_subnets
}

# module "ecr" {
#     source = "../../modules/ecr"
#     repository_name = "registration_app"
  
# }

module "eks" {
  source = "../../modules/eks"
    subnet_ids = module.vpc.private_subnets
  cluster_name = "platform_cluster"
  max_size = 2
  min_size = 1
  desired_size = 1
  node_instance_type = "t3.micro"
}

