# Terraform Infrastructure Design

## Introduction

Infrastructure for the platform will be provisioned using Terraform.

Terraform allows infrastructure to be defined as code, enabling automation, version control, and repeatable deployments.

---

# Infrastructure Components

The platform infrastructure includes:

- Virtual Private Cloud (VPC)
- Public and private subnets
- Internet Gateway
- NAT Gateway
- Amazon EKS cluster
- Container registry
- IAM roles

---

# Terraform Repository Structure

Terraform code is organized using modules and environment configurations.
