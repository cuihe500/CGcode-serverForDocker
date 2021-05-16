#!/bin/bash
#一键增加容器脚本(v0.1) Created By Cuichanghe
USER_PROT=$1
CS_PASSWORD=$2
cd /root/.config/code-server/
echo bind-addr: 0.0.0.0:${USER_PROT} >config.yaml;
if [ -z "$CS_PASSWORD" ]; then
echo 检测到无code-server登录密码
echo auth: none >> config.yaml;
echo password: >> config.yaml;
else
echo 检测到有code-server登录密码
echo auth: password >> config.yaml;
echo "password: "${CS_PASSWORD} >> config.yaml;
fi
echo cert: false >> config.yaml;

echo 'export http_proxy=http://10.10.10.253:3128'>>/etc/profile
echo 'export https_proxy=http://10.10.10.253:3128'>>/etc/profile
echo 'export no_proxy=127.0.0.1,localhost'>>/etc/profile
source /etc/profile
code-server
