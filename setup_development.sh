#!/usr/bin/env bash

# 如何使用
# sudo su
# bash -x setup_development.sh


# 默认 root
echo "sudo su" >> /home/ubuntu/.bashrc

# ${source_root} 是代码所在目录
source_root='/root/chat'

echo "cd ${source_root}" >> /root/.bashrc

# 装依赖
apt-get update
apt-get install -y python3-pip

pip3 install -U pip setuptools wheel
pip3 install flask eventlet flask-socketio

# 建立一个软连接
ln -s -f ${source_root}/chat.conf /etc/systemd/system/chat.service

systemctl start chat.service

echo "setup development environment success"