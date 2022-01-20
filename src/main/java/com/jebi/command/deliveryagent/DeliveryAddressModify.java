package com.jebi.command.deliveryagent;

import com.jebi.common.Command;
import com.jebi.dao.OrderStatusDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeliveryAddressModify implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String no = request.getParameter("cons_no");

        OrderStatusDAO dao = new OrderStatusDAO();
        request.setAttribute("dto", dao.getAddrView(no));
    }
}
