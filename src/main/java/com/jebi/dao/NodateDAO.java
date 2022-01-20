package com.jebi.dao;


import com.jebi.common.CommonUtil;

import java.sql.SQLException;
import java.util.ArrayList;

public class NodateDAO<NodateDTO> {
    CommonUtil util = new CommonUtil();
    ArrayList<NodateDTO> list = null;

    public ArrayList<NodateDTO> getNodateList(String search, int start, int end) {
        list = new ArrayList<>();
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "";
        util.runQuery(query, debugMethod, 0);

        try {
            while(util.getRs().next()) {
                String  no = util.getRs().getString("no");


                list.add(new NodateDTO(no));
            }
        } catch(SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return list;
    }
    public int getTotal(String search) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        int count = 0;

        String query = "SELECT COUNT(no) cnt FROM jebi_nodate \r\n" +
                "WHERE title LIKE '%"+search+"%' AND important = 'N'";

        util.runQuery(query, debugMethod, 0);

        try {
            if(util.getRs().next()) {
                count = util.getRs().getInt("cnt");
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return count;
    }
}

