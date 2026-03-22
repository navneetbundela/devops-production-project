# Container Registry

## Overview

The platform uses Amazon Elastic Container Registry (ECR) to store Docker container images.

The CI/CD pipeline builds application images and pushes them to the ECR repository.

Kubernetes pulls images from the registry during deployment.

---

# Features

The ECR repository includes the following features:

Image scanning on push  
Lifecycle policy to remove old images  
Secure access through IAM roles

---

# Image Flow

Developer → CI Pipeline → Docker Image → ECR → Kubernetes Deployment