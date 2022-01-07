package com.jebi.command.member;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jebi.common.Command;
import com.jebi.dao.MemberDAO;
import com.jebi.dto.KakaoDTO;

public class KakaoLogin implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String kid = "kakao_"+request.getParameter("k_id");
        String kemail = request.getParameter("k_email");
        String knickname = request.getParameter("k_nickname");

        KakaoDTO dto = new KakaoDTO(kid, knickname, kemail);
        MemberDAO dao = new MemberDAO();

        String msg = "";
        String url = "";
        if(dao.checkEmail(kid, kemail)) {
            msg = "이미 가입되어 있는 이메일입니다.";
            url = "Member";
        } else {
            dao.checkKakao(dto);
            HttpSession session = request.getSession();

            session.setAttribute("session_name", knickname);
            session.setAttribute("session_id", kid);
            session.setAttribute("session_level", "");
            session.setAttribute("session_social", "kakao");
            session.setMaxInactiveInterval(60 * 60 * 6);

            msg = knickname+"님 로그인되었습니다";
            url = "/jebi";  //TODO 나중에 마이페이지로 바로 연결
        }

        request.setAttribute("msg", msg);
        request.setAttribute("url", url);
    }
}
