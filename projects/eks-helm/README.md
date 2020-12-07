PROJECT 1 - DEPLOY HELM CHART ON EKS

Pre-Reqs

AWS- CLI

Terraform 0.14 - for eks infra

Terraform ~> 0.12 - for tiller and helm v2

Helm V2

Bash Shell

$$ Setup Project Area

export PROJECT_HOME=$HOME/projects/eks-helm

mkdir -p $PROJECT_HOME && cd $PROJECT_HOME

All scripts needed is being provided through:

https://github.com/crishonsou/terraform

Please visit. Clone Repo and Follow below instructions


# Exporting variables

export TF_VAR_region=us-east-1
export TF_VAR_eks_cluster_name=web-app-cluster


# Initializing and Apply

terraform init
terraform apply



# Acessing cluster

configure aws eks 

aws eks --region $(terraform output region) update-kubeconfig --name $(terraform output cluster_name)

check results

kubectl get nodes


$$ configuring and installing Tiller

# we will use terraform version 12 from here

mkdir -p tiller
cd tiller

cat <<-TILLER_EOF > eks_tiller.tf

variable region {}

variable eks_cluster_name {}

module "eks_tiller" {

  source           = "github.com/darkn3rd/eks-tiller?ref=v0.0.1"   
                     
  region           = var.region 
                           
  eks_cluster_name = var.eks_cluster_name   
                    
}

TILLER_EOF


terraform12 init

terraform12 apply

check results

kubectl get pods --all-namespaces

helm ls

cd ..


$$ Setup Terraform Application Structure


my_modules/
└── spin_s3/
    ├── locals.tf
    ├── main.tf
    ├── provider.tf
    ├── values.yaml.tpl
    └── variables.tf


All scripts needed is being provided through:

https://github.com/crishonsou/s3-bucket

Please visit. Clone Repo and Follow below instructions

$$ Installing Chart

# exporting variables

export TF_VAR_bucket_name=$(

  echo ${TF_VAR_eks_cluster_name}-$(date +'%s')-bucket

)

# access structure and init


cd $PROJECT_HOME/my_modules/spin_s3 && terraform12 init

terraform12 plan

enter bucket name

terraform12 apply

check results

kubectl get services

NAME         TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE

kubernetes   ClusterIP   172.20.0.1      <none>        443/TCP          3h52m

web-app      NodePort    172.20.63.134   <none>        8080:32255/TCP   3m2s

