output "output_create_eks_cluster" {
  value = aws_eks_cluster.eks_cluster.id
}
output "eks_cluster_endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}
output "eks_cluster_certificate_authority" {
  value = aws_eks_cluster.eks_cluster.certificate_authority 
}
