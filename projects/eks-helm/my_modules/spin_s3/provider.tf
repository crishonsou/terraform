# AWS Provider - s3 bucket + access to EKS cluster
provider "aws" {
  region = var.region
}

# Reference EKS Cluster credentials by supplying name
data "aws_eks_cluster" "default" {
  name = var.eks_cluster_name
}

data "aws_eks_cluster_auth" "default" {
  name = var.eks_cluster_name
}

# Helm Provider - use helm provider w/ EKS credentials
provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.default.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.default.certificate_authority.0.data)
    token                  = data.aws_eks_cluster_auth.default.token
    load_config_file       = false
  }
}
