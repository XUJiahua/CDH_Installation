# Disabling the Firewall
service ufw stop

# Enable an NTP Service
apt-get install -y ntp ntpdate
echo -e "server 0.pool.ntp.org\nserver 1.pool.ntp.org\nserver 2.pool.ntp.org\n" > /etc/ntp.conf
systemctl start ntp
systemctl enable ntp
hwclock --systohc

# Configure Network Names
hostnamectl set-hostname cm.example.com
echo -e "192.168.33.10  cm.example.com\n192.168.33.11  node01.example.com\n192.168.33.12  node02.example.com\n192.168.33.13  node03.example.com\n" | tee -a /etc/hosts
mkdir -p /etc/sysconfig
echo -e "HOSTNAME=cm.example.com\n" > /etc/sysconfig/network

# Step 1: Configure a Repository for Cloudera Manager
cd /etc/apt/sources.list.d/ && wget https://archive.cloudera.com/cm6/6.2.0/ubuntu1604/apt/cloudera-manager.list
wget https://archive.cloudera.com/cm6/6.2.0/ubuntu1604/apt/archive.key
apt-key add archive.key
apt-get update

# Step 2: Install Java Development Kit
apt-get install -y oracle-j2sdk1.8

# Step 3: Install Cloudera Manager Server
apt-get install cloudera-manager-daemons cloudera-manager-agent cloudera-manager-server

# Step 4: Install and Configure Databases
# apt-get install mysql-server
# service mysql stop