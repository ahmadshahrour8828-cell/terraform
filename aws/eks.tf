resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster.arn
  version  = var.kubernetes_version

  vpc_config {
    subnet_ids              = var.private_subnet_ids
    security_group_ids      = [var.cluster_security_group_id]
    endpoint_private_access = var.cluster_endpoint_private_access
    endpoint_public_access  = var.cluster_endpoint_public_access
    public_access_cidrs     = var.cluster_endpoint_public_access_cidrs
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]

  tags = {
    Project = var.cluster_name
  }
}

resource "aws_eks_node_group" "system" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.cluster_name}-system"
  node_role_arn   = aws_iam_role.eks_nodes.arn
  subnet_ids      = var.private_subnet_ids
  instance_types  = var.system_instance_types
  capacity_type   = "ON_DEMAND"

  scaling_config {
    min_size     = var.system_min_size
    desired_size = var.system_desired_size
    max_size     = var.system_max_size
  }

  labels = {
    role = "system"
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_eks_cluster.this,
    aws_iam_role_policy_attachment.node_worker,
    aws_iam_role_policy_attachment.node_cni,
    aws_iam_role_policy_attachment.node_ecr
  ]

  tags = {
    Project = var.cluster_name
    Role    = "system"
  }
}

resource "aws_eks_node_group" "application" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.cluster_name}-application"
  node_role_arn   = aws_iam_role.eks_nodes.arn
  subnet_ids      = var.private_subnet_ids
  instance_types  = var.application_instance_types
  capacity_type   = "ON_DEMAND"

  scaling_config {
    min_size     = var.application_min_size
    desired_size = var.application_desired_size
    max_size     = var.application_max_size
  }

  labels = {
    role = "application"
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.node_worker,
    aws_iam_role_policy_attachment.node_cni,
    aws_iam_role_policy_attachment.node_ecr
  ]

  tags = {
    Project = var.cluster_name
    Role    = "application"
  }
}