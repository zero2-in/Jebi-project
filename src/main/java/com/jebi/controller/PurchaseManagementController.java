package com.jebi.controller;

import com.jebi.command.purchasemanage.PaymentList;
import com.jebi.command.purchasemanage.PurchaseList;
import com.jebi.common.Command;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class PurchaseManagementController {
    @RequestMapping(value = "PurchaseManagement")
    public String purchaseManagement(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String separate = request.getParameter("separate");
        if(separate == null || separate.equals("")) separate = "purchase";
        String pageLink = "";

        switch(separate) {
            case "purchase" : {
                Command purchaseList = new PurchaseList();
                purchaseList.execute(request, response);
                pageLink = "mypage/purchase_manage";
                break;
            }
            case "list" : {
                Command paymentList = new PaymentList();
                paymentList.execute(request, response);
                pageLink = "mypage/payment_list";
                break;
            }
        }

        return pageLink;
    }
}
