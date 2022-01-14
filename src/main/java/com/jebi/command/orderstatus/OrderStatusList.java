package com.jebi.command.orderstatus;

import com.jebi.common.Command;
import com.jebi.dao.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class OrderStatusList implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        MemberDAO dao = new MemberDAO();

        HttpSession session = request.getSession();
        String id = (String)session.getAttribute("session_id");

        request.setAttribute("dto", dao.getMyList(id));
    }
}
