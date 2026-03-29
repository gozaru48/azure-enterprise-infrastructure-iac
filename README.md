# Azure Enterprise-Grade Infrastructure with Terraform 2026

[![Terraform](https://img.shields.io/badge/Terraform-1.0+-623CE4.svg?style=flat&logo=terraform)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/Azure-Cloud-0089D6.svg?style=flat&logo=microsoft-azure)](https://azure.microsoft.com/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-22.04_LTS-E95420.svg?style=flat&logo=ubuntu)](https://ubuntu.com/)

## Strategic Objective
Designed and implemented a **production-ready Azure enterprise infrastructure** using Terraform. This project demonstrates high-availability architecture, Zero Trust security, and the ability to handle real-world cloud deployment challenges, such as regional capacity constraints and SKU optimization.

## Infrastructure Components (Fully Implemented)
The environment is successfully deployed and verified in the **Southeast Asia (Singapore)** region, ensuring robust resource availability and low latency.

1. **Management Layer**: **[Completed]** Automated Resource Group creation (`rg-enterprise-prod`) for logical isolation and lifecycle management.
2. **Network Layer**: **[Completed]** VNet and Subnet design incorporating **Standard SKU Public IP** for enterprise-grade reliability and security features.
3. **Security Layer**: **[Completed]** Strict **Network Security Groups (NSG)** enforcing a Zero Trust model. Inbound traffic is restricted to SSH (Port 22) using **SSH Key-based Authentication**.
4. **Compute Layer**: **[Completed]** Hardened **Ubuntu 22.04 LTS** instance using **Standard_D2s_v3**, optimized for performance and stability in enterprise workloads.

## Architectural Excellence (AZ-305 & AZ-500 Principles)
- **Resilient Infrastructure**: Successfully navigated regional capacity limits by strategically migrating deployment from Australia East to **Southeast Asia**, showcasing adaptive cloud resource management.
- **Zero Trust Networking**: Implemented strict NSGs to enforce the principle of least privilege, ensuring "Security by Design."
- **Enterprise Standards**: Utilized **Standard SKU IPs** and **SSH Key Auth**, aligning with the Azure Security Benchmark and professional compliance standards.
- **Modular & Scalable**: Decoupled resource definitions using Terraform for future-proof growth and maintainability.

## Enterprise Architecture Diagram
![Enterprise Architecture Diagram](./enterprise-architecture-diagram.png)

*(Architecture includes: VNet, Subnet, NSG, Standard Public IP, and D2s_v3 Virtual Machine)*

## Tech Stack
- **Cloud Provider**: Microsoft Azure
- **IaC Tool**: Terraform (HCL)
- **OS**: Ubuntu 22.04 LTS
- **Security Framework**: SSH Key-based (Passwordless)
- **Deployment**: Local execution with Azure CLI / Git-based workflow

## How to Deploy
1. **Initialize**: `.\terraform init`
2. **Validate**: `.\terraform plan`
3. **Deploy**: `.\terraform apply -auto-approve`
4. **Access**: `ssh -i ~/.ssh/id_rsa azureuser@<Public_IP>`

## Why This Project?
In real-world enterprise environments, manual provisioning is inconsistent and prone to configuration drift. This project addresses these challenges by:
- **Automating** deployment to ensure 100% consistency across environments.
- **Enforcing** security best practices from the start, reducing the attack surface.
- **Demonstrating Troubleshooting Skills**: Successfully resolved regional resource constraints and SKU compatibility issues during the deployment phase.


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
