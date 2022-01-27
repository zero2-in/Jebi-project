package com.jebi.controller;

import com.jebi.command.pointhistory.PointHistory;
import com.jebi.common.Command;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class PointHistoryController {
    @RequestMapping(value = "PointHistory")
    public String pointHistory(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String separate = request.getParameter("separate");
        if(separate == null || separate.equals("")) separate = "list";
        String pageLink = "";

        switch (separate) {
            case "list" : {
                Command list = new PointHistory();
                list.execute(request, response);
                pageLink = "mypage/point_history";
                break;
            }
        }

        return pageLink;
    }
}
