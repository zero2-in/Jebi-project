package com.jebi.controller;

import com.jebi.command.deliveryagent.DeliveryAddressAdd;
import com.jebi.command.deliveryagent.DeliveryWrite;
import com.jebi.common.Command;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class DeliveryAgentController {
    @RequestMapping(value = "DeliveryAgent")
    public String deliveryAgent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String separate = request.getParameter("separate");
        if(separate == null || separate.equals("")) separate = "page";
        String pageLink = "";

        switch(separate) {
            case "page" : {
                pageLink = "company_agent/delivery_agent";
                break;
            }
            case "write" : {
                Command write = new DeliveryWrite();
                write.execute(request, response);
                pageLink = "company_agent/delivery_write";
                break;
            }
        }

        return pageLink;
    }

    // 주소지 리스트
    @RequestMapping(value = "MemAddrPop_L")
    public String memAddrPopL(HttpServletRequest request, HttpServletResponse response) throws IOException {
        return "company_agent/member_add_pop_list";
    }

    // 주소지 등록
    @RequestMapping(value = "MemAddrPop_W")
    public String memAddrPopW(HttpServletRequest request, HttpServletResponse response) throws IOException {
        return "company_agent/member_add_pop_write";
    }

    @RequestMapping(value = "AddAddress")
    public void addAddress(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Command add = new DeliveryAddressAdd();
        add.execute(request, response);
    }
}
