package com.jebi.dao;

import com.jebi.common.CommonUtil;
import com.jebi.dto.MailboxDTO;

import java.sql.SQLException;
import java.util.ArrayList;

public class MailboxDAO {
    CommonUtil util = new CommonUtil();

    public ArrayList<MailboxDTO> getMailList(String id, int start, int end) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        ArrayList<MailboxDTO> list = new ArrayList<>();
        String query = "SELECT * FROM \n" +
                "( \n" +
                "    SELECT ROWNUM AS rnum, ma.* FROM \n" +
                "    ( \n" +
                "        SELECT a.no, a.title, b.kor_name AS reg_name, to_char(a.reg_date, 'yyyy-MM-dd') AS reg_date, \n" +
                "        to_char(a.read_date, 'yyyy-MM-dd') AS read_date FROM jebi_mailbox a, jebi_member b \n" +
                "        WHERE a.reg_id = b.id AND a.to_userid = '"+id+"' \n" +
                "        ORDER BY a.reg_date DESC\n" +
                "    ) ma \n" +
                ") \n" +
                "WHERE rnum BETWEEN "+start+" AND "+end+"";

        util.runQuery(query, debugMethod, 0);

        try {
            while(util.getRs().next()) {
                String no = util.getRs().getString("no");
                String title = util.getRs().getString("title");
                String reg_name = util.getRs().getString("reg_name");
                String reg_date = util.getRs().getString("reg_date");
                String read_date = util.getRs().getString("read_date");

                list.add(new MailboxDTO(no, title, reg_name, reg_date, read_date));
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return list;
    }

    public int getTotal() {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        int count = 0;
        String query = "SELECT COUNT(*) AS cnt FROM jebi_mailbox";

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

    public MailboxDTO getMailView(String no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        MailboxDTO dto = null;
        String query = "SELECT title, content FROM jebi_mailbox WHERE no = '"+no+"'";
        util.runQuery(query, debugMethod, 0);

        try {
            if(util.getRs().next()) {
                String title = util.getRs().getString("title");
                String content = util.getRs().getString("content");

                dto = new MailboxDTO(no, title, content);
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return dto;
    }

    public int setReaddate(String no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "UPDATE jebi_mailbox SET read_date = nvl((SELECT read_date FROM jebi_mailbox WHERE no = '"+no+"'), CURRENT_TIMESTAMP), has_read = 'Y' WHERE no = '"+no+"'";

        return util.runQuery(query, debugMethod, 1);
    }

    public int deleteMailbox(String id, String no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "DELETE FROM jebi_mailbox WHERE no = '"+no+"' AND to_userid = '"+id+"'";

        return util.runQuery(query, debugMethod, 1);
    }
}
