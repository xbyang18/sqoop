#!/bin/bash
#**********************************************************
#** 文件名称：sqoop-import.sh
#  * 创建者：yangzhanling
#** 创建日期 2016.12.27
#**********************************************************

  str="emp,dept"  
  arr=(${str//,/ }) 
 

 DT=`date --date='1 days ago' +%Y-%m-%d`

  if [ $1 ]; then
     DT=$1
  fi

 echo "${arr}"
 path=/home/hadoop/study/sqoop
 for i in ${arr[@]}
    do
     echo "###########################$i is running##############" 
      # nohup  /home/hadoop/sh/sqoop-import.sh $i ${DT} > /home/hadoop/logs/$i.log 2>&1 &
        ${path}/sqoop-import.sh $i ${DT} 
   done

     echo "###############data is finish ###############################" 
