variable "cluster_name" {
	type = string
	description = ""
}

variable "cluster_version" {
	type = string
	default = "1.19"
}

variable "tag_name"{
	type = string
	description = "note: vpc must be available as defined"
}

variable "vpc_id" {
	type = string
	description = "note: vpc must be available as defined"
}

variable "subnet_ids" {
	type = list
	description = "Note: subnet must available in defined vpc and must be private"
}

variable "no_of_node" {
	type = number
	description = "Note: priority to pass as per node"
}

variable "instance_types" {
	type = list
	default = ["t3.medium"]
	description = ""
}

variable "disk_size" {
	type = number
	default = 20
	description = ""
}

variable "ami_type" {
	type = string
	default = "AL2_x86_64"
	description = ""
}

variable "work_node_gp_name"{
	type = string
	default = "node_group1"
}

variable "master_node_policy" {
	type = list
	default = ["AmazonEKSClusterPolicy","AmazonEKSServicePolicy"]
}

variable "worker_node_policy" {
	type = list
	default = ["AmazonEKSWorkerNodePolicy","AmazonEKS_CNI_Policy","AmazonEC2ContainerRegistryReadOnly"]
}

variable "sg_ingress" {
	default = [{
	description = ""
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/26"]
	ipv6_cidr_blocks = []
	prefix_list_ids  = []
	security_groups  = []
	self 			 = false
	}]
}

variable "sg_egress" {
	default = [{
	description = ""
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/26"]
	ipv6_cidr_blocks = []
	prefix_list_ids  = []
	security_groups  = []
	self 			 = false
	}]
}

