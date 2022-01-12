package com.jebi.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
    @RequestMapping(value="/")
    public String index(HttpServletRequest request, HttpServletResponse response) throws IOException {
        return "index";


    }
    // 출항스케줄 팝업창
    @RequestMapping("DepartureSchedule")
    public String DepartureSchedule() {
        return "departure_schedule";
    }


}
