package com.jebi.command.event;

import com.jebi.common.Command;
import com.jebi.dao.EventDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EventView implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        EventDAO dao = new EventDAO();
        String no = request.getParameter("no");

        request.setAttribute("dto", dao.getEventView(no));
    }
}
