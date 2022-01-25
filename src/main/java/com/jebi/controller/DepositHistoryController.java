package com.jebi.controller;

import com.jebi.command.deposithistory.DepositRequest;
import com.jebi.command.deposithistory.DepositRet;
import com.jebi.command.deposithistory.DepositUse;
import com.jebi.common.Command;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class DepositHistoryController {
    @RequestMapping(value = "DepositHistory")
    public String depositHistory(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String separate = request.getParameter("separate");
        if(separate == null || separate.equals("")) separate = "req";
        String pageLink = "";

        switch (separate) {
            case "req" : {
                Command req = new DepositRequest();
                req.execute(request, response);
                pageLink = "mypage/deposit_history";
                break;
            }
            case "use" : {
                Command use = new DepositUse();
                use.execute(request, response);
                pageLink = "mypage/deposit_history_use";
                break;
            }
            case "ret" : {
                Command ret = new DepositRet();
                ret.execute(request, response);
                pageLink = "mypage/deposit_history_ret";
                break;
            }
        }

        return pageLink;
    }
}
