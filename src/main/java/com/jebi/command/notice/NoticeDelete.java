package com.jebi.command.notice;

import com.jebi.common.Command;
import com.jebi.dao.NoticeDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class NoticeDelete implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String no = request.getParameter("no");

        int result = 0;
        HttpSession session = request.getSession();
        if(session.getAttribute("session_level").equals("top")) {
            NoticeDAO dao = new NoticeDAO();
            result = dao.deleteNotice(no);
        }
        String msg = result==1? "게시글이 삭제되었습니다." : "게시글 삭제에 실패했습니다.";

        request.setAttribute("msg", msg);
        request.setAttribute("url", "Notice");
    }
}
