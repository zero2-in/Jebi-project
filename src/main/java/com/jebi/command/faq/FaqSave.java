package com.jebi.command.faq;

import com.jebi.common.Command;
import com.jebi.dao.FaqDAO;
import com.jebi.dto.FaqDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class FaqSave implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");

        int result = 0;

        FaqDAO dao = new FaqDAO();
        String no = dao.getMaxNo();
        String category_code = request.getParameter("t_category");
        String title = request.getParameter("t_title");
        String content = request.getParameter("t_content");
        HttpSession session = request.getSession();
        String reg_id = (String)session.getAttribute("session_id");

        if(session.getAttribute("session_level").equals("top")) {
            result = dao.insertFaq(new FaqDTO(no, title, content, category_code, reg_id));
        }

        String msg = result==1? "게시글을 등록했습니다." : "게시글 등록에 실패했습니다!";

        request.setAttribute("msg", msg);
        request.setAttribute("url", "Faq");
        request.setAttribute("separate", "view");
        request.setAttribute("no", no);
    }
}
