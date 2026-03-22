# Kubernetes Cluster

## Overview

The platform uses Amazon Elastic Kubernetes Service (EKS) to run containerized workloads.

EKS provides a managed Kubernetes control plane while worker nodes run inside the VPC.

---

# Cluster Components

The cluster includes:

EKS control plane  
Worker node group  
IAM roles  
Networking integration with VPC

---

# Node Groups

Worker nodes are EC2 instances responsible for running application pods.

The cluster uses autoscaling node groups to dynamically adjust capacity.

---

# Workloads

The cluster will host:

Application services  
PostgreSQL database  
Monitoring stack  
Logging stack  
GitOps controller