package com.jebi.controller;

import com.jebi.command.admin.OrderStatusRequest;
import com.jebi.common.Command;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class AdminController {
    @RequestMapping(value = "Zeus")
    public String systemManagement(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String separate = request.getParameter("separate");
        if(separate == null || separate.equals("")) separate = "req";
        String pageLink = "";

        switch (separate) {
            // 대행신청 보기
            case "req" : {
                Command req = new OrderStatusRequest();
                req.execute(request, response);
                pageLink = "admin/order_status";
                break;
            }
            // 회원관리
            case "member" : {
                pageLink = "admin/member_manage";
                break;
            }
        }

        return pageLink;
    }
}
