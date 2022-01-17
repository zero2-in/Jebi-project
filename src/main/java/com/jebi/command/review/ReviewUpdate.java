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

public class ReviewUpdate implements MultipartCommand {
    @Override
    public void execute(MultipartRequest mpr, HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");

        ReviewDAO dao = new ReviewDAO();

        String no = mpr.getParameter("t_no");
        String title = mpr.getParameter("t_title");
        String content = mpr.getParameter("t_content");
        String attach = mpr.getFilesystemName("t_attach");
        String reg_id = mpr.getParameter("t_reg_id");
        String reg_date = mpr.getParameter("t_reg_date");
        String deleteAttach = mpr.getParameter("t_deleteAttach");
        String preAttach = mpr.getParameter("t_preAttach");

        String file_dir = CommonUtil.getFile_dir("review");

        if(preAttach == null) preAttach = "";
        String dbattach = preAttach;

        if(deleteAttach != null) {
            File file = new File(file_dir, no+"_"+deleteAttach);
            file.delete();
            dbattach = "";
        }
        if(attach != null) {
            if(!preAttach.equals("")) {
                File file = new File(file_dir, no+"_"+preAttach);
                file.delete();
            }
            File file = new File(file_dir, attach);
            file.renameTo(new File(file_dir, no+"_"+attach));
            dbattach = attach;
        }

        HttpSession session = request.getSession();

        if(attach != null) {
            File file = new File(CommonUtil.getFile_dir("review"), attach);
            file.renameTo(new File(CommonUtil.getFile_dir("review"), no+"_"+attach));
        } else {
            attach = "";
        }

        int result = 0;

        if(session.getAttribute("session_level").equals("top")) {
            result = dao.updateReview(new ReviewDTO(no, title, content, dbattach, reg_id, reg_date));
        }
        String msg = result==1? "게시글이 수정되었습니다." : "수정에 실패했습니다.";

        request.setAttribute("msg", msg);
        request.setAttribute("url", "Review");
    }
}
