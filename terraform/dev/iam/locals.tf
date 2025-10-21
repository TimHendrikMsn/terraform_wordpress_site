locals {
  wordpress_managed_policies = toset([
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/AmazonElasticFileSystemClientReadWriteAccess"
  ])
}
