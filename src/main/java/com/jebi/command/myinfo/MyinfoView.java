package com.jebi.command.myinfo;

import com.jebi.common.Command;
import com.jebi.dao.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class MyinfoView implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        MemberDAO dao = new MemberDAO();

        HttpSession session = request.getSession();

        request.setAttribute("dto", dao.getMyList((String)session.getAttribute("session_id")));
    }
}
