package com.jebi.command.notice;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jebi.common.Command;
import com.jebi.dao.NoticeDAO;

public class NoticeList implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");

        NoticeDAO dao = new NoticeDAO();

        request.setAttribute("list", dao.getNoticeList());
    }
}
