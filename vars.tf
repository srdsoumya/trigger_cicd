variable "mots_id" {
	default = "321"
}

variable "owned_by" {
	default = "dtv"
}

variable "cluster_name" {
	default = "skava_nonprod"
}

variable "vpc_id" {
	default = "vpc-0d066b274bd6c05a3"
}

variable "subnet_ids" {
	default = ["subnet-09cc53a07375ef0fc","subnet-09b7a28d8e15b9684","subnet-0fcabe6f1b0ded6cc","subnet-0a769de4abf41a046"]
}

variable "no_of_node" {
	default = 1
}