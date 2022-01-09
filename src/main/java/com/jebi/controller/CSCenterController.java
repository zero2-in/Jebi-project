package com.jebi.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CSCenterController {
    @RequestMapping("CSCenter")
    public String csCenter(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String separate = request.getParameter("separate");
        if(separate == null || separate.equals("")) separate = "notice";
        String pageLink = "";

        switch(separate) {
            case "notice" : {
                
                break;
            }
        }

        return pageLink;
    }
}
