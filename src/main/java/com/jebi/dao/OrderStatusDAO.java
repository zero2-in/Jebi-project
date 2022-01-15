package com.jebi.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.jebi.common.CommonUtil;
import com.jebi.dto.StatusListDTO;

public class OrderStatusDAO {
    CommonUtil util = new CommonUtil();

    public ArrayList<StatusListDTO> getStatusListCategory() {
        ArrayList<StatusListDTO> list = new ArrayList<>();
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "";

        util.runQuery(query, debugMethod, 0);

        try {
            while(util.getRs().next()) {

            }
        } catch(SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return list;
    }
    
}
