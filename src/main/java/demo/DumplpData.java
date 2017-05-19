package demo;

import com.mysql.jdbc.Driver;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by zhenya.1291813139.com
 * on 2017/5/18.
 * MySQL_1702.
 */
public class DumplpData {// dump:导入
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/";
    private static final String USER = "root";
    private static final String PASSWORD = "system";
    private static final String SQL = "INSERT INTO db_1712.ip VALUES (NULL, ?, ?, ?)";
//    ?号表示未定义参数
    private static int counter;
    private static PreparedStatement preparedStatement;

    public static void main(String[] args) throws SQLException {
        long start = System.currentTimeMillis();
        new Driver();
        Connection connection = DriverManager.getConnection(URL,USER,PASSWORD);
        connection.setAutoCommit(false); //*** commit 事务  提交
        preparedStatement = connection.prepareStatement(SQL);
//        读取文件
        try(BufferedReader reader = new BufferedReader(new FileReader("data/ip.txt"))) {
            String line;
            while ((line = reader.readLine()) != null ){//  逐行读取
                String min = line.split("\\s+")[0];//  处理每行数据，分割成三个部分
                String max = line.split("\\s+")[1];//   \s+ 表示空格至少有一个可以有多个
                String geo = line.replace(min,"").replace(max,"").trim();
                dump(min, max, geo);
                if(++counter % 10000 == 0){
                    System.out.println(counter);
                    preparedStatement.executeBatch(); // ***
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        preparedStatement.executeBatch();
        connection.commit(); //***
        preparedStatement.close();
        connection.close();
        System.out.println("total time:" + (System.currentTimeMillis() - start) / 1000 + "seconds");
    }
    private static void dump(String min, String max,String geo) throws SQLException {
        preparedStatement.setString(1,min);
        preparedStatement.setString(2,max);
        preparedStatement.setString(3,geo);

        preparedStatement.addBatch();//batch xxx.bat  批处理程序
    }
}

//             解决此题的基本思路：1    2   3
// 1:读取ip.text这个文档，因为有汉字所以用BufferedReader
// 2:将每一行分成三个部分，用字符串的拆分split()方法，括号里的为正则
// 3:将min，max, geo这三个部分传进去后执行一次更新，那么一条记录就存在了，有多少行就循环更新多少次