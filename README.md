# WordPress Infrastructure on AWS (Terraform)

A terraform repo to create the network, IAM, and data layers for a WordPress deployment on AWS. This repo is structured by environment (at the moment just `dev`) with reusable modules under `modules/`.


## Project structure

```
terraform/
  dev/
    compute/
    iam/
    network/
    storage/
  modules/
    auto_scaling_group/
    efs
    igw/
    launch_template/
    load_balancer/
    rds/
    route_tables/
    security_groups/
    subnets/
    vpc/
  tf.sh
```

Each environment (e.g. `terraform/dev`) has its own state and configs, while `terraform/modules` contains reusable building blocks.

---

## Prerequisites
- Terraform >= 1.0
- AWS CLI v2 with an account and permissions to create VPC, Subnets, IGW, Route Tables, RDS, IAM
- An AWS CLI profile (defaults to `terraform`), or override via Terraform variables

---

## Configure AWS and parameters

1) Configure an AWS profile named `terraform` (or choose your own and override `aws_profile`):

```bash
aws configure --profile terraform
```

2) Create SSM Parameter Store values for the DB credentials (defaults assume `env=dev`, `name_prefix=wp` so the paths are `/dev/wp/...`). Replace placeholders as needed:
/dev/wp/DBUser
/dev/wp/DBPassword
/dev/wp/DBName
(depending on your variables env and name_prefix that you choose)

---

## Deploy (apply) in order
Run all Terraform stacks in dependency order:
- run it from inside the terraform folder
- you might need to fix rights (chmod +x tf.sh)

```bash
./tf.sh apply
```

This will:

Initialize and apply each stack under dev/
Order: iam → network → storage → compute

## Destroy in reversed order
Tear down everything in reverse order:

```bash
./tf.sh destroy
````

Order: compute → storage → network → iam


