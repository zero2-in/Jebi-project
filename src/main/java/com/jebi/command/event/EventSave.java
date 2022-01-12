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

public class EventSave implements MultipartCommand {
    @Override
    public void execute(MultipartRequest mpr, HttpServletRequest request, HttpServletResponse response) throws IOException {
        EventDAO dao = new EventDAO();

        String no = dao.getMaxNo();
        String title = mpr.getParameter("t_title");
        String sub_title= mpr.getParameter("t_sub_title");
        String content = mpr.getParameter("t_content");
        String attach = mpr.getFilesystemName("t_attach");
        String start_date = mpr.getParameter("t_start_date");
        String end_date = mpr.getParameter("t_end_date");
        HttpSession session = request.getSession();
        String reg_id = (String)session.getAttribute("session_id");

        if(attach != null) {
            File file = new File(CommonUtil.getFile_dir("event"), attach);
            file.renameTo(new File(CommonUtil.getFile_dir("event"), no+"_"+attach));
        } else {
            attach = "";
        }

        int result = 0;
        if(session.getAttribute("session_id") != null) {
            EventDTO dto = new EventDTO(no, title, sub_title, content, attach, start_date, end_date);
            result = dao.insertEvent(dto);
        }

        String msg = result==1? "게시글이 등록되었습니다." : "게시글 등록에 실패했습니다";
        request.setAttribute("msg", msg);
        request.setAttribute("url", "Event");
    }
}
