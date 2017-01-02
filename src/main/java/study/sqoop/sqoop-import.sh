#!/bin/bash
#**********************************************************
#** 文件名称：sqoop-import.sh
#** 创建者：yangzhanling
#** 创建日期 2016.12.27
#**********************************************************

 source /home/hadoop/study/sqoop/jdbc.properties
 
 V_TABLE=$1
 V_DATE=$2
 # V_DATA_URL=$2

   V_MYSQL=${mysql_driver}
   V_URL=${ur}
   V_USERNAME=${mysql_username}
   V_PASSWORD=${mysql_password} 
 
  sqoop import \
   --connect ${V_MYSQL} \
   --username ${V_USERNAME} --password ${V_PASSWORD} \
   --table ${V_TABLE}  -m 1 \
   --input-fields-terminated-by '\t' \
