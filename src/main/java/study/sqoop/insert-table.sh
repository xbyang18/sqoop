#!/bin/bash
 
 DT=`date --date='1 days ago' +%Y-%m-%d`

 echo "${DT}-----------------------"
   
 hive -e "
   create table if not exists minitor.emp_dept(
     deptno int,
     dept_count int,
     deptname string,
     createtime string   
)row format delimited fields terminated by '\t'
  "

 hive -e" 
  insert into table minitor.emp_dept 
  select 
   a.deptno deptno, 
   a.c dept_count,
   d.dname deptname,
  \" ${DT}\" createtime
  from 
   (select deptno, count(1) c from minitor.emp group by deptno) a join minitor.dept d
  on a.deptno = d.deptno;"
