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
  node_instance_type = "t3.medium"
}

module "alb_controller" {
  source = "../../modules/helm_provider"

  cluster_name     = module.eks.cluster_name
  cluster_endpoint = module.eks.cluster_endpoint
  cluster_ca       = module.eks.cluster_ca
  alb_role_arn     = module.eks.alb_role_arn
  vpc_id           = module.vpc.vpc_id
  aws_region       = var.region
}