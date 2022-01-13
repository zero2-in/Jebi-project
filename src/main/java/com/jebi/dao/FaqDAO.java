package com.jebi.dao;

import com.jebi.common.CommonUtil;
import com.jebi.dto.FaqDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FaqDAO {
    CommonUtil util = new CommonUtil();     // con, ps, rs 통합
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    //전체행 페이지
    public int getTotalCount(String category, String search) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();  // 현재 메소드명 출력

        int count = 0;
        String query = "select count(*) from jebi_faq a \r\n" +
                       "where title like '%"+search+"%' AND category_code LIKE '%"+category+"%'";

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

    public ArrayList<FaqDTO> getFaqList(String category, String search, int start, int end) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        ArrayList<FaqDTO> dtos = new ArrayList<>();

        String query = "SELECT * FROM \n" +
                "(\n" +
                "    SELECT ROWNUM AS rnum, ma.* FROM \n" +
                "    (\n" +
                "        SELECT a.no, '['||c.category_name||']'||' '||a.title AS title, \n" +
                "        b.kor_name AS reg_name, to_char(a.reg_date, 'yyyy-MM-dd hh:mi') AS reg_date \n" +
                "        FROM jebi_faq a, jebi_member b, jebi_faq_category c \n" +
                "        WHERE a.title LIKE '%"+search+"%' AND a.category_code LIKE '%"+category+"%' AND " +
                "        a.reg_id = b.id AND a.category_code = c.category_code \n" +
                "        ORDER BY a.no DESC \n" +
                "    ) ma \n" +
                ")\n" +
                "WHERE rnum BETWEEN "+start+" AND "+end+"";
                /*"select * from \n" +
                "(\n" +
                "    select \n" +
                "    no, title, reg_id,\n" +
                "    to_char(reg_date,'yyyy-mm-dd hh:mi:ss') reg_date, \n" +
                "    row_number() \n" +
                "    over(order by no desc) as rnum \n" +
                "    from jebi_faq \n" +
                "    where title like '%"+search+"%'\n" +
                ") \n" +
                "where rnum>="+start+" and rnum <="+end+"";*/

        util.runQuery(query, debugMethod, 0);

        try {
            /*con = DBConnection.getConnection();
            ps  = con.prepareStatement(query);
            rs  = ps.executeQuery();*/
            while(util.getRs().next()) {
                String no = util.getRs().getString("no");
                String title = util.getRs().getString("title");
                String reg_name = util.getRs().getString("reg_name");
                String reg_date = util.getRs().getString("reg_date");

                FaqDTO dto = new FaqDTO(no, title, reg_name, reg_date);
                dtos.add(dto);
            }

        } catch(SQLException e) {
            util.viewErr(debugMethod);
            /*System.out.println("getFaq()오류");
            System.out.println("query:"+query);
            e.printStackTrace();*/
        } finally {
            util.closeDB();
//            DBConnection.closeDB(con, ps, rs);
        }

        return dtos;
    }

    // 카테고리 조회
    public ArrayList<String[]> getCategoryList() {
        ArrayList<String[]> list = new ArrayList<>();

        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "SELECT category_code, category_name FROM jebi_faq_category ORDER BY category_code ASC";

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

    public FaqDTO getFaqView(String no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        FaqDTO dto = null;

        String query = "SELECT a.no, '['||c.category_name||']'||' '||a.title AS title, \r\n" +
                "a.content, reg_id, b.kor_name AS reg_name, \r\n" +
                "to_char(a.reg_date, 'yyyy-MM-dd hh:mi') AS reg_date, a.hit, a.category_code \r\n" +
                "FROM jebi_faq a, jebi_member b, jebi_faq_category c \r\n" +
                "WHERE a.reg_id = b.id AND a.no = '"+no+"' AND a.category_code = c.category_code";

        util.runQuery(query, debugMethod, 0);

        try {
            if(util.getRs().next()) {
                String title = util.getRs().getString("title");
                String content = util.getRs().getString("content");
                String reg_id = util.getRs().getString("reg_id");
                String reg_name = util.getRs().getString("reg_name");
                String reg_date = util.getRs().getString("reg_date");
                String category_code = util.getRs().getString("category_code");
                int hit = util.getRs().getInt("hit");

                dto = new FaqDTO(no, title, content, reg_id, reg_name, reg_date, hit, category_code);
            }
        } catch(SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return dto;
    }

    // 수정용 보기
    public FaqDTO getFaqModifyView(String no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        FaqDTO dto = null;

        String query = "SELECT a.no, a.title, \r\n" +
                "a.content, reg_id, b.kor_name AS reg_name, \r\n" +
                "to_char(a.reg_date, 'yyyy-MM-dd hh:mi') AS reg_date, a.hit, c.category_code \r\n" +
                "FROM jebi_faq a, jebi_member b, jebi_faq_category c \r\n" +
                "WHERE a.reg_id = b.id AND a.no = '"+no+"' AND a.category_code = c.category_code";

        util.runQuery(query, debugMethod, 0);

        try {
            if(util.getRs().next()) {
                String title = util.getRs().getString("title");
                String content = util.getRs().getString("content");
                String reg_id = util.getRs().getString("reg_id");
                String reg_name = util.getRs().getString("reg_name");
                String reg_date = util.getRs().getString("reg_date");
                String category_code = util.getRs().getString("category_code");
                int hit = util.getRs().getInt("hit");

                dto = new FaqDTO(no, title, content, reg_id, reg_name, reg_date, hit, category_code);
            }
        } catch(SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return dto;
    }

    // 조회수 증가
    public int hitFaq(String no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "UPDATE jebi_faq SET hit = hit + 1 WHERE no = '"+no+"'";

        return util.runQuery(query, debugMethod, 1);
    }

    public String getMaxNo() {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String maxNo = "1";

        String query = "SELECT MAX(no) maxno FROM jebi_faq";
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

    // 이전글 조회
    public String[] getPrevFaq(String no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String[] prevFaq = new String[2];

        String query = "SELECT a.maxno, b.title FROM \n" +
                "(\n" +
                "    SELECT MAX(no) maxno \n" +
                "    FROM jebi_faq \n" +
                "    WHERE no < '"+no+"' \n" +
                ") a, jebi_faq b WHERE a.maxno = b.no";
        util.runQuery(query, debugMethod, 0);
        try {
            if(util.getRs().next()) {
                prevFaq[0] = util.getRs().getString("maxno");
                prevFaq[1] = util.getRs().getString("title");
            }
        } catch(SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return prevFaq;
    }

    // 다음글 조회
    public String[] getNextFaq(String no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String[] nextFaq = new String[2];

        String query = "SELECT a.minno, b.title FROM\n" +
                "(\n" +
                "    SELECT MIN(no) minno \n" +
                "    FROM jebi_faq \n" +
                "    WHERE no > '"+no+"' \n" +
                ") a, jebi_faq b WHERE a.minno = b.no";
        util.runQuery(query, debugMethod, 0);

        try {
            if(util.getRs().next()) {
                nextFaq[0] = util.getRs().getString("minno");
                nextFaq[1] = util.getRs().getString("title");
            }
        } catch(SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return nextFaq;
    }

    // 자주하는질문 등록
    public int insertFaq(FaqDTO dto) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "INSERT INTO jebi_faq \n" +
                "(no, title, content, category_code, reg_id) \n" +
                "VALUES('"+dto.getNo()+"', '"+dto.getTitle()+"', ?, '"+dto.getCategory_code()+"', '"+dto.getReg_id()+"')";

        return util.runQuery(query, debugMethod, dto.getContent());
    }

    // 자주하는질문 수정
    public int updateFaq(FaqDTO dto) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "UPDATE jebi_faq SET \n" +
                "title = '"+dto.getTitle()+"', content = ?, \r\n" +
                "category_code = '"+dto.getCategory_code()+"', reg_id = '"+dto.getReg_id()+"', reg_date = CURRENT_TIMESTAMP \r\n" +
                "WHERE no = '"+dto.getNo()+"'";

        return util.runQuery(query, debugMethod, dto.getContent());
    }

    // 자주하는질문 삭제
    public int deleteFaq(String no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "DELETE FROM jebi_faq WHERE no = '"+no+"'";

        return util.runQuery(query, debugMethod, 1);
    }
}
