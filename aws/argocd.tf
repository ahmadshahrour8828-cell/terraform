resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
  version          = "7.7.16"

  values = [yamlencode({
    server = {
      service = {
        type = "ClusterIP"
      }
    }
  })]

  depends_on = [
    aws_eks_node_group.system,
    aws_eks_node_group.application
  ]
}
