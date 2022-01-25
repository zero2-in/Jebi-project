package com.jebi.command.deposithistory;

import com.jebi.common.Command;
import com.jebi.dao.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class DepositRet implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        MemberDAO memberDAO = new MemberDAO();

        HttpSession session = request.getSession();
        request.setAttribute("dto", memberDAO.getMyList((String)session.getAttribute("session_id")));
    }
}
