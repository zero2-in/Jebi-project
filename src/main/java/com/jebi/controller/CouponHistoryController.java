package com.jebi.controller;

import com.jebi.command.couponhistory.CouponHistory;
import com.jebi.command.couponhistory.CouponUsed;
import com.jebi.common.Command;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class CouponHistoryController {
    @RequestMapping(value = "CouponHistory")
    public String couponHistory(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String separate = request.getParameter("separate");
        if(separate == null || separate.equals("")) separate = "list";
        String pageLink = "";

        switch (separate) {
            case "list" : {
                Command list = new CouponHistory();
                list.execute(request, response);
                pageLink = "mypage/coupon_history";
                break;
            }
            case "used" : {
                Command used = new CouponUsed();
                used.execute(request, response);
                pageLink = "mypage/coupon_history_used";
                break;
            }
        }

        return pageLink;
    }
}
