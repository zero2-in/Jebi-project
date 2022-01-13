package com.jebi.command.qna;

import com.jebi.common.CommonUtil;
import com.jebi.common.MultipartCommand;
import com.jebi.dao.QnaDAO;
import com.jebi.dto.QnaDTO;
import com.oreilly.servlet.MultipartRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

public class QnaSave implements MultipartCommand {
    @Override
    public void execute(MultipartRequest mpr, HttpServletRequest request, HttpServletResponse response) throws IOException {
        QnaDAO dao = new QnaDAO();

        String no = dao.getMaxNo();
        String title = mpr.getParameter("t_title");
        String category = mpr.getParameter("t_category");
        String content = mpr.getParameter("t_content");
        String attach = mpr.getFilesystemName("t_attach");
        String important = mpr.getParameter("t_important");

        if(important == null || important.equals("")) important = "N";

        HttpSession session = request.getSession();
        String reg_id = (String)session.getAttribute("session_id");

        if(attach != null) {
            File file = new File(CommonUtil.getFile_dir("qna"), attach);
            file.renameTo(new File(CommonUtil.getFile_dir("qna"), no+"_"+attach));
        } else {
            attach = "";
        }

        int result = 0;
        if(session.getAttribute("session_id") != null) {
            QnaDTO dto = new QnaDTO(no, category, title, content, important, attach, reg_id);
            result = dao.insertQna(dto);
        }

        String msg = result==1? "게시글이 등록되었습니다." : "게시글 등록에 실패했습니다";
        request.setAttribute("msg", msg);
        request.setAttribute("url", "Qna");
        request.setAttribute("separate", "view");
        request.setAttribute("no", no);
    }
}
