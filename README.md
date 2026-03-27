# aws-cloudwatch-snmp-monitoring
AWS CloudWatch and SNMP-based monitoring project with alerting
# 🚀 AWS CloudWatch + SNMP Monitoring Project

---

## 📌 What is this project?

This project shows how to monitor a Linux server using **SNMP** and send data to **AWS CloudWatch**.
It also creates alerts using **CloudWatch Alarm** and sends notifications via **SNS (Email)**.

👉 Simple words:
Server monitoring + alert system using AWS

---

## 🛠️ Tools Used

* AWS EC2 (Linux Server)
* SNMP (Net-SNMP)
* AWS CloudWatch
* CloudWatch Agent
* AWS SNS (Email Alert)
* Linux Commands

---

## 🏗️ Architecture

<img width="1330" height="2268" alt="image" src="https://github.com/user-attachments/assets/3958ac8b-1aaf-4379-ad64-92022d66651c" />


👉 Flow:
EC2 (SNMP) → CloudWatch Agent → CloudWatch → Alarm → SNS → Email

---

## ⚙️ Step-by-Step Setup (Beginner Friendly)

### ✅ Step 1: Launch EC2

* Go to AWS Console
* Launch EC2 instance (Amazon Linux / CentOS)
* Allow SSH (port 22)

---

### ✅ Step 2: Install SNMP

```bash
sudo yum install net-snmp -y
sudo systemctl start snmpd
sudo systemctl enable snmpd
```

Check status:

```bash
sudo systemctl status snmpd
```

---

### ✅ Step 3: Configure SNMP

Open config file:

```bash
sudo vi /etc/snmp/snmpd.conf
```

Add:

```bash
rocommunity public
```

Restart SNMP:

```bash
sudo systemctl restart snmpd
```

---

### ✅ Step 4: Install CloudWatch Agent

```bash
sudo yum install amazon-cloudwatch-agent -y
```

---

### ✅ Step 5: Configure CloudWatch Agent

Run wizard:

```bash
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard
```

Start agent:

```bash
sudo systemctl start amazon-cloudwatch-agent
```

---

### ✅ Step 6: Create CloudWatch Dashboard

* Go to AWS → CloudWatch
* Click Dashboards → Create Dashboard
* Add metrics (CPU, Memory)

---

### ✅ Step 7: Create Alarm

* Go to CloudWatch → Alarms
* Create Alarm
* Example:

  * CPU > 70%
* Select SNS for notification

---

### ✅ Step 8: Setup SNS (Email Alert)

* Go to SNS
* Create Topic
* Subscribe Email
* Confirm email

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

## ⭐ Future Improvements

* Add Prometheus & Grafana
* Use Terraform for automation
* Integrate with Kubernetes (EKS)
