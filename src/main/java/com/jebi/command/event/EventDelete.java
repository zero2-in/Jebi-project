package com.jebi.command.event;

import com.jebi.common.Command;
import com.jebi.common.CommonUtil;
import com.jebi.dao.EventDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

public class EventDelete implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String no = request.getParameter("no");
        String attach = request.getParameter("attach");

        int result = 0;
        HttpSession session = request.getSession();
        if(session.getAttribute("session_level").equals("top")) {
            EventDAO dao = new EventDAO();
            result = dao.deleteEvent(no);

            if(attach != null && result==1) {
                File file = new File(CommonUtil.getFile_dir("event"), no+"_"+attach);
                file.delete();
            }
        }
        String msg = result==1? "게시글이 삭제되었습니다." : "게시글 삭제에 실패했습니다.";

        request.setAttribute("msg", msg);
        request.setAttribute("url", "Event");
    }
}
