package com.jebi.command.member;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jebi.common.Command;
import com.jebi.dao.MemberDAO;
import com.jebi.dto.NaverDTO;

public class NaverLogin implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String nid = "naver_"+request.getParameter("n_id");
        String nemail = request.getParameter("n_email");
        String nphone = request.getParameter("n_mobile");
        nphone = nphone.replace("-", "");
        String nname = request.getParameter("n_name");

        NaverDTO dto = new NaverDTO(nid, nemail, nphone, nname);
        MemberDAO dao = new MemberDAO();

        String msg = "";
        String url = "";
        if(dao.checkEmail(nid, nemail)) {
            msg = "이미 가입되어 있는 이메일입니다.";
            url = "Member";
        } else {
            dao.checkNaver(dto);
            HttpSession session = request.getSession();

            session.setAttribute("session_name", nname);
            session.setAttribute("session_id", nid);
            session.setAttribute("session_level", "");
            session.setMaxInactiveInterval(60 * 60 * 6);

            msg = nname+"님 로그인되었습니다";
            url = "/jebi";  //TODO 나중에 마이페이지로 바로 연결
        }

        request.setAttribute("msg", msg);
        request.setAttribute("url", url);
    }
}
