package com.jebi.controller;

import com.jebi.command.myinfo.MyinfoEdit;
import com.jebi.command.myinfo.MyinfoPassChange;
import com.jebi.command.myinfo.MyinfoView;
import com.jebi.common.Command;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class MyInfoController {
    @RequestMapping(value = "Myinfo")
    public String myInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String separate = request.getParameter("separate");
        if(separate == null || separate.equals("")) separate = "view";
        String pageLink = "";

        switch(separate) {
            case "view" : {
                Command view = new MyinfoView();
                view.execute(request, response);
                pageLink = "mypage/myinfo";
                break;
            }
            // 회원정보 수정버튼 클릭시
            case "edit" : {
                Command edit = new MyinfoEdit();
                edit.execute(request, response);
                pageLink = "common_alert_page";
                break;
            }
        }

        return pageLink;
    }

    @RequestMapping(value = "PasswordChanger")
    public String changePassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
        return "mypage/change_password";
    }

    @RequestMapping(value = "DoPasswordChange")
    public void doPasswordChange(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Command change = new MyinfoPassChange();
        change.execute(request, response);
    }
}
