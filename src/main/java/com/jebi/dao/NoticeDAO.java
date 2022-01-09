package com.jebi.dao;

import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import com.jebi.common.CommonUtil;
import com.jebi.dto.NoticeDTO;

public class NoticeDAO {
    CommonUtil util = new CommonUtil();
    ArrayList<NoticeDTO> list = null;

    public ArrayList<NoticeDTO> getNoticeList() {
        list = new ArrayList<>();
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "SELECT a.no, a.title, a.important, b.kor_name AS reg_name, date_format(a.reg_date, '%Y-%m-%d %H:%i') AS reg_date, a.hit \r\n" +
        "FROM jebi_notice a, jebi_member b \r\n" +
        "WHERE a.reg_id = b.id \r\n" +
        "ORDER BY a.important DESC, no DESC";
        util.runQuery(query, debugMethod, 0);

        try {
            while(util.getRs().next()) {
                DecimalFormat df = new DecimalFormat("###,###");

                String no = df.format(util.getRs().getInt("no"));
                String title = util.getRs().getString("title");
                String important = util.getRs().getString("important");
                String reg_name = util.getRs().getString("reg_name");
                String reg_date = util.getRs().getString("reg_date");
                String hit = df.format(util.getRs().getInt("hit"));

                list.add(new NoticeDTO(no, title, important, reg_name, reg_date, hit));
            }
        } catch(SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return list;
    }
}
