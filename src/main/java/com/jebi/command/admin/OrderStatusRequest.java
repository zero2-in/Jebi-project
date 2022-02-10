package com.jebi.command.admin;

import com.jebi.common.Command;
import com.jebi.dao.OrderStatusDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class OrderStatusRequest implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        OrderStatusDAO dao = new OrderStatusDAO();
        request.setAttribute("agent_list", dao.getAgentList());
        request.setAttribute("status_list", dao.getOrderStatusList());
    }
}
