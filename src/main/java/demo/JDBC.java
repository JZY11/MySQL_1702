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
     用java语言连接数据库
 */
public class JDBC {
    public static void main(String[] args) throws SQLException {
    // 1.准备数据路驱动    JDBC驱动支持
      new Driver();//生成一受检异常
    // 2. 取得一次数据库连接
        Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/db_1712","root","system");
    // 3.预编译
        PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO db_1712.course VALUES (NULL ,'Front-end',2)");
    // 4.执行语句
        preparedStatement.executeUpdate();
        // 5.释放资源
        connection.close();
        preparedStatement.close();
    }

}
