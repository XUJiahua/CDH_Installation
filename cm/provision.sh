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