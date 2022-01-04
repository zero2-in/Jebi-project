package com.jebi.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnectioin() {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
        } catch(ClassNotFoundException e) {
            System.out.println("드라이버 로드 실패");
            e.printStackTrace();
        }
        final String DB_IP = "183.107.30.124";
        final String DB_PORT = "3306";
        final String DB_NAME = "jebi_db";
        final String DB_URL = "jdbc:mariadb://" + DB_IP + ":" + DB_PORT + "/" + DB_NAME;
        Connection con = null;
        try{
            con = DriverManager.getConnection(DB_URL, "jebi", "0122");
        } catch(SQLException e) {
            System.out.println("접속 실패!");
        }
        return con;
    }

    public static void closeDB(Connection con, PreparedStatement ps, ResultSet rs) {
        try{
            if(rs != null) rs.close();
            if(ps != null) ps.close();
            if(con != null) con.close();
        } catch(SQLException e) {
            e.printStackTrace();
        }
    }
}
