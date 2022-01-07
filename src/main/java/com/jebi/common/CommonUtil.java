package com.jebi.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CommonUtil {
    private Connection con = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    /*
        사용법 : 
        CommonUtil util = new CommonUtil();   -- 객체 생성

        public ... getExample() {
            String debugMethod = new Object() {}.getClass().getEnclosingMethod().getName(); -- 현재 메소드 명
            String query = "SELECT * FROM 뭐시기"; 
            
            util.runQuery(query, debugMethod, 0);                   -- 0: 오직 query가 SELECT문 일때만 사용하세요.
            try {
                while(util.getRs().next()) {                        -- util.getRs().next() == rs.next()
                    String no = util.getRs().getString("no");       -- util.getRs().getString() == rs.getString()
                    ...
                }
            } catch(SQLException e) {
                util.viewErr(debugMethod);
            }
        }
    */

    // type[0] : SELECT, type[1] : UPDATE, DELETE, INSERT
    public int runQuery(String query, String debugMethod, int type) {
        int result = 0;

        try {
            con = DBConnection.getConnectioin();
            ps = con.prepareStatement(query);
            switch(type) {
                case 0 : rs = ps.executeQuery(); result+=1; break;
                case 1 : result = ps.executeUpdate(); break;
            }
        } catch(SQLException e) {
            e.printStackTrace();
            System.out.println("\n\n-------------------------------------");
            System.out.println(debugMethod+"메소드에서 오류가 발생했습니다!");
            System.out.println("실행된 query : "+query);
            System.out.println("-------------------------------------\n\n");
        }

        return result;
    }

    public void viewErr(String debugMethod) {
        System.out.println("\n\n---------------------------------");
        System.out.println(debugMethod+"메소드에서 ResultSet 오류가 발생했습니다");
        System.out.println("---------------------------------\n\n");
    }

    public ResultSet getRs() {
        return this.rs;
    }

    public void closeDB() {
        DBConnection.closeDB(con, ps, rs);
    }
}
