package com.jebi.command.qna;

import com.jebi.common.Command;
import com.jebi.common.CommonUtil;
import com.jebi.dao.QnaDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

public class QnaDelete implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        QnaDAO dao = new QnaDAO();
        HttpSession session = request.getSession();
        String no = request.getParameter("no");
        String attach = request.getParameter("attach");
        String reg_id = dao.getQnaRegId(no);

        int result = 0;
        if(session.getAttribute("session_id").equals(reg_id) || session.getAttribute("session_level").equals("top")) {
            result = dao.deleteQna(no);

            if(result == 1) {
                dao.deleteQnaReplyAll(no);
            }
            if(attach != null && result==1) {
                System.out.println("들어옴");
                File file = new File(CommonUtil.getFile_dir("qna"), no+"_"+attach);
                file.delete();
            }
        }
        String msg = result==1? "게시글이 삭제되었습니다." : "게시글 삭제에 실패했습니다.";

        request.setAttribute("msg", msg);
        request.setAttribute("url", "Qna");
    }
}
