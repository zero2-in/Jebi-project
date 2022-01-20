package com.jebi.controller;

import com.jebi.command.deliveryagent.*;
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
            // 신청
            case "request" : {
                Command req = new DeliveryDoRequest();
                req.execute(request, response);
                pageLink = "common_alert_page";
                break;
            }
        }

        return pageLink;
    }

    // 주소지 리스트
    @RequestMapping(value = "MemAddrPop_L")
    public String memAddrPopL(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Command list = new DeliveryAddrList();
        list.execute(request, response);
        return "company_agent/member_add_pop_list";
    }

    // 주소지 등록
    @RequestMapping(value = "MemAddrPop_W")
    public String memAddrPopW(HttpServletRequest request, HttpServletResponse response) throws IOException {
        return "company_agent/member_add_pop_write";
    }

    // 주소지 수정
    @RequestMapping(value = "MemAddrPop_E")
    public String memAddrPopE(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Command modify = new DeliveryAddressModify();
        modify.execute(request, response);
        return "company_agent/member_add_pop_modify";
    }

    // 주소지 삭제
    @RequestMapping(value = "MemAddrPop_D")
    public void memAddrPopD(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Command delete = new DeliveryAddrDelete();
        delete.execute(request, response);
    }

    // 주소지 등록
    @RequestMapping(value = "AddAddress")
    public void addAddress(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Command add = new DeliveryAddressAdd();
        add.execute(request, response);
    }

    // 주소지 업데이트
    @RequestMapping(value = "UpdateAddress")
    public void updateAddress(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Command update = new DeliveryAddressUpdate();
        update.execute(request, response);
    }

    // 재고상품리스트
    @RequestMapping(value = "StockProPop_S")
    public String stockProPopS(HttpServletRequest request, HttpServletResponse response) throws IOException {
        return "company_agent/stock_items_list";
    }
}