package com.jebi.command.myinfo;

import com.jebi.common.Command;
import com.jebi.dao.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;

public class MyinfoPassChange implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String originPassword = request.getParameter("PRE_MEM_PW");
        String newPassword = request.getParameter("MEM_PW");

        PrintWriter out = response.getWriter();

        MemberDAO dao = new MemberDAO();
        HttpSession session = request.getSession();
        try {
            originPassword = dao.encryptSHA256(originPassword);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        String id = (String)session.getAttribute("session_id");

        if(dao.testLogin(id, originPassword)) {
            try {
                newPassword = dao.encryptSHA256(newPassword);
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
                System.out.println("심각: 비밀번호 변경에서 암호화에 실패했습니다!");
            }

            int result = dao.changePassword(id, newPassword);

            if(result == 1) out.print("success");
            else out.print("failed");
        }
        else {
            out.print("notequal");
        }
    }
}
