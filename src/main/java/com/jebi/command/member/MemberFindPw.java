package com.jebi.command.member;

import com.jebi.common.Command;
import com.jebi.dao.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class MemberFindPw implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        MemberDAO dao = new MemberDAO();
        String id = request.getParameter("id");
        String mobile = request.getParameter("mobile");
        String kor_name = request.getParameter("kor_name");

        int result = dao.findPw(id, kor_name, mobile);
        PrintWriter out = response.getWriter();

        if(result == 1) out.print("success");
        else out.print("failed");
    }
}
