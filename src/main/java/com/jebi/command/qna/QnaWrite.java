package com.jebi.command.qna;

import com.jebi.common.Command;
import com.jebi.dao.QnaDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class QnaWrite implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        QnaDAO dao = new QnaDAO();

        request.setAttribute("category_list", dao.getCategoryList());
    }
}
