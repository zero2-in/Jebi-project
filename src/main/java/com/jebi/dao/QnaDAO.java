package com.jebi.dao;

import com.jebi.common.CommonUtil;
import com.jebi.dto.FaqDTO;
import com.jebi.dto.NoticeDTO;
import com.jebi.dto.QnaDTO;
import com.jebi.dto.QnaReplyDTO;

import java.sql.Array;
import java.sql.SQLException;
import java.util.ArrayList;

public class QnaDAO {
    CommonUtil util = new CommonUtil();

    public ArrayList<QnaDTO> getQnaList(String category, String search, int start, int end) {
        ArrayList<QnaDTO> list = new ArrayList<>();
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "SELECT * FROM \n" +
                "(\n" +
                "    SELECT ROWNUM AS rnum, ma.* FROM \n" +
                "    (\n" +
                "        SELECT a.no, c.category_name, a.title, a.reg_id, \n" +
                "        b.kor_name AS reg_name, to_char(a.reg_date, 'yyyy-MM-dd hh:mi') AS reg_date \n" +
                "        FROM jebi_qna a, jebi_member b, jebi_qna_category c \n" +
                "        WHERE a.title LIKE '%"+search+"%' AND a.category_code LIKE '%"+category+"%' AND " +
                "        a.reg_id = b.id AND a.category_code = c.category_code AND a.important = 'N' \n" +
                "        ORDER BY a.no DESC \n" +
                "    ) ma \n" +
                ")\n" +
                "WHERE rnum BETWEEN "+start+" AND "+end+"";

        util.runQuery(query, debugMethod, 0);

        try {
            while(util.getRs().next()) {
                String no = util.getRs().getString("no");
                String category_name = util.getRs().getString("category_name");
                String title = util.getRs().getString("title");
                String reg_name = util.getRs().getString("reg_name");
                String reg_date = util.getRs().getString("reg_date");

                list.add(new QnaDTO(no, category_name, title, reg_name, reg_date));
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return list;
    }

    public ArrayList<QnaDTO> getQnaList(String category, String search, int start, int end, String id) {
        ArrayList<QnaDTO> list = new ArrayList<>();
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "SELECT * FROM \n" +
                "(\n" +
                "    SELECT ROWNUM AS rnum, ma.* FROM \n" +
                "    (\n" +
                "        SELECT a.no, c.category_name, a.title, a.reg_id, \n" +
                "        b.kor_name AS reg_name, to_char(a.reg_date, 'yyyy-MM-dd hh:mi') AS reg_date \n" +
                "        FROM jebi_qna a, jebi_member b, jebi_qna_category c \n" +
                "        WHERE a.title LIKE '%"+search+"%' AND a.category_code LIKE '%"+category+"%' AND " +
                "        a.reg_id = b.id AND a.category_code = c.category_code AND a.important = 'N' AND a.reg_id = '"+id+"' \n" +
                "        ORDER BY a.no DESC \n" +
                "    ) ma \n" +
                ")\n" +
                "WHERE rnum BETWEEN "+start+" AND "+end+"";

        util.runQuery(query, debugMethod, 0);

        try {
            while(util.getRs().next()) {
                String no = util.getRs().getString("no");
                String category_name = util.getRs().getString("category_name");
                String title = util.getRs().getString("title");
                String reg_name = util.getRs().getString("reg_name");
                String reg_date = util.getRs().getString("reg_date");

                list.add(new QnaDTO(no, category_name, title, reg_name, reg_date));
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return list;
    }

    public ArrayList<QnaDTO> getImportantQnaList() {
        ArrayList<QnaDTO> list = new ArrayList<>();
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "SELECT a.no, c.category_name, a.title, a.important, b.kor_name AS reg_name, to_char(a.reg_date, 'yyyy-MM-dd hh:mi') AS reg_date \n" +
                "FROM jebi_qna a, jebi_member b, jebi_qna_category c \n" +
                "WHERE a.reg_id = b.id AND a.important != 'N' AND c.category_code = a.category_code \n" +
                "ORDER BY a.important DESC";
        util.runQuery(query, debugMethod, 0);

        try {
            while(util.getRs().next()) {
                String no = util.getRs().getString("no");
                String category_name = util.getRs().getString("category_name");
                String title = util.getRs().getString("title");
                String important = util.getRs().getString("important");
                String reg_name = util.getRs().getString("reg_name");
                String reg_date = util.getRs().getString("reg_date");

                list.add(new QnaDTO(no, category_name, title, important, reg_name, reg_date));
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return list;
    }

    public QnaDTO getQnaView(String no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        QnaDTO dto = null;

        String query = "SELECT a.no, a.category_code, c.category_name, a.title, a.content, a.reg_id, b.kor_name AS reg_name, to_char(a.reg_date, 'yyyy-MM-dd hh:mi') reg_date, \n" +
                "important, attach FROM jebi_qna a, jebi_member b, jebi_qna_category c \n" +
                "WHERE a.reg_id = b.id AND a.category_code = c.category_code AND a.no = '"+no+"'";

        util.runQuery(query, debugMethod, 0);

        try {
            if (util.getRs().next()) {
                String category_code = util.getRs().getString("category_code");
                String category_name = util.getRs().getString("category_name");
                String title = util.getRs().getString("title");
                String content = util.getRs().getString("content");
                String reg_id = util.getRs().getString("reg_id");
                String reg_name = util.getRs().getString("reg_name");
                String reg_date = util.getRs().getString("reg_date");
                String important = util.getRs().getString("important");
                String attach = util.getRs().getString("attach");

                dto = new QnaDTO(no, category_code, category_name, title, content, important, attach, reg_id, reg_name, reg_date);
            }
        } catch(SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return dto;
    }

    // 댓글 조회
    public ArrayList<QnaReplyDTO> getReplyList(String qna_no) {
        ArrayList<QnaReplyDTO> list = new ArrayList<>();
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "SELECT a.no, c.no AS qna_no, a.comment_content, comment_reg_id, b.kor_name AS comment_reg_name, to_char(a.comment_reg_date, 'yyyy-MM-dd') AS reg_date \n" +
                "FROM jebi_qna_reply a, jebi_member b, jebi_qna c \n" +
                "WHERE a.qna_no = '"+qna_no+"' AND a.comment_reg_id = b.id AND c.no = a.qna_no \n" +
                "ORDER BY a.no ASC";

        util.runQuery(query, debugMethod, 0);

        try {
            while(util.getRs().next()) {
                String no = util.getRs().getString("no");
                String comment_content = util.getRs().getString("comment_content");
                String comment_reg_id = util.getRs().getString("comment_reg_id");
                String comment_reg_name = util.getRs().getString("comment_reg_name");
                String comment_reg_date = util.getRs().getString("reg_date");

                list.add(new QnaReplyDTO(no, qna_no, comment_content, comment_reg_id, comment_reg_name, comment_reg_date));
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return list;
    }

    // 카테고리 조회
    public ArrayList<String[]> getCategoryList() {
        ArrayList<String[]> list = new ArrayList<>();

        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "SELECT category_code, category_name FROM jebi_qna_category ORDER BY category_code ASC";

        util.runQuery(query, debugMethod, 0);

        try {
            while(util.getRs().next()) {
                String[] category = new String[2];
                category[0] = util.getRs().getString("category_code");
                category[1] = util.getRs().getString("category_name");
                list.add(category);
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return list;
    }

    //전체행 페이지
    public int getTotalCount(String category, String search) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();  // 현재 메소드명 출력

        int count = 0;
        String query = "SELECT count(*) FROM jebi_qna \r\n" +
                "WHERE title LIKE '%"+search+"%' AND category_code LIKE '%"+category+"%'";

        util.runQuery(query, debugMethod, 0);   // type: 0 = SELECT, 1 = INSERT, UPDATE, DELETE

        try {
            /*con = DBConnection.getConnection();
            ps  = con.prepareStatement(query);
            rs  = ps.executeQuery();*/
            if(util.getRs().next()) {   // getResultSet()
                count = util.getRs().getInt(1);
            }

        } catch(SQLException e) {
            util.viewErr(debugMethod);  // ResultSet 오류문구 출력
            /*System.out.println("Notice CountFaq()오류");
            System.out.println("query:"+query);
            e.getStackTrace();*/
        } finally {
            util.closeDB();             // 데이터베이스 닫기
//            DBConnection.closeDB(con, ps, rs);
        }

        return count;
    }

    public String getMaxNo() {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String maxNo = "1";

        String query = "SELECT MAX(no) maxno FROM jebi_qna";
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

    private String getMaxReplyNo() {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String maxNo = "1";
        String query = "SELECT max(no) AS maxno FROM jebi_qna_reply";

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

    public String getQnaRegId(String no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String reg_id = "";

        String query = "SELECT reg_id FROM jebi_qna WHERE no = '"+no+"'";
        util.runQuery(query, debugMethod, 0);

        try {
            if(util.getRs().next()) {
                reg_id = util.getRs().getString("reg_id");
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return reg_id;
    }

    // 1:1문의 댓글 등록
    public int insertReply(QnaReplyDTO dto) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "INSERT INTO jebi_qna_reply \n" +
                "(no, qna_no, comment_content, comment_reg_id) \n" +
                "VALUES('"+getMaxReplyNo()+"', '"+dto.getQna_no()+"', ?, '"+dto.getComment_reg_id()+"')";

        return util.runQuery(query, debugMethod, dto.getComment_content());
    }

    // 1:1문의 등록
    public int insertQna(QnaDTO dto) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "INSERT INTO jebi_qna \n" +
                "(no, title, content, category_code, important, attach, reg_id) \n" +
                "VALUES('"+dto.getNo()+"', '"+dto.getTitle()+"', ?, '"+dto.getCategory_code()+"', '"+dto.getImportant()+"', " +
                "'"+dto.getAttach()+"', '"+dto.getReg_id()+"')";

        return util.runQuery(query, debugMethod, dto.getContent());
    }

    // 1:1문의 댓글 삭제
    public int deleteQnaReply(String no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "DELETE FROM jebi_qna_reply WHERE no = '"+no+"'";

        return util.runQuery(query, debugMethod, 1);
    }

    // 1:1문의 게시글의 댓글 전체 삭제
    public int deleteQnaReplyAll(String qna_no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "DELETE FROM jebi_qna_reply WHERE qna_no = '"+qna_no+"'";

        return util.runQuery(query, debugMethod, 1);
    }

    // 1:1문의 게시글 삭제
    public int deleteQna(String no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "DELETE FROM jebi_qna WHERE no = '"+no+"'";

        return util.runQuery(query, debugMethod, 1);
    }

    // 게시글 수정
    public int updateQna(QnaDTO dto) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "UPDATE jebi_qna SET title = '"+dto.getTitle()+"', category_code = '"+dto.getCategory_code()+"', \r\n" +
                "content = ?, important = '"+dto.getImportant()+"', attach = '"+dto.getAttach()+"', \r\n" +
                "reg_id = '"+dto.getReg_id()+"', reg_date = CURRENT_TIMESTAMP WHERE no = '"+dto.getNo()+"'";

        return util.runQuery(query, debugMethod, dto.getContent());
    }
}
