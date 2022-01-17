package com.jebi.command.review;

import com.jebi.common.Command;
import com.jebi.dao.EventDAO;
import com.jebi.dao.ReviewDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ReviewModify implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ReviewDAO dao = new ReviewDAO();
        String no = request.getParameter("no");

        request.setAttribute("dto", dao.getReviewView(no));
    }
}
