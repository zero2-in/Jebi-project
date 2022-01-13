package com.jebi.command.event;

import com.jebi.common.CommonUtil;
import com.jebi.common.MultipartCommand;
import com.jebi.dao.EventDAO;
import com.jebi.dto.EventDTO;
import com.oreilly.servlet.MultipartRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

public class EventUpdate implements MultipartCommand {
    @Override
    public void execute(MultipartRequest mpr, HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");

        EventDAO dao = new EventDAO();

        String no = mpr.getParameter("t_no");
        String title = mpr.getParameter("t_title");
        String sub_title= mpr.getParameter("t_sub_title");
        String content = mpr.getParameter("t_content");
        String attach = mpr.getFilesystemName("t_attach");
        String start_date = mpr.getParameter("t_start_date");
        String end_date = mpr.getParameter("t_end_date");
        String deleteAttach = mpr.getParameter("t_deleteAttach");
        String preAttach = mpr.getParameter("t_preAttach");

        String file_dir = CommonUtil.getFile_dir("event");

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
            File file = new File(CommonUtil.getFile_dir("event"), attach);
            file.renameTo(new File(CommonUtil.getFile_dir("event"), no+"_"+attach));
        } else {
            attach = "";
        }

        int result = 0;

        if(session.getAttribute("session_level").equals("top")) {
            result = dao.updateEvent(new EventDTO(no, title, sub_title, content, dbattach, start_date, end_date));
        }
        String msg = result==1? "게시글이 수정되었습니다." : "수정에 실패했습니다.";

        request.setAttribute("msg", msg);
        request.setAttribute("url", "Event");
        request.setAttribute("separate", "view");
        request.setAttribute("no", no);
    }
}
