![AWS](https://img.shields.io/badge/AWS-Cloud-orange)
![Monitoring](https://img.shields.io/badge/Monitoring-SNMP-blue)
![Status](https://img.shields.io/badge/Project-Completed-brightgreen)
 
 📌 Project Overview

This project demonstrates how to monitor a Linux server using SNMP and send metrics to AWS CloudWatch.
It also sets up CloudWatch Alarms and sends notifications using SNS (Email Alerts).

👉 In simple words:
Server monitoring + alert system using AWS

🛠️ Tools & Technologies Used
AWS EC2 (Linux Server)
SNMP (Net-SNMP)
AWS CloudWatch
CloudWatch Agent
AWS SNS (Simple Notification Service)
Bash Scripting
Amazon Linux 2

---

🖥️ Infrastructure Details
✅ EC2 Instances Used
Total EC2 Instances: 1
Instance Type: t2.micro (Free Tier)

👉 A single EC2 instance is used where:

SNMP Agent is installed
CloudWatch Agent is installed
Metrics are collected and sent to CloudWatch
✅ Operating System
OS Used: Amazon Linux 2
🤔 Why Amazon Linux?
Optimized for AWS
Easy CloudWatch integration
Lightweight and stable
Simple package management (yum)

## 🏗️ Architecture

<img width="1330" height="2268" alt="image" src="https://github.com/user-attachments/assets/3958ac8b-1aaf-4379-ad64-92022d66651c" />


👉 Flow:
EC2 (SNMP) → CloudWatch Agent → CloudWatch → Alarm → SNS → Email

---

## ⚙️ Step-by-Step Setup 

⚙️ Automated Setup (Using Script)

This project uses a shell script to automate installation of SNMP and CloudWatch Agent.

▶️ Run the script:

chmod +x install_monitoring.sh

./install_monitoring.sh


⚡ What this script does:

Installs SNMP (net-snmp)
Starts and enables the SNMP service
Configures the SNMP community string
Installs CloudWatch Agent

⚠️ Next Step (Manual)
After running the script, configure CloudWatch Agent:


sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard


⚙️ Manual Setup (Step-by-Step)

1️⃣ Launch EC2
Go to AWS Console
Launch EC2 instance
Select Amazon Linux 2
Choose t2.micro
Allow SSH (port 22),161 port for SNMP

2️⃣ Install SNMP (if not using script)

sudo yum install net-snmp -y

sudo systemctl start snmpd

sudo systemctl enable snmpd

3️⃣ Configure SNMP

sudo vi /etc/snmp/snmpd.conf


Add:
rocommunity public

Restart:

sudo systemctl restart snmpd


4️⃣ Install CloudWatch Agent

sudo yum install amazon-cloudwatch-agent -y

5️⃣ Configure CloudWatch Agent

sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard


Start:


sudo systemctl start amazon-cloudwatch-agent

📊 CloudWatch Dashboard

Go to AWS → CloudWatch

Create Dashboard
Add CPU, Memory metrics

🚨 CloudWatch Alarm

Create alarm (Example: CPU > 70%)

Attach SNS topic for alert

📧 SNS Email Alert Setup

AWS SNS is used to send alert notifications via email.

Steps:

Go to AWS SNS

Click "Create Topic"

Enter topic name (e.g., monitoring-alerts)

Click "Create Subscription"

Select protocol: Email

Enter your email ID

Confirm subscription from your email

👉 Connect this SNS topic with CloudWatch Alarm

Result:

When the CPU crosses the threshold, you receive an email alert 🚀

---

## 📸 Screenshots
SNS Notification on Email ID for CPU Utilisation
<img width="1525" height="326" alt="image" src="https://github.com/user-attachments/assets/78acf540-cbd2-4a42-b8a2-35bcc2147b7f" />

---

## 🚀 What Learned

* How monitoring works in real systems
* How to use AWS CloudWatch
* How alerts are generated
* Basic SNMP setup in Linux
* SNS Setup

---

## 💡 Use Case

* Server monitoring
* DevOps monitoring setup
* Real-time alert system

---

## 👨‍💻 Author

Jitu Rajput

---

#⭐ Future Improvements
Add Prometheus & Grafana
Automate using Terraform
Multi-server monitoring
