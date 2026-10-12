aws_region = "eu-central-1"
vpc_id = "vpc-0bfb3d048845b8c15"

cluster_name   = "eks-smart-cluster"
kubernetes_version = "1.32"

# Replace these with IDs from your existing AWS environment.
private_subnet_ids       = ["subnet-0916d8e9d9101e9d5", "subnet-02dece101d728c61b"]
cluster_security_group_id = "sg-06e95ef5cebf22528"
node_security_group_id    = "sg-06e95ef5cebf22528"

# Replace with your actual public IP/CIDR. Do not use 0.0.0.0/0 for production.
cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]

git_repo_url = "https://github.com/argoproj/argocd-example-apps.git"
git_path     = "guestbook"