package com.jebi.command.faq;

import com.jebi.common.Command;
import com.jebi.dao.FaqDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FaqView implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        FaqDAO dao = new FaqDAO();
        String no = request.getParameter("no");

        dao.hitFaq(no);

        request.setAttribute("dto", dao.getFaqView(no));
        request.setAttribute("prevNo", dao.getPrevFaq(no)[0]);
        request.setAttribute("prevTitle", dao.getPrevFaq(no)[1]);
        request.setAttribute("nextNo", dao.getNextFaq(no)[0]);
        request.setAttribute("nextTitle", dao.getNextFaq(no)[1]);
    }
}
