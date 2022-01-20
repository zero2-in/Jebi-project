package com.jebi.command.orderstatus;

import com.jebi.common.Command;
import com.jebi.dao.OrderStatusDAO;
import com.jebi.dto.OrderReplyDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class OrderReplyInsert implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        String reply_content = request.getParameter("reply_content");
        String table_no = request.getParameter("table_no");
        HttpSession session = request.getSession();
        String reg_id = (String)session.getAttribute("session_id");

        OrderStatusDAO dao = new OrderStatusDAO();

        int result = dao.insertOrderReply(new OrderReplyDTO(reply_content, reg_id, table_no));

        if(result == 1) out.print("success");
        else out.print("failed");
    }
}
