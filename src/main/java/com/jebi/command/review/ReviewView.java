package com.jebi.command.review;

import com.jebi.common.Command;
import com.jebi.dao.ReviewDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ReviewView implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ReviewDAO dao = new ReviewDAO();
        String no = request.getParameter("no");

        dao.hitReview(no);

        request.setAttribute("dto", dao.getReviewView(no));
        request.setAttribute("prevNo", dao.getPrevReview(no)[0]);
        request.setAttribute("prevTitle", dao.getPrevReview(no)[1]);
        request.setAttribute("nextNo", dao.getNextReview(no)[0]);
        request.setAttribute("nextTitle", dao.getNextReview(no)[1]);

    }
}
