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
 * on 2017/5/24.
 * MySQL_1702.
 */
public class Baidu_cityCenter_Dump {
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/";
    private static final String USER = "root";
    private static final String PASSWORD = "system";
    private static final String SQL = "INSERT INTO db_1712.baidumap VALUES (NULL,?, ?,?)";
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
        try(BufferedReader reader = new BufferedReader(new FileReader("src/main/java/demo/BaiduMap_cityCenter.txt"))) {
            String line;
            while ((line = reader.readLine()) != null ){//  逐行读取
                String loc = line.split(",")[0];//  处理每行数据，分割成三个部分
                String geo = line.split(",")[1];//   \s+ 表示空格至少有一个可以有多个
                String geo1 = line.split(",")[2];//   \s+ 表示空格至少有一个可以有多个
//                String geo = line.replace(min,"").replace(max,"").trim();
                dump(loc,geo,geo1);
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
        System.out.println();

        //System.out.println({name: '海门', value: [121.15, 31.89, 90]});
    }
    private static void dump(String loc, String geo, String geo1) throws SQLException {
        preparedStatement.setString(1,loc);
        preparedStatement.setString(2,geo);
        preparedStatement.setString(3,geo1);
//        preparedStatement.setString(3,geo);

        System.out.println("{name: " + loc + ", " + " value: [" + geo + ", " + geo1 + "]}" + ",");
        preparedStatement.addBatch();//batch xxx.bat  批处理程序
    }
}

