#!/bin/bash
#**********************************************************
#** 文件名称：sqoop-import.sh
#** 创建者：yangzhanling
#** 创建日期 2016.12.27
#**********************************************************

 V_TABLES="emp depth"
  if [ $1 ]; then
     V_TABLES=$1
  fi

 V_ARR=(${V_TABLES//,/ })
 
 for i in ${arr[@]}  
    do  
     echo "###########################$i is running##############" 
       nohup  /home/hadoop/sh/sqoop-import.sh $i > /home/hadoop/logs/$i.log 2>&1 &
   done  
    
     echo "###############data is finish ###############################" 