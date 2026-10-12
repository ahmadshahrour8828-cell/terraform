variable "region" {
  description = "AWS region where the existing VPC and EKS cluster will reside."
  type        = string
  default     = "eu-central-1"
}

variable "cluster_name" {
  type    = string
  default = "eks-smart-cluster"
}

variable "kubernetes_version" {
  description = "Must be supported by EKS in the selected region."
  type        = string
  default     = "1.32"
}

variable "vpc_id" {
  description = "ID of the existing VPC."
  type        = string
}

variable "private_subnet_ids" {
  description = "At least two existing subnets in different AZs for EKS nodes; use private subnets recommended."
  type        = list(string)
}

variable "cluster_security_group_id" {
  description = "Existing security group to attach to the EKS control plane. Must have suitable control-plane rules."
  type        = string
}

variable "node_security_group_id" {
  description = "Existing security group to attach to worker nodes. Must allow required EKS/node/pod traffic."
  type        = string
}

variable "cluster_endpoint_public_access" {
  type    = bool
  default = true
}

variable "cluster_endpoint_private_access" {
  type    = bool
  default = true
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "Trusted CIDRs allowed to reach public EKS API endpoint."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "system_instance_types" {
  type    = list(string)
  default = ["t3.medium"]
}

variable "application_instance_types" {
  type    = list(string)
  default = ["t3.large"]
}

variable "system_min_size" {
  type    = number
  default = 2
}

variable "system_desired_size" {
  type    = number
  default = 2
}

variable "system_max_size" {
  type    = number
  default = 3
}

variable "application_min_size" {
  type    = number
  default = 1
}

variable "application_desired_size" {
  type    = number
  default = 2
}

variable "application_max_size" {
  type    = number
  default = 4
}

variable "git_repo_url" {
  type    = string
  default = "https://github.com/argoproj/argocd-example-apps.git"
}

variable "git_path" {
  type    = string
  default = "guestbook"
}