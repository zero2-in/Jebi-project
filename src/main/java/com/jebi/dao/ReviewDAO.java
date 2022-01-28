package com.jebi.dao;

import com.jebi.common.CommonUtil;
import com.jebi.dto.EventDTO;
import com.jebi.dto.ReviewDTO;

import java.sql.SQLException;
import java.util.ArrayList;

public class ReviewDAO {
    CommonUtil util = new CommonUtil();
    ArrayList<ReviewDTO> list = null;

    public ArrayList<ReviewDTO> getReviewList(String search, int start, int end) {
        list = new ArrayList<>();
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "select * from \n" +
                "(\n" +
                "    select \n" +
                "    a.no, a.title, a.reg_id, b.kor_name, a.content,\n" +
                "    to_char(a.reg_date,'yyyy-mm-dd') reg_date, a.attach, \n" +
                "    a.hit,\n" +
                "    row_number() \n" +
                "    over(order by a.no desc) as rnum \n" +
                "    from jebi_review a, jebi_member b\n" +
                "    where a.reg_id = b.id\n" +
                "    and a.title like '%"+search+"%'\n" +
                ") \n" +
                "where rnum>="+start+" and rnum <="+end+"";
        util.runQuery(query, debugMethod, 0);

        try {
            while(util.getRs().next()) {
                String no = util.getRs().getString("no");
                String title = util.getRs().getString("title");
                String kor_name = util.getRs().getString("kor_name");
                String content = util.getRs().getString("content");
                String reg_date = util.getRs().getString("reg_date");
                String attach = util.getRs().getString("attach");
                int hit = util.getRs().getInt("hit");

                list.add(new ReviewDTO(no, title, reg_date, kor_name, content, attach, hit));
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

        String query = "SELECT COUNT(no) cnt FROM jebi_review \r\n" +
                "WHERE title LIKE '%"+search+"%'";

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

    public String getMaxNo() {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String maxNo = "1";

        String query = "SELECT MAX(no) maxno FROM jebi_review";
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

    //  등록
    public int insertReview(ReviewDTO dto) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "insert into jebi_review \n" +
                "(no, title, content, attach, reg_id, reg_date) \n" +
                "values\n" +
                "('"+dto.getNo()+"','"+dto.getTitle()+"',?,'"+dto.getAttach()+"','"+dto.getReg_id()+"', CURRENT_DATE)";

        return util.runQuery(query, debugMethod, dto.getContent());
    }

    // 상세보기
    public ReviewDTO getReviewView(String no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        ReviewDTO dto = null;

        String query = "SELECT a.no, a.title, a.content, b.kor_name, a.reg_id, \n" +
                "to_char(a.reg_date, 'yyyy-MM-dd') AS reg_date, a.attach, a.hit\n" +
                "FROM jebi_review a, jebi_member b\n" +
                "where a.reg_id = b.id\n" +
                "and a.no = '"+no+"'";

        util.runQuery(query, debugMethod, 0);

        try {
            if(util.getRs().next()) {
                String nno = util.getRs().getString("no");
                String title = util.getRs().getString("title");
                String content = util.getRs().getString("content");
                String attach = util.getRs().getString("attach");
                String kor_name = util.getRs().getString("kor_name");
                String reg_id = util.getRs().getString("reg_id");
                String reg_date = util.getRs().getString("reg_date");
                int hit = util.getRs().getInt("hit");

                dto = new ReviewDTO(nno, title, content, attach, kor_name, reg_id, reg_date,  hit);
            }
        } catch(SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return dto;
    }
    // 리뷰 수정
    public int updateReview(ReviewDTO dto) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "UPDATE jebi_review\n" +
                "SET title = '"+dto.getTitle()+"', content = ?,  \n" +
                "attach = '"+dto.getAttach()+"', reg_date = CURRENT_DATE  \n" +
                "WHERE no = '"+dto.getNo()+"' ";

        return util.runQuery(query, debugMethod, dto.getContent());
    }

    // 리뷰 삭제
    public int deleteReview(String no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "DELETE FROM jebi_review WHERE no = '"+no+"'";

        return util.runQuery(query, debugMethod, 1);
    }
    // 이전글 조회
    public String[] getPrevReview(String no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String[] prevReview = new String[2];

        String query = "SELECT a.maxno, b.title FROM \n" +
                "(\n" +
                "    SELECT MAX(no) maxno \n" +
                "    FROM jebi_review \n" +
                "    WHERE no < '"+no+"' \n" +
                ") a, jebi_review b WHERE a.maxno = b.no";
        util.runQuery(query, debugMethod, 0);
        try {
            if(util.getRs().next()) {
                prevReview[0] = util.getRs().getString("maxno");
                prevReview[1] = util.getRs().getString("title");
            }
        } catch(SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return prevReview;
    }

    // 다음글 조회
    public String[] getNextReview(String no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String[] nextReview = new String[2];

        String query = "SELECT a.minno, b.title FROM\n" +
                "(\n" +
                "    SELECT MIN(no) minno \n" +
                "    FROM jebi_review\n" +
                "    WHERE no > '"+no+"' \n" +
                ") a, jebi_review b WHERE a.minno = b.no";
        util.runQuery(query, debugMethod, 0);

        try {
            if(util.getRs().next()) {
                nextReview[0] = util.getRs().getString("minno");
                nextReview[1] = util.getRs().getString("title");
            }
        } catch(SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return nextReview;
    }

    // 조회수 증가
    public int hitReview(String no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "UPDATE jebi_review SET hit = hit + 1 WHERE no = '"+no+"'";

        return util.runQuery(query, debugMethod, 1);
    }
}
