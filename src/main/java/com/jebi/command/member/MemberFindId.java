package com.jebi.command.member;

import com.jebi.common.Command;
import com.jebi.dao.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MemberFindId implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        String kor_name = request.getParameter("kor_name");
        String mobile = request.getParameter("mobile");

        MemberDAO dao = new MemberDAO();

    }
}
