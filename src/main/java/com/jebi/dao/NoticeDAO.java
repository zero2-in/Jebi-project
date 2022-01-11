package com.jebi.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.jebi.common.CommonUtil;
import com.jebi.dto.NoticeDTO;

public class NoticeDAO {
    CommonUtil util = new CommonUtil();
    ArrayList<NoticeDTO> list = null;

    public ArrayList<NoticeDTO> getImportantNoticeList() {
        list = new ArrayList<>();
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "SELECT a.no, a.title, a.important, b.kor_name AS reg_name, to_char(a.reg_date, 'yyyy-MM-dd hh:mm') AS reg_date, a.hit \r\n" +
                "FROM jebi_notice a, jebi_member b \r\n" +
                "WHERE a.reg_id = b.id AND a.important != 'N' \r\n" +
                "ORDER BY a.important DESC";
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
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return list;
    }

    public ArrayList<NoticeDTO> getNoticeList(String search, int start, int end) {
        list = new ArrayList<>();
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "SELECT * FROM \r\n" +
                "(\r\n" +
                "    SELECT ROWNUM AS rnum, ma.* FROM \r\n" +
                "    (\r\n" +
                "        SELECT a.no, a.title, a.important, b.kor_name AS reg_name, to_char(a.reg_date, 'yyyy-MM-dd hh:mi') AS reg_date, a.hit \r\n" +
                "        FROM jebi_notice a, jebi_member b \r\n" +
                "        WHERE a.title LIKE '%"+search+"%' AND a.reg_id = b.id AND a.important = 'N' ORDER BY a.no DESC \r\n" +
                "    ) ma \r\n" +
                ")\r\n" +
                "WHERE rnum BETWEEN "+start+" AND "+end+"";
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
        "to_char(a.reg_date, 'yyyy-MM-dd hh:mi') AS reg_date, a.hit \r\n" +
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

    public int getTotal(String search) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        int count = 0;

        String query = "SELECT COUNT(no) cnt FROM jebi_notice \r\n" +
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

    // 이전글 조회
    public String[] getPrevNotice(String no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String[] prevNotice = new String[2];

        String query = "SELECT a.maxno, b.title FROM \n" +
                "(\n" +
                "    SELECT MAX(no) maxno \n" +
                "    FROM jebi_notice \n" +
                "    WHERE no < '"+no+"' \n" +
                ") a, jebi_notice b WHERE a.maxno = b.no";
        util.runQuery(query, debugMethod, 0);
        try {
            if(util.getRs().next()) {
                prevNotice[0] = util.getRs().getString("maxno");
                prevNotice[1] = util.getRs().getString("title");
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

        String query = "SELECT a.minno, b.title FROM\n" +
                "(\n" +
                "    SELECT MIN(no) minno \n" +
                "    FROM jebi_notice\n" +
                "    WHERE no > '"+no+"' \n" +
                ") a, jebi_notice b WHERE a.minno = b.no";
        util.runQuery(query, debugMethod, 0);

        try {
            if(util.getRs().next()) {
                nextNotice[0] = util.getRs().getString("minno");
                nextNotice[1] = util.getRs().getString("title");
            }
        } catch(SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return nextNotice;
    }

    // 조회수 증가
    public int hitNotice(String no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "UPDATE jebi_notice SET hit = hit + 1 WHERE no = '"+no+"'";

        return util.runQuery(query, debugMethod, 1);
    }

    public String getMaxNo() {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String maxNo = "1";

        String query = "SELECT MAX(no) maxno FROM jebi_notice";
        util.runQuery(query, debugMethod, 0);
        
        try {
            if(util.getRs().next()) {
                int maxNum = (util.getRs().getInt("maxno") + 1);

                maxNo = Integer.toString(maxNum);
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return maxNo;
    }

    // 공지사항 등록
    public int insertNotice(NoticeDTO dto) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "INSERT INTO jebi_notice \n" +
                "(no, title, content, important, reg_id) \n" +
                "VALUES('"+dto.getNo()+"', '"+dto.getTitle()+"', ?, '"+dto.getImportant()+"', '"+dto.getReg_id()+"')";

        return util.runQuery(query, debugMethod, dto.getContent());
    }

    // 공지사항 수정
    public int updateNotice(NoticeDTO dto) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "UPDATE jebi_notice SET title = '"+dto.getTitle()+"', content = ?, \n" +
                "important = '"+dto.getImportant()+"', reg_id = '"+dto.getReg_id()+"', reg_date = CURRENT_TIMESTAMP WHERE no = '"+dto.getNo()+"'";

        return util.runQuery(query, debugMethod, dto.getContent());
    }

    // 공지사항 삭제
    public int deleteNotice(String no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "DELETE FROM jebi_notice WHERE no = '"+no+"'";

        return util.runQuery(query, debugMethod, 1);
    }
}
