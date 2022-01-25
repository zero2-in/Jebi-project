package com.jebi.command.mailbox;

import com.jebi.common.Command;
import com.jebi.dao.MailboxDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MailboxView implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String no = request.getParameter("mailNo");
        MailboxDAO dao = new MailboxDAO();
        dao.setReaddate(no);
        request.setAttribute("dto", dao.getMailView(no));
    }
}
