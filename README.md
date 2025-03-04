# AWS ELB with Web Servers - Terraform Project

This Terraform project sets up an Elastic Load Balancer (ELB) with two web servers in a single Availability Zone on AWS.

## Project Overview

The project creates the following resources:
- VPC with a single public subnet
- Two EC2 instances running Apache web servers
- Application Load Balancer (ALB)
- Security Groups for ALB and EC2 instances
- CloudWatch monitoring

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform v1.0.0 or later
- AWS account with necessary permissions

## Usage

1. Initialize Terraform:
```bash
terraform init
```

2. Review the plan:
```bash
terraform plan
```

3. Apply the configuration:
```bash
terraform apply
```

4. To destroy the infrastructure:
```bash
terraform destroy
```

## Structure

- `main.tf` - Main Terraform configuration
- `variables.tf` - Input variables
- `outputs.tf` - Output values
- `providers.tf` - Provider configurations
- `versions.tf` - Required providers and versions
- `userdata/` - EC2 instance initialization scripts

## Monitoring

The project includes CloudWatch metrics for monitoring the load balancer and instances. 