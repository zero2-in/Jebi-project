package com.jebi.command.qna;

import com.jebi.common.Command;
import com.jebi.dao.QnaDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class QnaDeleteReply implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        String no = request.getParameter("no");
        String reg_id = request.getParameter("reg_id");

        QnaDAO dao = new QnaDAO();

        HttpSession session = request.getSession();

        int result = 0;

        if(session.getAttribute("session_id").equals(reg_id) || session.getAttribute("session_level").equals("top")) {
            result = dao.deleteQnaReply(no);
        }

        if(result==1) out.print("success");
        else out.print("failed");
    }
}
