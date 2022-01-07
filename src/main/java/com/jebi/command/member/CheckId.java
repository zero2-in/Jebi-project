package com.jebi.command.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jebi.common.Command;
import com.jebi.dao.MemberDAO;

public class CheckId implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        MemberDAO dao = new MemberDAO();
        String id = request.getParameter("id");
        
        PrintWriter out = response.getWriter();
        if(dao.checkId(id)) {
            out.print("valid");
        } 
        else {
            out.print("unvalid");
        }
    }
}
