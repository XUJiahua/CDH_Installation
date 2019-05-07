## CDH 6.2 Installation 

https://www.cloudera.com/documentation/enterprise/6/6.2/topics/installation.html


| Node  |  OS | Core  | Memory  | Comment  |
|---|---|---|---|---|
| Cloudera Manager Server  |  CentOS |  4C | 10G  |   |
|  Node01 |  CentOS |  2C | 6G  |   |
|  Node02 |  CentOS |  2C | 6G  |   |
|  Node03 |  CentOS |  2C | 6G  |   |

### 自动化配置4node

自动化配置如下：

1. Setting SELinux mode
2. Disabling the Firewall
3. Enable an NTP Service
4. Configure Network Names
5. Step 1: Configure a Repository for Cloudera Manager
6. Step 2: Install Java Development Kit

```
cd cm && vagrant up
cd node01 && vagrant up
cd node02 && vagrant up
cd node03 && vagrant up
```

### 配置cm

登录

```
cd cm && vagrant ssh
```

安装cloudera manager server

```
sudo yum install cloudera-manager-daemons cloudera-manager-agent cloudera-manager-server
```

安装mysql https://www.cloudera.com/documentation/enterprise/6/6.2/topics/cm_ig_mysql.html

```
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
sudo yum update
sudo yum install mysql-server
sudo systemctl start mysqld
```

Step 5: Set up the Cloudera Manager Database

```
sudo /opt/cloudera/cm/schema/scm_prepare_database.sh mysql scm scm
```


### deps

1. vagrant (centos)
