resource "kubernetes_service_account_v1" "alb_controller" {
  metadata {
    name      = "aws-load-balancer-controller"
    namespace = "kube-system"

    annotations = {
      "eks.amazonaws.com/role-arn" = var.alb_role_arn
    }
  }
}

resource "helm_release" "alb_controller" {
  name       = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"


  depends_on = [
    kubernetes_service_account_v1.alb_controller
  ]

  set =[{
    name  = "clusterName"
    value = var.cluster_name
  }

, {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }

, {
    name  = "region"
    value = var.aws_region
  }

, {
    name  = "vpcId"
    value = var.vpc_id
  }

, {
    name  = "serviceAccount.create"
    value = "false"
  }]
}
