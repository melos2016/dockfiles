#!/bin/bash
 ps -ef | grep tumblrdb | awk '{ print $1 }'|xargs kill -9

# 定义需要备份的目录
#NGINX_CONF_DIR=/usr/local/nginx/conf  # nginx配置目录
TUMBLR_DIR=/root/tumblr  # 扫描数据存放目录
 
# 定义备份存放目录
DROPBOX_DIR=/Tumblr  # Dropbox上的备份目录
LOCAL_BAK_DIR=/root/backup  # 本地备份文件存放目录
 
# 定义备份文件名称
TumblrName=$(date +%Y%m%d).tar.gz
 
# 定义旧数据名称
Old_DROPBOX_DIR=/Tumblr/$(date -d $(date +%Y-%m-%d)-240 +%Y-%m-%d)
OldTumblrName=$(date -d $(date +%Y-%m-%d)-240 +%Y%m%d).tar.gz
 
#压缩扫描数据
cd $TUMBLR_DIR
tar zcf $LOCAL_BAK_DIR/tumblr.tar.gz tumblr.db
 
cd /
#开始上传
bash /dropbox_uploader.sh upload $LOCAL_BAK_DIR/tumblr.tar.gz $DROPBOX_DIR/tumblr.tar.gz
 
#删除旧数据
rm -rf $LOCAL_BAK_DIR/$OldTumblrName
bash /dropbox_uploader.sh delete $DROPBOX_DIR/$OldTumblrName

echo -e "Backup Done!"

cd /root/tumblr

python /root/tumblr/tumblrdb.py