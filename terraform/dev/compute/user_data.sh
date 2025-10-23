#!/bin/bash -xe

#### load SSM parameters ####
DBPassword=$(aws ssm get-parameters --region "${REGION}" --names "/${ENV}/${NAME_PREFIX}/DBPassword" --with-decryption --query Parameters[0].Value)
DBPassword=$(echo $DBPassword | sed -e 's/^"//' -e 's/"$//')

DBRootPassword=$(aws ssm get-parameters --region "${REGION}" --names "/${ENV}/${NAME_PREFIX}/DBRootPassword" --with-decryption --query Parameters[0].Value)
DBRootPassword=$(echo $DBRootPassword | sed -e 's/^"//' -e 's/"$//')

DBUser=$(aws ssm get-parameters --region "${REGION}" --names "/${ENV}/${NAME_PREFIX}/DBUser" --query Parameters[0].Value)
DBUser=$(echo $DBUser | sed -e 's/^"//' -e 's/"$//')

DBName=$(aws ssm get-parameters --region "${REGION}" --names "/${ENV}/${NAME_PREFIX}/DBName" --query Parameters[0].Value)
DBName=$(echo $DBName | sed -e 's/^"//' -e 's/"$//')

DBEndpoint=$(aws ssm get-parameters --region "${REGION}" --names "/${ENV}/${NAME_PREFIX}/DBEndpoint" --query Parameters[0].Value)
DBEndpoint=$(echo $DBEndpoint | sed -e 's/^"//' -e 's/"$//')

EFSFSID=$(aws ssm get-parameters --region "${REGION}" --names "/${ENV}/${NAME_PREFIX}/EFSFSID" --query Parameters[0].Value)
EFSFSID=$(echo $EFSFSID | sed -e 's/^"//' -e 's/"$//')

#### install Apache, PHP, and Wordpress ####
dnf -y update
dnf install -y wget php-mysqlnd httpd php-fpm php-mysqli mariadb105-server php-json php php-devel stress amazon-efs-utils

systemctl enable httpd
systemctl start httpd

#### mount EFS for shared wp-content ####
mkdir -p /var/www/html/wp-content
chown -R ec2-user:apache /var/www/
echo -e "$EFSFSID:/ /var/www/html/wp-content efs _netdev,tls,iam 0 0" >> /etc/fstab
mount -a -t efs defaults

#### install Wordpress ####
wget http://wordpress.org/latest.tar.gz -P /var/www/html
cd /var/www/html
tar -zxvf latest.tar.gz
cp -rvf wordpress/* .
rm -R wordpress
rm latest.tar.gz

#### configure Wordpress ####
sudo cp ./wp-config-sample.php ./wp-config.php
sed -i "s/'database_name_here'/'$DBName'/g" wp-config.php
sed -i "s/'username_here'/'$DBUser'/g" wp-config.php
sed -i "s/'password_here'/'$DBPassword'/g" wp-config.php
sed -i "s/'localhost'/'$DBEndpoint'/g" wp-config.php

#### set permissions for the files ####
usermod -a -G apache ec2-user
chown -R ec2-user:apache /var/www
chmod 2775 /var/www
find /var/www -type d -exec chmod 2775 {} \;
find /var/www -type f -exec chmod 0664 {} \;
