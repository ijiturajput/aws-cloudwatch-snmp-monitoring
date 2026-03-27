#!/bin/bash

echo "==============================="
echo "Starting Monitoring Setup"
echo "==============================="

# Update system
echo "Updating system..."
sudo yum update -y

# Install SNMP
echo "Installing SNMP..."
sudo yum install net-snmp -y

# Start and enable SNMP
echo "Starting SNMP service..."
sudo systemctl start snmpd
sudo systemctl enable snmpd

# Configure SNMP
echo "Configuring SNMP..."
sudo bash -c 'echo "rocommunity public" >> /etc/snmp/snmpd.conf'

# Restart SNMP
sudo systemctl restart snmpd

# Install CloudWatch Agent
echo "Installing CloudWatch Agent..."
sudo yum install amazon-cloudwatch-agent -y

# Enable CloudWatch Agent
sudo systemctl enable amazon-cloudwatch-agent

echo "==============================="
echo "SNMP + CloudWatch Agent Installed"
echo "==============================="

echo "👉 NEXT STEP:"
echo "Run CloudWatch config wizard manually:"
echo "sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard"
