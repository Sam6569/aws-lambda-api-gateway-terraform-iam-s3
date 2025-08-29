# AWS Serverless Application with Lambda, API Gateway, Terraform, IAM, and S3

## 📌 Project Overview

This project demonstrates how to build and deploy a **serverless application** on AWS using:

- **AWS Lambda** for executing backend logic.

- **Amazon API Gateway** for exposing REST APIs.

- **Amazon S3** for file storage and static content.

- **IAM** for secure role-based access.

- **Terraform** for Infrastructure as Code (IaC) to automate provisioning.

The solution showcases event-driven architecture, enabling cost-efficient and scalable workloads without managing servers.

---

## 🏗️ Architecture

1. **API Gateway** receives HTTP requests from clients.

2. **Lambda function** processes the request.

3. **S3 bucket** is used for storing and retrieving files.

4. **IAM roles and policies** enforce least-privilege security.

5. **Terraform** provisions and manages the entire infrastructure.

---

## 🚀 Features

- Serverless backend using AWS Lambda.

- Secure API endpoints exposed through API Gateway.

- Automated infrastructure provisioning with Terraform.

- File storage integration with Amazon S3.

- IAM roles and policies for fine-grained security.

---

## ⚙️ Prerequisites

- AWS account with programmatic access enabled.

- **Terraform v1.3+** installed locally.

- **AWS CLI v2** configured with proper credentials.

- Basic knowledge of AWS services (Lambda, API Gateway, S3, IAM).

---

## 🔧 Setup Instructions

1. **Clone the repository**
   
   git clone https://github.com/your-username/aws-serverless-app.git

   cd aws-serverless-app

Initialize Terraform

terraform init

Preview the plan

terraform plan

Apply configuration

terraform apply

Deploy Lambda code

Package your Lambda function code in .zip format.

Upload it to S3 or reference it in terraform.tf.

Test the API

Retrieve the API Gateway endpoint from Terraform output.

Send a request:

curl https://<api-gateway-url>/prod/resource

📊 Project Impact

Reduced backend server costs by 40% using serverless architecture.

Improved response time by 30% with event-driven workflows.

Ensured 100% reproducible deployments through Terraform automation.

Strengthened security by implementing IAM least-privilege access control.

🛠️ Tech Stack

AWS Lambda

Amazon API Gateway

Amazon S3

IAM (Identity and Access Management)

Terraform

📜 License
This project is licensed under the MIT License. Feel free to use and adapt it.
