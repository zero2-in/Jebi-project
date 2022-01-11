package com.jebi.command.notice;

import com.jebi.common.Command;
import com.jebi.dao.NoticeDAO;
import com.jebi.dto.NoticeDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class NoticeUpdate implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");

        NoticeDAO dao = new NoticeDAO();

        String no = request.getParameter("t_no");
        String title = request.getParameter("t_title");
        String content = request.getParameter("t_content");
        String important = request.getParameter("t_important");

        if(important.equals("1")) important = "Y";
        else if(important.equals("2")) important = "X";
        else important = "N";

        HttpSession session = request.getSession();
        String reg_id = (String)session.getAttribute("session_id");

        int result = 0;

        if(session.getAttribute("session_level").equals("top")) {
            result = dao.updateNotice(new NoticeDTO(no, title, content, important, reg_id));
        }
        String msg = result==1? "게시글이 수정되었습니다." : "수정에 실패했습니다.";

        request.setAttribute("msg", msg);
        request.setAttribute("url", "Notice");
        request.setAttribute("separate", "view");
        request.setAttribute("no", no);
    }
}
