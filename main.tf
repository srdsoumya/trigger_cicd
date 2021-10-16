# aws S3 service provisioning
module "bucket_mfa_versioning"{
  source      = "./aws_s3/versioningmfa"
  bucket_name = "${var.mots_id}-${var.owned_by}"
  tag_name    = "${var.mots_id}_${var.owned_by}_${var.cluster_name}"
}

# aws vpc service provisioning
module "eks_cluster"{
  depends_on   = [module.bucket_mfa_versioning]
  source       = "./aws_eks/modules"
  tag_name     = "${var.mots_id}_${var.owned_by}_${var.cluster_name}"
  cluster_name = "${var.cluster_name}"
  vpc_id       = "${var.vpc_id}"
  subnet_ids   = "${var.subnet_ids}"
  no_of_node   = "${var.no_of_node}"
} 

/*
# aws aurora provisioning
module "rds_aurora"{

}
# aws elasticache(redis) provisioning
module "elasticache_cluster"{

}
*/