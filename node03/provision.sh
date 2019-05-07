
yum install -y wget

# Setting SELinux mode
sed -i 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config
setenforce 0

# Disabling the Firewall
iptables-save > ~/firewall.rules
systemctl disable firewalld
systemctl stop firewalld

# Enable an NTP Service
yum install -y ntp
echo -e "server 0.pool.ntp.org\nserver 1.pool.ntp.org\nserver 2.pool.ntp.org\n" > /etc/ntp.conf
systemctl start ntpd
systemctl enable ntpd
hwclock --systohc

# Configure Network Names
hostnamectl set-hostname node03.example.com
echo -e "192.168.33.10  cm.example.com\n192.168.33.11  node01.example.com\n192.168.33.12  node02.example.com\n192.168.33.13  node03.example.com\n" | tee -a /etc/hosts
mkdir -p /etc/sysconfig
echo -e "HOSTNAME=node03.example.com\n" > /etc/sysconfig/network

# Step 1: Configure a Repository for Cloudera Manager
wget https://archive.cloudera.com/cm6/6.2.0/redhat7/yum/cloudera-manager.repo -P /etc/yum.repos.d/
rpm --import https://archive.cloudera.com/cm6/6.2.0/redhat7/yum/RPM-GPG-KEY-cloudera

# Step 2: Install Java Development Kit
yum install -y oracle-j2sdk1.8
