package com.ds.rz;

import java.sql.*;

/**
 * Created by Administrator on 2016/12/28 0028.
 *HIVE JDBC连接
 * @Verson 1.0
 */
public class HiveJdbc {

    private static  final  String DRIVER_NAME = "org.apache.hive.jdbc.HiveDriver";

    public static void main(String[] args) {
        try {
            Class.forName(DRIVER_NAME);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try {
            Connection conn = DriverManager.getConnection("jdbc:hive2://yang05:6666/minitor", "hadoop", "");
            Statement stmt = conn.createStatement();
            String sql = "select * from emp_dept";
            ResultSet res = stmt.executeQuery(sql);
            while (res.next()){
                System.out.println(res.getInt("deptno"));
                System.out.println(res.getInt("dept_count"));
                System.out.println(res.getString("deptname"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
