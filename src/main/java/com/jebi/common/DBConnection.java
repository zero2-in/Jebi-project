package com.jebi.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnection() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch(ClassNotFoundException e) {
            System.out.println("드라이버 로드 실패");
            e.printStackTrace();
        }
        final String DB_URL = "jdbc:oracle:thin:@192.168.0.16:1521:xe";
        Connection con = null;
        try {
            con = DriverManager.getConnection(DB_URL, "jebi", "0122");
        } catch(SQLException e) {
            System.out.println("접속 실패!");
        }
        return con;
    }

    public static void closeDB(Connection con, PreparedStatement ps, ResultSet rs) {
        try {
            if(rs != null) rs.close();
            if(ps != null) ps.close();
            if(con != null) con.close();
        } catch(SQLException e) {
            e.printStackTrace();
        }
    }
}
