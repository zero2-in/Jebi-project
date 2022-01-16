package com.jebi.controller;

import com.jebi.command.purchaseagent.PurchaseWrite;
import com.jebi.common.Command;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class PurchaseAgentController {
    @RequestMapping(value = "PurchaseAgent")
    public String purchaseAgent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String separate = request.getParameter("separate");
        if(separate == null || separate.equals("")) separate = "page";
        String pageLink = "";

        switch (separate) {
            case "page" : {
                pageLink = "company_agent/purchase_agent";
                break;
            }
            case "write" : {
                Command write = new PurchaseWrite();
                write.execute(request, response);
                pageLink = "company_agent/purchase_write";
                break;
            }
        }

        return pageLink;
    }
}
