package com.jebi.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jebi.command.member.CheckId;
import com.jebi.command.member.MemberJoin;
import com.jebi.common.Command;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
    @RequestMapping("Member")
    public String member(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String separate = request.getParameter("separate");
        String pageLink = "";

        if(separate == null || separate == "") separate = "login";

        switch(separate) {
            // 로그인 페이지
            case "login" : {
                pageLink = "member/login";
                break;
            }
            // 회원가입 페이지
            case "join" : {
                pageLink = "member/join";
                break;
            }
            // 가입
            case "register" : {
                Command register = new MemberJoin();
                register.execute(request, response);
                pageLink = "common_alert_page";
                break;
            }
        } 

        return pageLink;
    }

    // 아이디 (중복) 검사
    @RequestMapping("Checkid")
    public void checkId(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Command checkid = new CheckId();
        checkid.execute(request, response);
    }
}
