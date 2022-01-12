package com.jebi.dao;

import com.jebi.common.CommonUtil;
import com.jebi.dto.EventDTO;
import com.jebi.dto.NoticeDTO;

import java.sql.SQLException;
import java.util.ArrayList;

public class EventDAO {
    CommonUtil util = new CommonUtil();
    ArrayList<EventDTO> list = null;

    public ArrayList<EventDTO> getEventList(String search, int start, int end) {
        list = new ArrayList<>();
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "select * from \n" +
                "(\n" +
                "    select \n" +
                "    no, title, sub_title, attach, start_date, end_date, \n" +
                "    row_number() \n" +
                "    over(order by no desc) as rnum \n" +
                "    from jebi_event\n" +
                "    where title like '%"+search+"%'\n" +
                ") \n" +
                "where rnum>="+start+" and rnum <="+end+"";
        util.runQuery(query, debugMethod, 0);

        try {
            while(util.getRs().next()) {
                String no = util.getRs().getString("no");
                String title = util.getRs().getString("title");
                String sub_title = util.getRs().getString("sub_title");
                String attach = util.getRs().getString("attach");
                String start_date = util.getRs().getString("start_date");
                String end_date = util.getRs().getString("end_date");

                list.add(new EventDTO(no, title, sub_title, attach, start_date, end_date));
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

        String query = "SELECT COUNT(no) cnt FROM jebi_event \r\n" +
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

        String query = "SELECT MAX(no) maxno FROM jebi_event";
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
    public int insertEvent(EventDTO dto) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "INSERT INTO jebi_event \n" +
                "(no, title, sub_title, content, attach, start_date, end_date) \n" +
                "VALUES('"+dto.getNo()+"', '"+dto.getTitle()+"', '"+dto.getSub_title()+"', ?, '"+dto.getAttach()+"','"+dto.getStart_date()+"','"+dto.getEnd_date()+"')";

        return util.runQuery(query, debugMethod, dto.getContent());
    }

    // 상세보기
    public EventDTO getEventView(String no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        EventDTO dto = null;

        String query = "SELECT no, title, sub_title, content, attach, start_date, end_date \n" +
                "FROM jebi_event\n" +
                "WHERE no = '"+no+"'";

        util.runQuery(query, debugMethod, 0);

        try {
            if(util.getRs().next()) {
                String nno = util.getRs().getString("no");
                String title = util.getRs().getString("title");
                String sub_title = util.getRs().getString("sub_title");
                String content = util.getRs().getString("content");
                String attach = util.getRs().getString("attach");
                String start_date = util.getRs().getString("start_date");
                String end_date = util.getRs().getString("end_date");

                dto = new EventDTO(nno, title,sub_title, content, attach, start_date, end_date);
            }
        } catch(SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return dto;
    }
}