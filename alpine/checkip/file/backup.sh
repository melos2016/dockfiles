#!/bin/bash
 
# 定义需要备份的目录
#NGINX_CONF_DIR=/usr/local/nginx/conf  # nginx配置目录
CHECKIP_DIR=/root/checkip  # 扫描数据存放目录
 
# 定义备份存放目录
DROPBOX_DIR=/Checkip  # Dropbox上的备份目录
LOCAL_BAK_DIR=/root/backup  # 本地备份文件存放目录
 
# 定义备份文件名称
CheckipName=$(date +%Y%m%d).tar.gz
 
# 定义旧数据名称
Old_DROPBOX_DIR=/Checkip/$(date -d $(date +%Y-%m-%d)-240 +%Y-%m-%d)
OldCheckipName=$(date -d $(date +%Y-%m-%d)-240 +%Y%m%d).tar.gz
 
#压缩扫描数据
cd $CHECKIP_DIR
tar zcf $LOCAL_BAK_DIR/$CheckipName ip_*.txt
 
cd /
#开始上传
bash /dropbox_uploader.sh upload $LOCAL_BAK_DIR/$CheckipName $DROPBOX_DIR/$CheckipName
 
#删除旧数据
rm -rf $LOCAL_BAK_DIR/$OldCheckipName
bash /dropbox_uploader.sh delete $Old_DROPBOX_DIR
 
echo -e "Backup Done!"
