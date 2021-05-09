#!/bin/bash
#一键部署脚本v0.3(Use to Docker) Created By Cuichanghe
path=$(pwd);
pathto="/usr/CGcode-server";
echo 开始执行脚本
copy(){
    mkdir /usr/CGcode-server
    echo 正在复制model文件夹
    cp -r ${path}/model ${pathto}
    echo 复制完成
}
copy
echo "开始安装code-server"
rpm -i code-server.rpm
chmod -R +775 /usr/CGcode-server/model/
#复制基础文件和插件
cp -r /usr/CGcode-server/model/. /root
#新建并写入配置文件
cd /root/.config/code-server
#更改权限
chmod -R +775 /root/.local
#创建用户自己的工作目录
cd /root
mkdir WorkPlace
#更改所属用户
chown -R root /root/WorkPlace
#复制说明和测试文件
cp  /usr/CGcode-server/model/ReadMe.md /root/WorkPlace
cp  /usr/CGcode-server/model/Welcome.cpp /root/WorkPlace
#新建并写入初始页面配置文件
mkdir /root/.local/share/code-server
cd /root/.local/share/code-server
echo '{' >coder.json;
echo   '"query": {' >>coder.json;
echo  '"folder": "/root/WorkPlace"},' >>coder.json;
echo    '"update": {' >>coder.json;
echo     '"checked": 1620541315203,' >>coder.json;
echo     '"version": "3.9.3"' >>coder.json;
echo '  },' >>coder.json;
echo  ' "lastVisited": {' >>coder.json;
echo     '"url": "/root/WorkPlace",' >>coder.json;
echo     '"workspace": false' >>coder.json;
echo  ' }' >>coder.json;
echo '}' >>coder.json;

echo 玩的开心！Have Fun!
