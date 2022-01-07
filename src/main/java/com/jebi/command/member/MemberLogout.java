package com.jebi.command.member;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jebi.common.Command;

public class MemberLogout implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        String name = (String)session.getAttribute("session_name");

        session.invalidate();
        request.setAttribute("msg", name+"님 로그아웃 되셨습니다.");
        request.setAttribute("url", "/jebi");
    }
}
