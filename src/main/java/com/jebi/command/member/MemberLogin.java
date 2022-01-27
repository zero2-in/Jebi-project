package com.jebi.command.member;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jebi.common.Command;
import com.jebi.dao.MemberDAO;

public class MemberLogin implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        MemberDAO dao = new MemberDAO();

        String id = request.getParameter("id");
        String password = request.getParameter("password");

        try {
            password = dao.encryptSHA256(password);
        } catch(NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        String name = dao.getLogin(id, password);
        String msg = "";
        String url = "";
        String separate = "";
        if(!name.equals("")) {
            HttpSession session = request.getSession();
            session.setAttribute("session_name", name);
            session.setAttribute("session_id", id);
            session.setAttribute("session_mail", dao.getMailSession(id));
            if(dao.checkAdmin(id)) {
                session.setAttribute("session_level", "top");
            } else {
                session.setAttribute("session_level", "");
            }
            session.setMaxInactiveInterval(60 * 60 * 6);

            boolean isTempLogin = dao.testLogin(id).equals("Y");
            msg = name + "님 로그인되었습니다.";
            if(isTempLogin) {
                url = "Myinfo";
            }
            else {
                url = "OrderStatus";
            }
        } 
        else {
            msg = "로그인 정보가 없습니다. 아이디와 비밀번호를 확인해주세요.";
            url = "Member";
            separate = "login";
        }

        request.setAttribute("msg", msg);
        request.setAttribute("url", url);
        request.setAttribute("separate", separate);
    }
}
