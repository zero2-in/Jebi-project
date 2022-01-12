package com.jebi.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShippingController {
    @RequestMapping("Shipping")
    public String shipping(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String separate = request.getParameter("separate");
        String pageLink = "";

        if(separate == null || separate == "") separate = "shipping_list";

        switch(separate) {
            // 배송비 (해운)
            case "shipping_list" : {
                pageLink = "cost_guide/shipping_list";
                break;
            }
            // 배송비 (항공)
            case "airlines_list" : {
                pageLink = "cost_guide/airlines_list";
                break;
            }
            // 부가서비스 페이지
            case "add_ons_list" : {
                pageLink = "cost_guide/add_ons_list";
                break;
            }
            // 구매대행수수료 페이지
            case "purchasing_agency_fee_list" : {
                pageLink = "cost_guide/purchasing_agency_fee_list";
                break;
            }
        }
        return pageLink;
    }
}


