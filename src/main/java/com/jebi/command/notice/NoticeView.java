package com.jebi.command.notice;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jebi.common.Command;
import com.jebi.dao.NoticeDAO;

public class NoticeView implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        NoticeDAO dao = new NoticeDAO();
        String no = request.getParameter("no");
        
        request.setAttribute("dto", dao.getNoticeView(no));
    }
}
