output "cluster_name" {
    value = aws_eks_cluster.cluster.name
}

output "cluster_endpoint" {
    value = aws_eks_cluster.cluster.endpoint  
}
output "alb_role_arn" {
  value = aws_iam_role.alb_controller_role.arn
}
output "cluster_role_arn" {
  value = aws_iam_role.eks_cluster_role.arn
}




output "cluster_ca" {
  value = aws_eks_cluster.cluster.certificate_authority[0].data
}

