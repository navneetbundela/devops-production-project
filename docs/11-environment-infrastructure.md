# Terraform Environment Configuration

## Introduction

Terraform environments allow infrastructure to be deployed separately for development, staging, and production systems.

Each environment contains its own configuration values and invokes reusable infrastructure modules.

---

# Development Environment

The development environment provisions infrastructure used for testing and development.

Infrastructure components include:

- VPC
- Public subnets
- Private subnets
- Internet gateway
- NAT gateway

---

# Module Usage

The development environment uses the reusable VPC module.

Example configuration:

```hcl
module "vpc" {
  source = "../../modules/vpc"

  region = var.region

  vpc_cidr = var.vpc_cidr

  public_subnets = var.public_subnets

  private_subnets = var.private_subnets
}

---

# What You Have Built So Far

Your Terraform structure now looks like this:

```text
terraform
│
├── modules
│   └── vpc
│
└── environments
    ├── dev
    │   ├── main.tf
    │   ├── variables.tf
    │   ├── terraform.tfvars
    │   └── providers.tf
    │
    ├── stage
    └── prod