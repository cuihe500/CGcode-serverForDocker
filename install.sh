#!/bin/bash
#一键部署脚本v0.3(Use to Docker) Created By Cuichanghe
path=$(pwd);
pathto="/usr/CGcode-server";
echo 三秒后将会自动部署CGCode-server... 按下Ctrl+C终止执行
echo ----------------------3----------------------
sleep 1
echo ----------------------2----------------------
sleep 1
echo ----------------------1----------------------
sleep 1
echo 开始执行脚本
copy(){
    echo 正在clone code-server本体
    git clone "https://github.com.cnpmjs.org/cdr/code-server.git"
    mkdir /usr/CGcode-server
    echo 正在复制model文件夹
    cp -r ${path}/model ${pathto}
    echo 复制完成
}
copy
echo "开始安装code-server"
rpm -hvi code-server.rpm
chmod -R +775 /usr/CGcode-server/model/
#复制基础文件和插件
cp -r /usr/CGcode-server/model/. /root
#新建并写入配置文件
cd /root/.config/code-server
#更改权限
chmod -R +775 /root/.local
#创建用户自己的工作目录
cd /root
mkdir WorkPlaceFor${USER_NAME}
#更改所属用户
chown -R root /root/WorkPlaceFor${USER_NAME}
#复制说明和测试文件
cp  /usr/CGcode-server/model/ReadMe.md /root/WorkPlaceFor${USER_NAME}
cp  /usr/CGcode-server/model/Welcome.cpp /root/WorkPlaceFor${USER_NAME}
#新建并写入初始页面配置文件
cd /root/.local/share/code-server
echo '{' >coder.json;
echo   '"query": {},' >>coder.json;
echo    '"update": {' >>coder.json;
echo     '"checked": ,' >>coder.json;
echo     '"version": ""' >>coder.json;
echo '  },' >>coder.json;
echo  ' "lastVisited": {' >>coder.json;
echo     '"url": "/root/WorkPlaceFor'${USER_NAME}'",' >>coder.json;
echo     '"workspace": false' >>coder.json;
echo  ' }' >>coder.json;
echo '}' >>coder.json;
#开启权限
chown -R ${USER_NAME} /root/.local
echo 玩的开心！Have Fun!
