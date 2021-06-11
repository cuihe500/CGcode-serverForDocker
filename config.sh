#!/bin/bash
#一键增加容器脚本(v0.1) Created By Cuichanghe
USER_PROT=$1
CS_PASSWORD=$2
PATH=$(pwd);
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

export http_proxy=http://115.158.28.160:3128
export https_proxy=http://115.158.28.160:3128
export no_proxy=127.0.0.1,localhost

code-server --install-extension ${PATH}/exteninstall/cpptools-linux.vsix
code-server --install-extension ${PATH}/exteninstall/georgewfraser.vscode-javac-0.2.39.vsix
code-server --install-extension ${PATH}/exteninstall/MS-CEINTL.vscode-language-pack-zh-hans-1.57.1.vsix
code-server --install-extension ${PATH}/exteninstall/ms-python.python-2021.5.926500501.vsix
code-server --install-extension ${PATH}/exteninstall/ms-toolsai.jupyter-2021.6.999230701.vsix
code-server --install-extension ${PATH}/exteninstall/redhat.java-0.79.2.vsix
code-server --install-extension ${PATH}/exteninstall/vscjava.vscode-java-debug-0.34.0.vsix
code-server --install-extension ${PATH}/exteninstall/vscjava.vscode-java-test-0.30.0.vsix
code-server --install-extension ${PATH}/exteninstall/vscjava.vscode-maven-0.31.0.vsix
code-server
