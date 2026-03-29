# Azure Enterprise-Grade Infrastructure with Terraform

[![Terraform](https://img.shields.io/badge/Terraform-1.0+-623CE4.svg?style=flat&logo=terraform)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/Azure-Cloud-0089D6.svg?style=flat&logo=microsoft-azure)](https://azure.microsoft.com/)

## Strategic Objective
This repository demonstrates a **Production-Ready** cloud infrastructure deployment on Microsoft Azure using Terraform. 
As an Azure specialist with 10 years of experience and **AZ-305/AZ-500** principles, I designed this project to showcase best practices in Infrastructure as Code (IaC), focusing on **Security, Scalability, and Automation.**

## Infrastructure Components (Step-by-Step Evolution)
Current deployment state:
1. **Management Layer**: **[Completed]** Automated Resource Group creation for logical isolation.
2. **Network Layer**: **[Completed]** VNet and Subnet design with strict NSG rules to enforce Zero Trust.
3. **Compute Layer**: (Planned) Hardened Linux VM deployment for secure application hosting.

## Architectural Excellence (AZ-305 & AZ-500 Principles)
- **Zero Trust Networking**: Implementing strict Network Security Groups (NSG) to enforce the principle of least privilege (Port 22 restricted).
- **Modular & Scalable**: Decoupled resource definitions using Terraform for future-proof growth.
- **Resource Governance**: Automated resource management in Australia East region to optimize compliance and visibility.
- **Network Security Group (NSG)**: Controls inbound/outbound traffic to enforce Zero Trust security model.

## Enterprise Architecture Diagram
![Enterprise Architecture Diagram](./enterprise-architecture-diagram.png)

## Tech Stack
- **Cloud Provider**: Microsoft Azure
- **IaC Tool**: Terraform (HCL)
- **Security Framework**: Azure Security Benchmark
- **Deployment**: Local execution with Azure CLI / Git-based workflow

## How to Deploy
1. **Login**: `az login`
2. **Initialize**: `terraform init`
3. **Validate**: `terraform plan`
4. **Deploy**: `terraform apply -auto-approve`


## Why This Project?
In real-world enterprise environments, infrastructure provisioning is often inconsistent, manually managed, and prone to configuration drift. This leads to security risks, operational inefficiencies, and scalability limitations.
Based on my experience in cloud operations and support, I designed this project to address these challenges by implementing Infrastructure as Code (IaC) using Terraform on Azure.

This project focuses on:
- Standardizing infrastructure deployment using reusable and modular Terraform code  
- Enforcing security best practices using Network Security Groups (NSG) aligned with Zero Trust principles  
- Improving scalability and maintainability through automated and version-controlled deployments  

The goal is to demonstrate how enterprise-grade cloud environments can be built in a secure, consistent, and scalable way using modern DevOps practices.

This approach reflects my experience in enterprise IT environments, where reliability, security, and operational efficiency are critical.

### What Problem Does This Solve?
Manual infrastructure provisioning is error-prone, time-consuming, and difficult to scale. 
This project solves these challenges by:
- **Automating** deployment to ensure consistency across environments.
- **Enforcing** security best practices from the start (Security by Design).
- **Providing** a clear, reusable blueprint for enterprise-level cloud adoption.

---
**Contact**: Currently based in Malaysia, actively seeking Cloud Engineer opportunities in Australia with Visa Sponsorship. 
I bring a proven track record of reducing cloud costs and security risks through automated IaC workflows.
