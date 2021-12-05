#!/bin/bash
echo "*       soft    nofile  2100000" >> /etc/security/limits.conf
echo "*       hard    nofile  2100000" >> /etc/security/limits.conf
echo "*       soft    nproc  2100000" >> /etc/security/limits.conf
echo "*       hard    nproc  2100000" >> /etc/security/limits.conf

echo "DefaultLimitNOFILE=20000000" >> /etc/systemd/system.conf

echo "fs.file-max = 20000000" >> /etc/sysctl.conf
echo "fs.nr_open = 20000000" >> /etc/sysctl.conf
echo "net.ipv4.ip_local_port_range = 1024 655" >> /etc/sysctl.conf
echo "net.core.somaxconn = 2048" >> /etc/sysctl.conf
echo "net.core.rmem_default = 262144" >> /etc/sysctl.conf
echo "net.core.wmem_default = 262144" >> /etc/sysctl.conf
echo "net.core.rmem_max = 16777216" >> /etc/sysctl.conf
echo "net.core.wmem_max = 16777216" >> /etc/sysctl.conf
echo "net.ipv4.tcp_rmem = 4096 4096 16777216" >> /etc/sysctl.conf
echo "net.ipv4.tcp_wmem = 4096 4096 16777216" >> /etc/sysctl.conf
echo "net.ipv4.tcp_mem = 786432 2097152 3145728" >> /etc/sysctl.conf
echo "net.ipv4.tcp_max_syn_backlog = 16384" >> /etc/sysctl.conf
echo "net.core.netdev_max_backlog = 20000" >> /etc/sysctl.conf
echo "net.ipv4.tcp_fin_timeout = 15" >> /etc/sysctl.conf
echo "net.ipv4.tcp_max_syn_backlog = 16384" >> /etc/sysctl.conf
echo "net.ipv4.tcp_tw_reuse = 1" >> /etc/sysctl.conf
echo "net.ipv4.tcp_max_orphans = 131072" >> /etc/sysctl.conf

sysctl -p