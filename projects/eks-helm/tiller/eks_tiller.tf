variable region {}
variable eks_cluster_name {}
module "eks_tiller" {
  source           = "github.com/darkn3rd/eks-tiller?ref=v0.0.1"                        
  region           = var.region                            
  eks_cluster_name = var.eks_cluster_name                       
}
