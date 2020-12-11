PROJECT 1 - DEPLOY HELM CHART ON EKS

Pre-Reqs

AWS- CLI

Terraform 0.12 - for eks infra

Terraform ~> 0.12 - for tiller and helm v2

Helm V2

Bash Shell

$$ VARIABLES For Jenkins > Configure System > Global Properties


AWS_ACCESS_KEY_ID

AWS_DEFAULT_REGION

AWS_SECRET_ACCESS_KEY

TF_VAR_bucket_name

TF_VAR_eks_cluster_name

TF_VAR_region


Please edit the bucket name on variables.tf (https://github.com/crishonsou/s3-bucket) with a unique name of you preference.


Please edit git url on Jenkinsfile and Jenkins Pipeline configuration, pointing to you git repository.
