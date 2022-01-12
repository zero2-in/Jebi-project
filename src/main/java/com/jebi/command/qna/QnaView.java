package com.jebi.command.qna;

import com.jebi.common.Command;
import com.jebi.dao.QnaDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class QnaView implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String no = request.getParameter("no");

        QnaDAO dao = new QnaDAO();

        request.setAttribute("dto", dao.getQnaView(no));
        request.setAttribute("reply_list", dao.getReplyList(no));
    }
}
