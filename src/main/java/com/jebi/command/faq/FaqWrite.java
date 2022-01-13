package com.jebi.command.faq;

import com.jebi.common.Command;
import com.jebi.dao.FaqDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FaqWrite implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        FaqDAO dao = new FaqDAO();

        request.setAttribute("category_list", dao.getCategoryList());
    }
}
