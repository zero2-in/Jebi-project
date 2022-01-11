package com.jebi.dao;

import com.jebi.common.CommonUtil;
import com.jebi.dto.QnaDTO;

import java.sql.SQLException;
import java.util.ArrayList;

public class QnaDAO {
    CommonUtil util = new CommonUtil();

    public ArrayList<QnaDTO> getQnaList(String category, String search, int start, int end) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "SELECT * FROM \n" +
                "(\n" +
                "    SELECT ROWNUM AS rnum, ma.* FROM \n" +
                "    (\n" +
                "        SELECT a.no, '['||c.category_name||']'||' '||a.title AS title, \n" +
                "        b.kor_name AS reg_name, to_char(a.reg_date, 'yyyy-MM-dd hh:mi') AS reg_date \n" +
                "        FROM jebi_qna a, jebi_member b, jebi_qna_category c \n" +
                "        WHERE a.title LIKE '%"+search+"%' AND a.category_code LIKE '%"+category+"%' AND " +
                "        a.reg_id = b.id AND a.category_code = c.category_code \n" +
                "        ORDER BY a.no DESC \n" +
                "    ) ma \n" +
                ")\n" +
                "WHERE rnum BETWEEN "+start+" AND "+end+"";

        util.runQuery(query, debugMethod, 0);

        try {
            while(util.getRs().next()) {

            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }
    }
}
