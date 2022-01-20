package com.jebi.command.orderstatus;

import com.jebi.common.Command;
import com.jebi.dao.MemberDAO;
import com.jebi.dao.OrderStatusDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class OrderStatusList implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        MemberDAO memberDao = new MemberDAO();
        OrderStatusDAO dao = new OrderStatusDAO();

        HttpSession session = request.getSession();
        String id = (String)session.getAttribute("session_id");

        request.setAttribute("dto", memberDao.getMyList(id));
        request.setAttribute("status_list", dao.getStatusListCategory());
        request.setAttribute("agent_list", dao.getAgentList(id));
        request.setAttribute("dao", dao);
    }
}