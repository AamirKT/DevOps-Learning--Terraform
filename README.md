# 🌐 WordPress on AWS with Terraform
---

## Project Overview
This project provisions a **WordPress website on AWS EC2 instances** using **Terraform modules**.  
It includes:  
- **VPC**, subnets, and security groups  
- **EC2 instances** with user data for automatic WordPress installation  
- **SSH key pair** for secure access  
- Modular design for **reusability and scalability**  

---

## Features
- Modular Terraform setup (`vpc`, `ec2`)  
- Secure handling of secrets (AWS credentials, DB passwords)  
- HTTPS-ready EC2 instances  
- Easy deployment and teardown  

---

## Prerequisites
- [Terraform](https://www.terraform.io/) ≥ 1.5.0  
- [AWS CLI](https://aws.amazon.com/cli/) with an IAM user having sufficient permissions  
- SSH key pair (`.pem`) for EC2 access  

---

## 📂 Folder Structure

```text
.
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── terraform.tfvars
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── ec2/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── user_data.tftpl
```
---
## Getting Started
---
## 1️⃣ Clone the Repository

```
git clone <repo-url>
cd <repo-folder>

```
---
## 2️⃣ Configure Local Secrets


Create a terraform.tfvars file (not tracked in Git):
```
aws_region = "Your region"
db_password = "Your Secure Password"
```
---
## 3️⃣ Initialise Terraform
```
terraform init
```
---
## 4️⃣ Preview Infrastructure Changes
```
terraform plan
```
---
## 5️⃣ Apply Infrastructure
```
terraform apply
```
---
## 🌐 Accessing WordPress

After deployment, Terraform outputs the public IP of your EC2 instance:
```
http://<public-ip>
```


---
## Cleaning Up
---
To destroy all infrastructure:
```
terraform destroy
```
---
## Key Features

- Modular Terraform design (vpc and ec2 modules)

- Automatic WordPress installation via EC2 user data

- Custom VPC with public/private subnets and security groups

- Secure secrets management (.tfvars, .pem excluded from Git)

- Reproducible infrastructure with Terraform

---

## Lessons Learned

 - Breaking infrastructure into modules improves clarity and reuse

- Always exclude sensitive files from Git (.tfvars, .pem)

- Understanding VPC, subnets, and routing is crucial

- Automating setup with cloud-init/user data saves time

- Reading Terraform errors helps debug AWS resources
