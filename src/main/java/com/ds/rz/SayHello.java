package com.ds.rz;


import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;

import java.util.Random;

/**
 * Created by 15U-3748 on 2016/12/21.
 */
public class SayHello extends UDF {

    public Text evaluate(Text name) {
        int v = (int) (Math.random() * 10);
        return new Text(v + "_" + name);
    }

    public Text evaluate(Text name, IntWritable id) {
        String s = name.toString();
        String start = s.substring(0,1);
        if (isInt(start)) {
            int v = Integer.parseInt(start);
            if (v > 0 && v < 10){
                 return new Text(s.substring(2,s.length()));
            }
        }
        return new Text("Hello：" + name + "-" + id);
    }

    private boolean isInt(String s) {
        try {
            Integer.parseInt(s);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }


    }


    public static void main(String[] args) {


        SayHello hello = new SayHello();
        System.out.println(hello.evaluate(new Text("aaa")));
        System.out.print(hello.evaluate(new Text("4_aaa"),new IntWritable(111)));
    }
}
