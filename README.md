# Azure Enterprise-Grade Infrastructure with Terraform

[![Terraform](https://img.shields.io/badge/Terraform-1.0+-623CE4.svg?style=flat&logo=terraform)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/Azure-Cloud-0089D6.svg?style=flat&logo=microsoft-azure)](https://azure.microsoft.com/)

## Strategic Objective
This repository demonstrates a **Production-Ready** cloud infrastructure deployment on Microsoft Azure using Terraform. 
As an Azure specialist with 10 years of experience and **AZ-305/AZ-500** certifications, I designed this project to showcase best practices in Infrastructure as Code (IaC), focusing on **Security, Scalability, and Automation.**

## Architectural Excellence (AZ-305 & AZ-500 Principles)
This infrastructure is not just a "lab setup"; it is designed with enterprise-level security and architectural standards:
- **Zero Trust Networking**: Implementing strict Network Security Groups (NSG) to enforce the principle of least privilege.
- **Modular & Scalable**: Decoupled resource definitions for future-proof growth.
- **Resource Governance**: Automated Resource Group management to optimize cloud costs and visibility.

## Tech Stack
- **Cloud Provider**: Microsoft Azure
- **IaC Tool**: Terraform (HCL)
- **Security Framework**: Azure Security Benchmark (aligned with AZ-500)
- **Deployment**: Local execution with Azure CLI authentication

## Infrastructure Components (Step-by-Step Evolution)
Current deployment state:
1. **Management Layer**: Automated Resource Group creation for logical isolation. [Step 1 Completed]
2. **Network Layer**: (In Progress) VNet and Subnet design with strict NSG rules.
3. **Compute Layer**: (Planned) Hardened Linux VM deployment for secure application hosting.

## How to Deploy
1. **Login**: `az login`
2. **Initialize**: `terraform init`
3. **Validate**: `terraform plan`
4. **Deploy**: `terraform apply -auto-approve`


## Why This Project?

### Why Terraform?
Modern cloud environments require **repeatable, consistent, and automated infrastructure deployment**.  
Terraform enables Infrastructure as Code (IaC), reducing human error and ensuring reliable provisioning across environments.

### Why Azure?
Azure provides enterprise-grade cloud services with strong integration in identity, security, and compliance.  
This project leverages Azure to demonstrate real-world architecture aligned with **AZ-305 (Architect)** and **AZ-500 (Security Engineer)** principles.

### What Problem Does This Solve?
Manual infrastructure provisioning is:
- Error-prone
- Time-consuming
- Difficult to scale

This project solves these challenges by:
- Automating infrastructure deployment
- Enforcing security best practices (Zero Trust)
- Providing scalable and reusable architecture

## Architectural Excellence (AZ-305 & AZ-500 Principles)

This infrastructure is not just a "lab setup"; it is designed with enterprise-level security and architectural standards:

- **Zero Trust Networking**  
  Implementing strict Network Security Groups (NSG) to enforce the principle of least privilege.

- **Modular & Scalable**  
  Decoupled resource definitions for future-proof growth.

- **Resource Governance**  
  Automated Resource Group management to optimize cloud costs and visibility.


**Contact**: Currently based in Malaysia, actively seeking Cloud Engineer opportunities in Australia with Visa Sponsorship. 
I bring a proven track record of reducing cloud costs and security risks through automated IaC workflows.
