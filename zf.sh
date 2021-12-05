#!/bin/bash
wget https://openresty.org/package/centos/openresty.repo
mv openresty.repo /etc/yum.repos.d/
yum check-update
yum install -y openresty
yum install -y openresty-resty
rm -rf /usr/local/openresty/nginx/conf/nginx.conf
systemctl enable openresty
mv /root/unlock/white-ipv4.conf /usr/local/openresty/nginx/conf/white-ipv4.conf
mv /root/unlock/zfnginx.conf /usr/local/openresty/nginx/conf/nginx.conf
echo "* * * * * /root/unlock/ipwhite" >> /var/spool/cron/root
systemctl restart openresty
systemctl status openresty