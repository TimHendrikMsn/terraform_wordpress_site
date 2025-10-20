# Terraform AWS Infrastructure

This project provisions a complete AWS network stack using Terraform.

## Structure
terraform/
│
├── ec2/               # EC2 instances
├── iam/               # IAM roles and policies
├── igw/               # Internet Gateway
├── rds/               # RDS databases
├── route_tables/      # Route tables
├── security_groups/   # Security groups
├── ssm/               # SSM parameters
├── subnets/           # Public & private subnets
├── vpc/               # VPC configuration
│
├── europe.tfvars      # Environment variables
├── tf.sh              # Helper script
├── .gitignore
└── README.md


## Preparations
1) Create an aws configuration called "terraform" to use it as the profile as specified in the root providers.tf file

2) Create the following parameters in the SSM parameter store in the "eu-central-1"-region:
| Name                            | Description               | Tier     | Type         | Data Type | Value              |
| ------------------------------- | ------------------------- | -------- | ------------ | --------- | ------------------ |
| `/A4L/Wordpress/DBUser`         | Wordpress Database User   | Standard | String       | text      | set value          |
| `/A4L/Wordpress/DBName`         | Wordpress Database Name   | Standard | String       | text      | set value          |
| `/A4L/Wordpress/DBPassword`     | Wordpress DB Password     | Standard | SecureString | text      | set value          |
| `/A4L/Wordpress/DBRootPassword` | Wordpress DBRoot Password | Standard | SecureString | text      | set value          |



## Usage

```bash
# Apply all stacks in order
./tf.sh apply

# Destroy all stacks in reverse order
./tf.sh destroy

# Apply all stacks starting at e.g. ec2
./tf.sh apply ec2

# Destroy all stacks in reverse order starting at e.g. ec2
./tf.sh destroy ec2
