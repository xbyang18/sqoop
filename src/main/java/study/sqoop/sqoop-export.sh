#!/bin/bash

 source /home/hadoop/study/sqoop/jdbc.properties
 
   V_TABLE=$1
    

   V_MYSQL=${mysql_driver}
   V_URL=${ur}
   V_USERNAME=${mysql_username}
   V_PASSWORD=${mysql_password} 
   V_DATA_URL=/user/hive/warehouse/minitor.db/emp_dept
 ######delete from mysql yesterday
  
   echo "$1--$2---mysql iiiii---mysql -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWORD} ${DBNAME} -e ${delete_sql} " 
 if [ $2 ]; then
   
   delete_sql="delete from ${TABLENAME} where createtime='$2'"
   echo "${delete_sql}======================="
   
   mysql -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${delete_sql}" 
   echo "mysql -h${HOSTNAME} -P${PORT} -u${USERNAME} -p${PASSWORD} ${DBNAME} -e ${delete_sql}" 
 fi
 
  sqoop export \
   --connect ${V_MYSQL} \
   --username ${V_USERNAME} --password ${V_PASSWORD} \
   --table ${V_TABLE}  -m 1 \
   --export-dir ${V_DATA_URL} \
   --input-fields-terminated-by '\t' \
   --input-null-non-string '\\N' \
   --input-null-string '\\N'                            

