package com.jebi.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.jebi.common.CommonUtil;
import com.jebi.dto.NoticeDTO;

public class NoticeDAO {
    CommonUtil util = new CommonUtil();
    ArrayList<NoticeDTO> list = null;

    public ArrayList<NoticeDTO> getNoticeList() {
        list = new ArrayList<>();
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "SELECT a.no, a.title, a.important, b.kor_name AS reg_name, to_char(a.reg_date, 'yyyy-MM-dd hh:mm') AS reg_date, a.hit \r\n" +
        "FROM jebi_notice a, jebi_member b \r\n" +
        "WHERE a.reg_id = b.id \r\n" +
        "ORDER BY a.important DESC, no DESC";
        util.runQuery(query, debugMethod, 0);

        try {
            while(util.getRs().next()) {
                String no = util.getRs().getString("no");
                String title = util.getRs().getString("title");
                String important = util.getRs().getString("important");
                String reg_name = util.getRs().getString("reg_name");
                String reg_date = util.getRs().getString("reg_date");
                int hit = util.getRs().getInt("hit");

                list.add(new NoticeDTO(no, title, important, reg_name, reg_date, hit));
            }
        } catch(SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return list;
    }

    public NoticeDTO getNoticeView(String no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        NoticeDTO dto = null;

        String query = "SELECT a.no, a.title, a.content, a.important, reg_id, b.kor_name AS reg_name, \r\n" +
        "to_char(a.reg_date, 'yyyy-MM-dd hh:mm') AS reg_date, a.hit \r\n" +
        "FROM jebi_notice a, jebi_member b \r\n" +
        "WHERE a.reg_id = b.id AND a.no = '"+no+"'";

        util.runQuery(query, debugMethod, 0);

        try {
            if(util.getRs().next()) {
                String title = util.getRs().getString("title");
                String content = util.getRs().getString("content");
                String important = util.getRs().getString("important");
                String reg_id = util.getRs().getString("reg_id");
                String reg_name = util.getRs().getString("reg_name");
                String reg_date = util.getRs().getString("reg_date");
                int hit = util.getRs().getInt("hit");

                dto = new NoticeDTO(no, title, content, important, reg_id, reg_name, reg_date, hit);
            }
        } catch(SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return dto;
    }

    // 이전글 조회
    public String[] getPrevNotice(String no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String[] prevNotice = new String[2];

        String query = "";
        util.runQuery(query, debugMethod, 0);
        try {
            if(util.getRs().next()) {

            }
        } catch(SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return prevNotice;
    }

    // 다음글 조회
    public String[] getNextNotice(String no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String[] nextNotice = new String[2];

        String query = "";
        util.runQuery(query, debugMethod, 0);

        try {
            if(util.getRs().next()) {

            }
        } catch(SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return nextNotice;
    }
}
