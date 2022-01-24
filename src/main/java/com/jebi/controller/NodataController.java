package com.jebi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class NodataController {
    @RequestMapping("Nodata")
    public String nodata(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String separate = request.getParameter("separate");
        if (separate == null || separate.equals("")) separate = "list";
        String pageLink = "";

        switch (separate) {
            // 노데이터 리스트
            case "list": {
                pageLink = "nodata/nodata_list";
                break;
            }
        }
        return pageLink;
    }

}
