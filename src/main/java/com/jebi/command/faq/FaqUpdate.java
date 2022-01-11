package com.jebi.command.faq;

import com.jebi.common.Command;
import com.jebi.dao.FaqDAO;
import com.jebi.dto.FaqDTO;
import com.jebi.dto.NoticeDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class FaqUpdate implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");

        FaqDAO dao = new FaqDAO();

        String no = request.getParameter("t_no");
        String title = request.getParameter("t_title");
        String content = request.getParameter("t_content");
        String category_code = request.getParameter("t_category");

        HttpSession session = request.getSession();
        String reg_id = (String)session.getAttribute("session_id");

        int result = 0;

        if(session.getAttribute("session_level").equals("top")) {
            result = dao.updateFaq(new FaqDTO(no, title, content, category_code, reg_id));
        }
        String msg = result==1? "게시글이 수정되었습니다." : "수정에 실패했습니다.";

        request.setAttribute("msg", msg);
        request.setAttribute("url", "Faq");
        request.setAttribute("separate", "view");
        request.setAttribute("no", no);
    }
}
