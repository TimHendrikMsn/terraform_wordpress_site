# 🌍 WordPress Infrastructure on AWS (Terraform)

A terraform repo to create the network, IAM, and data layers for a WordPress deployment on AWS. This repo is structured by environment (at the moment just `dev`) with reusable modules under `modules/`.


## 📁 Project structure

```
terraform/
  dev/
    iam/
    network/
    storage/
    compute/ (at some point)
  modules/
    ec2/ (at some point)
    igw/
    rds/
    route_tables/
    security_groups/
    subnets/
    vpc/
```

Each environment (e.g. `terraform/dev`) has its own state and configs, while `terraform/modules` contains reusable building blocks.

---

## 🧰 Prerequisites
- Terraform >= 1.0
- AWS CLI v2 with an account and permissions to create VPC, Subnets, IGW, Route Tables, RDS, IAM
- An AWS CLI profile (defaults to `terraform`), or override via Terraform variables

---

## 🔐 Configure AWS and parameters

1) Configure an AWS profile named `terraform` (or choose your own and override `aws_profile`):

```bash
aws configure --profile terraform
```

2) Create SSM Parameter Store values for the DB credentials (defaults assume `env=dev`, `name_prefix=wp` so the paths are `/dev/wp/...`). Replace placeholders as needed:
/dev/wp/DBUser
/dev/wp/DBPassword
/dev/wp/DBName
 

---

## Deploy (apply) in order
Run each stack from its directory. The `storage` stack reads local state from `dev/network/terraform.tfstate`, so apply `network` first.

Network (VPC, subnets, IGW, route tables, SGs):
```bash
cd terraform/dev/network
terraform init -upgrade
terraform apply
```

IAM (role, instance profile):
```bash
cd ../iam
terraform init
terraform apply
```

Storage (RDS instance, using SSM params and network state):
```bash
cd ../storage
terraform init
terraform apply
```

---

## 🗑️ Destroy in reverse order
```bash
cd terraform/dev/storage && terraform destroy
cd ../iam && terraform destroy
cd ../network && terraform destroy
```
