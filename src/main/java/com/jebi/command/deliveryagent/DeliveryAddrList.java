package com.jebi.command.deliveryagent;

import com.jebi.common.Command;
import com.jebi.dao.OrderStatusDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class DeliveryAddrList implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        OrderStatusDAO dao = new OrderStatusDAO();

        HttpSession session = request.getSession();

        request.setAttribute("addr_list", dao.getAddressList((String)session.getAttribute("session_id")));
    }
}
