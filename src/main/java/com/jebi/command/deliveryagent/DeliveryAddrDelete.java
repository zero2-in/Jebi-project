package com.jebi.command.deliveryagent;

import com.jebi.common.Command;
import com.jebi.dao.OrderStatusDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class DeliveryAddrDelete implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String no = request.getParameter("no");

        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();

        OrderStatusDAO dao = new OrderStatusDAO();
        int result = dao.deleteAddress(no, (String)session.getAttribute("session_id"));

        if(result ==1) out.print("success");
        else out.print("failed");
    }
}
