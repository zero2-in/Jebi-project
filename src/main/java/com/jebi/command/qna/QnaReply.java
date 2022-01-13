package com.jebi.command.qna;

import com.jebi.common.Command;
import com.jebi.dao.QnaDAO;
import com.jebi.dto.QnaReplyDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class QnaReply implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String qna_no = request.getParameter("no");
        String comment_content = request.getParameter("t_comment");

        comment_content = "<p>" + comment_content + "</p>";

        HttpSession session = request.getSession();
        String comment_reg_id = (String)session.getAttribute("session_id");

        PrintWriter out = response.getWriter();

        QnaDAO dao = new QnaDAO();

        int result = 0;

        if(!session.getAttribute("session_name").equals("")) {
            result = dao.insertReply(new QnaReplyDTO(qna_no, comment_content, comment_reg_id));
        }

        if(result==1) out.print("success");
        else out.print("failed");
    }
}
