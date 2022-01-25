package com.jebi.command.mailbox;

import com.jebi.common.Command;
import com.jebi.dao.MailboxDAO;
import com.jebi.dao.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class MailboxView implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String no = request.getParameter("mailNo");
        MailboxDAO dao = new MailboxDAO();
        MemberDAO memberDAO = new MemberDAO();
        dao.setReaddate(no);
        request.setAttribute("dto", dao.getMailView(no));
        HttpSession session = request.getSession();

        session.setAttribute("session_mail", memberDAO.getMailSession((String)session.getAttribute("session_id")));
    }
}
