package demo;

import com.mysql.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by zhenya.1291813139.com
 * on 2017/5/16.
 * MySQL_1702.
 */
/*
     用java语言连接数据库   JDBC Java Database Connectivity Java 语言数据库连接
 */
public class JDBC {
    public static void main(String[] args) throws SQLException {
    // 1.准备数据路驱动    JDBC驱动支持
      new Driver();//生成一受检异常  加载MySQL的驱动
    // 2. 取得一次数据库连接  Connection 为java sql包的一个接口   它的取得方式为DriverManager类的静态方法getConnection
        Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/db_1712","root","system");
    // 3.预编译   加载了一个sql语句，通过connection调用prepareStatement方法，返回PreparedStatement接口的一个实例preparedStatement
        PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO db_1712.course VALUES (NULL ,'Front-end',2)");
    // 4.执行语句   用预编译语句的对象preparedStatement调用了一个无参的executeUpdate()方法，执行了一次更新
        preparedStatement.executeUpdate();
        // 5.释放资源
        connection.close();
        preparedStatement.close();
    }

}
