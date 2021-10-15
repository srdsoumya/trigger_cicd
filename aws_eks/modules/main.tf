# Creating IAM role for Kubernetes clusters to make calls to other AWS services on your behalf to manage the resources that you use with the service.
resource "aws_iam_role" "iam-role-eks-cluster" {
  name               = "${var.cluster_name}-role"
  assume_role_policy = file("${path.module}/eks_assume_role_policy.json")
}

# Dynamically attaching the EKS-Cluster policies to the terraformekscluster role.
resource "aws_iam_role_policy_attachment" "eks-cluster-AmazonEKSpolicy" {
  count       = length("${var.master_node_policy}")
  policy_arn  = "arn:aws:iam::aws:policy/${element(var.master_node_policy, count.index)}"
  role        = "${aws_iam_role.iam-role-eks-cluster.name}"
}


# Security group for network traffic to and from AWS EKS Cluster.
resource "aws_security_group" "cluster_sg_mgmt" {
  name        = "${var.cluster_name}-sg"
  vpc_id      = "${var.cluster_vpc_id}" 

  # Egress allows Outbound traffic from the EKS cluster to the  Internet 
                             # Outbound Rule
  egress      = var.sg_egress

# Ingress allows Inbound traffic to EKS cluster from the  Internet 
                             # Inbound Rule
  ingress     = var.sg_ingress
}


# Creating the EKS cluster

resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.cluster_name}"
  role_arn = "${aws_iam_role.iam-role-eks-cluster.arn}"
  version  = "${var.cluster_version}"

# Adding VPC Configuration

  vpc_config {             # Configure EKS with vpc and network settings 
   security_group_ids = ["${aws_security_group.cluster_sg_mgmt.id}"]
   subnet_ids         = var.master_node_subnet
  }



  #Explicit dependencies are static references
  depends_on = [
    aws_iam_role_policy_attachment.eks-cluster-AmazonEKSpolicy[0],
	  aws_iam_role_policy_attachment.eks-cluster-AmazonEKSpolicy[1]
   ]
}

# Creating IAM role for EKS nodes to work with other AWS Services. 

resource "aws_iam_role" "eks_nodes" {
  name               = "${var.cluster_name}-node-group-iam-role"
  assume_role_policy = file("${path.module}/ec2_assume_role_policy.json")
}




# Attaching the different Policies to Node Members.

resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
  count      = length("${var.worker_node_policy}")
  policy_arn = "arn:aws:iam::aws:policy/${element(var.worker_node_policy, count.index)}"
  role       = "${aws_iam_role.eks_nodes.name}"
}

# Create EKS cluster node group

resource "aws_eks_node_group" "node" {
  cluster_name    = "${aws_eks_cluster.eks_cluster.name}"
  node_group_name = "${var.work_node_gp_name}"
  node_role_arn   = "${aws_iam_role.eks_nodes.arn}"
  subnet_ids      = "${var.worker_node_subnet}"
  ami_type        = "${var.ami_type}"
  instance_types  = "${var.instance_types}"
  disk_size       = "${var.disk_size}"

  scaling_config {
    desired_size = "${var.worker_node_scaling.desired_size}"
    max_size     = "${var.worker_node_scaling.max_size}"
    min_size     = "${var.worker_node_scaling.min_size}"
  }

  #Explicit dependencies are static references
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy[0],
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy[1],
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy[2]
  ]
}
