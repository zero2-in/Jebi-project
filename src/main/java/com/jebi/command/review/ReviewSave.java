package com.jebi.command.review;

import com.jebi.common.CommonUtil;
import com.jebi.common.MultipartCommand;
import com.jebi.dao.ReviewDAO;
import com.jebi.dto.ReviewDTO;
import com.oreilly.servlet.MultipartRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

public class ReviewSave implements MultipartCommand {
    @Override
    public void execute(MultipartRequest mpr, HttpServletRequest request, HttpServletResponse response) throws IOException {
        ReviewDAO dao = new ReviewDAO();

        String no = dao.getMaxNo();
        String title = mpr.getParameter("t_title");
        String content = mpr.getParameter("t_content");
        String attach = mpr.getFilesystemName("t_attach");
        String reg_date = mpr.getParameter("t_reg_date");
        HttpSession session = request.getSession();
        String reg_id = (String)session.getAttribute("session_id");

        if(attach != null) {
            File file = new File(CommonUtil.getFile_dir("review"), attach);
            file.renameTo(new File(CommonUtil.getFile_dir("review"), no+"_"+attach));
        } else {
            attach = "";
        }

        int result = 0;
        if(session.getAttribute("session_level").equals("top")) {
            ReviewDTO dto = new ReviewDTO(no, title, content, attach, reg_id, reg_date);
            result = dao.insertReview(dto);
        }

        String msg = result==1? "게시글이 등록되었습니다." : "게시글 등록에 실패했습니다";
        request.setAttribute("msg", msg);
        request.setAttribute("url", "Review");
    }
}
