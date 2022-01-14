package com.jebi.controller;

import com.jebi.command.orderstatus.*;
import com.jebi.common.Command;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class OrderStatusController {
    @RequestMapping("OrderStatus")
    public String orderStatus(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String separate = request.getParameter("separate");
        if(separate == null || separate.equals("")) separate = "list";
        String pageLink = "";

        switch (separate) {
            // 리스트
            case "list" : {
                Command list = new OrderStatusList();
                list.execute(request, response);
                pageLink = "mypage/order_status";
                break;
            }
            // 보기
            case "view" : {
                Command view = new OrderStatusView();
                view.execute(request, response);
                pageLink = "mypage/order_status_view";
                break;
            }
        }

        return pageLink;
    }
}
