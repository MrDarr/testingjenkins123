data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}
data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "java-cluster"
  cluster_version = "1.20"
  vpc_id          = module.vpc.vpc_id
 subnet_ids = module.vpc.private_subnets
  
}
resource "null_resource" "java"{
  depends_on = [module.eks]
  provisioner "local-exec" {
    command = "aws eks --region us-east-1  update-kubeconfig --name $AWS_CLUSTER_NAME"
    environment = {
      AWS_CLUSTER_NAME = "java-cluster"
    }
  }
}

resource "aws_eks_node_group" "worker-node-group" {
  cluster_name  = "java-cluster"
  node_group_name = "nodes"
  node_role_arn  = "arn:aws:iam::202467142321:role/eks-node-group-example"
  subnet_ids   = module.vpc.private_subnets
  instance_types = ["t3.small"]
 
  scaling_config {
   desired_size = 2
   max_size   = 3
   min_size   = 1
  }
}
