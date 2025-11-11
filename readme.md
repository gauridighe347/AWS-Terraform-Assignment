# AWS Infrastructure Automation Using Terraform

## Project Overview
This project automates the deployment of a **scalable cloud infrastructure on AWS** using **Terraform**  
The setup provisions a **VPC**, **public and private subnets**, an **Application Load Balancer (ALB)**, an **EC2 instance** running **Nginx**, and the necessary **Security Groups** and **Networking Components**.

---

## 🚀 Infrastructure Components

### 1️⃣ Virtual Private Cloud (VPC)
- Custom VPC with CIDR block `20.0.0.0/16`
- Includes **public** and **private** subnets
- Configured Internet Gateway for external access

![Website Screenshot](assets/Screenshot%202025-11-09%20221835.png)

### 2️⃣ Subnets
- **Public Subnet 1:** `20.0.4.0/24` in `ap-south-1a`  
- **Public Subnet 2:** `20.0.5.0/24` in `ap-south-1b`  
- **Private Subnet:** `20.0.3.0/24`

![Website Screenshot](assets/Screenshot%202025-11-09%20221853.png)

### 3️⃣ Route Tables
- Public Route Table associated with both public subnets
- Routes `0.0.0.0/0` through the Internet Gateway

![Website Screenshot](assets/Screenshot%202025-11-09%20221902.png)

### 4️⃣ Application Load Balancer (ALB)
- Public-facing ALB with security group allowing HTTP (port 80)
- Distributes traffic across EC2 instances in multiple subnets

![Website Screenshot](assets/Screenshot%202025-11-09%20222026.png)

### 5️⃣ Target Group & Listener
- Target Group: Routes incoming traffic on port 80
- Listener: Forwards HTTP requests to the target group

![Website Screenshot](assets/Screenshot%202025-11-09%20222044.png)

### 6️⃣ EC2 Instance
- Ubuntu-based EC2 instance (`t3.micro`)
- Nginx installed via **user_data**
- Serves a custom welcome page:  
  <h1>Hello from EC2 via Terraform!</h1>
- Associated with EC2 Security Group allowing HTTP from ALB and SSH from anywhere

![Website Screenshot](assets/Screenshot%202025-11-09%20222118.png)

### 7️⃣ Security Groups
- **ALB SG:** Allows HTTP (port 80) inbound from anywhere  
- **EC2 SG:** Allows HTTP from ALB SG and SSH (22) from anywhere  

![Website Screenshot](assets/Screenshot%202025-11-09%20222140.png)


---

## Deployment Steps

### Step 1: Clone the Repository
```bash
git clone https://github.com/Maheshbharambe45/Infrastructure-Automation-VPC.git
cd Infrastructure-Automation-VPC
```

### Step 2: Initialize Terraform
```bash
terraform init
```

### Step 3: Validate Configuration
```bash
terraform validate
```

### Step 4: Plan Infrastructure
```bash
terraform plan
```

### Step 5: Apply Configuration
```bash
terraform apply -auto-approve
```

### Step 6: Get Outputs
After apply, Terraform will display:
- **ALB DNS Name:** Access the Nginx page through ALB  
- **EC2 Public IP:** Direct access to the instance  

---

## Access the Application
Once deployed, open the ALB DNS URL in a browser:
```
http://<alb_dns_name>
```
You should see:
![Website Screenshot](assets/Screenshot%202025-11-09%20222154.png)

---

## 🧹 Destroy Resources
To delete all created AWS resources:
```bash
terraform destroy -auto-approve
```

## 👨‍💻 Author
**Mahesh Bharambe**  
