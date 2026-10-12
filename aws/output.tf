output "cluster_name" {
  value = aws_eks_cluster.this.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.this.endpoint
}

output "cluster_security_group_id" {
  value = var.cluster_security_group_id
}

output "node_security_group_id" {
  value = var.node_security_group_id
}

output "system_node_group" {
  value = aws_eks_node_group.system.node_group_name
}

output "application_node_group" {
  value = aws_eks_node_group.application.node_group_name
}
