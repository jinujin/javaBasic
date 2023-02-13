package dbConn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MysqlConnectionMaker implements ConnectionMaker{
    private  final String ADDRESS = "jdbc:mysql://localhost/basic";
    private final String USERNAME = "root";
    private final String PASSWORD = "0426";
    @Override
    public Connection makeConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(ADDRESS,USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
//
        System.out.println("MySql 데이터베이스 연결 시도");
//        System.out.println("연결 주소: "+ ADDRESS);
//        System.out.println("아이디: "+ USERNAME);
//        System.out.println("비밀번호: "+ PASSWORD);
        System.out.println("연결 성공");
        return connection;
    }
}
