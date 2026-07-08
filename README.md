# 🚀 Production Ready Blue-Green Deployment using Jenkins and AWS Application Load Balancer

## 📌 Project Overview

This project demonstrates a Production-Ready Blue-Green Deployment strategy using Jenkins CI/CD Pipeline and AWS Application Load Balancer.

The objective is to achieve Zero Downtime Deployment by deploying the latest application version to the Green environment, validating its health, and switching production traffic from Blue to Green only after successful verification.

---

# Architecture

GitHub Repository
        │
        ▼
Jenkins Pipeline
        │
        ▼
Deploy to Green EC2
        │
        ▼
Health Check
        │
        ▼
AWS Application Load Balancer
        │
        ▼
Switch Traffic
        │
        ▼
Rollback (If Deployment Fails)

---

# AWS Services Used

- Amazon EC2
- Amazon VPC
- Application Load Balancer
- Target Groups
- Security Groups
- IAM
- Jenkins
- GitHub

---

# Technologies

- AWS
- Jenkins
- Linux
- Shell Scripting
- Apache HTTP Server
- Git
- GitHub

---

# Project Structure

```
blue-green-deployment/
│
├── Jenkinsfile
├── README.md
├── scripts
│   ├── deploy.sh
│   ├── rollback.sh
│   ├── switch-traffic.sh
│   └── health-check.sh
│
├── version1
│   └── index.html
│
└── version2
    └── index.html
```

---

# Deployment Workflow

1. Developer pushes code to GitHub

2. Jenkins detects new changes

3. Jenkins deploys application to Green Server

4. Health Check validates deployment

5. ALB switches traffic from Blue to Green

6. If deployment fails Jenkins performs Rollback

---

# Blue Environment

Current Production Environment

- Apache Server
- Version 1
- Stable Environment

---

# Green Environment

Deployment Environment

- Apache Server
- Version 2
- Tested before Production

---

# Rollback Strategy

If Health Check fails,

- Stop deployment
- Restore previous version
- Switch traffic back to Blue

---

# Features

- Zero Downtime Deployment

- Blue-Green Deployment Strategy

- Jenkins CI/CD Pipeline

- Automatic Health Check

- AWS Application Load Balancer

- Rollback Support

- GitHub Integration

---

# Future Improvements

- Docker

- Kubernetes

- Amazon EKS

- Terraform

- Ansible

- SonarQube

- Prometheus

- Grafana

---

# Author

Aashish Santosh Shendkar

AWS DevOps Engineer
