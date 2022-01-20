package com.jebi.command.orderstatus;

import com.jebi.common.Command;
import com.jebi.dao.OrderStatusDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class OrderStatusView implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        OrderStatusDAO dao = new OrderStatusDAO();
        String table_no = request.getParameter("table_no");
        String order_no = request.getParameter("order_no");

        request.setAttribute("dto", dao.getOrderView(table_no, order_no));
        request.setAttribute("dao", dao);
        request.setAttribute("replydatelist", dao.getReplyDate(table_no));
    }
}
