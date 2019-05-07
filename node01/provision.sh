# Disabling the Firewall
service ufw stop

# Enable an NTP Service
apt-get install -y ntp
echo -e "server 0.pool.ntp.org\nserver 1.pool.ntp.org\nserver 2.pool.ntp.org\n" > /etc/ntp.conf
### TODO: failed
systemctl start ntpd
systemctl enable ntpd

# Configure Network Names
hostnamectl set-hostname node01.example.com
echo -e "192.168.33.10  cm.example.com  cm\n192.168.33.11  node01.example.com  node01\n192.168.33.12  node02.example.com  node02\n192.168.33.13  node03.example.com  node03\n" | tee -a /etc/hosts
mkdir -p /etc/sysconfig
echo -e "HOSTNAME=node01.example.com\nGAREWAYDEV=eth1\n" > /etc/sysconfig/network