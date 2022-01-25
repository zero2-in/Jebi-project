package com.jebi.command.mailbox;

import com.jebi.dao.MailboxDAO;
import com.jebi.dao.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class MailboxDelete {
    public void execute(List<String> list, HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        MailboxDAO dao = new MailboxDAO();
        MemberDAO memberDAO = new MemberDAO();

        for(int i=0; i<list.size(); i++) {
            dao.deleteMailbox((String)session.getAttribute("session_id"), list.get(i));
        }
        session.setAttribute("session_mail", memberDAO.getMailSession((String)session.getAttribute("session_id")));
    }
}
