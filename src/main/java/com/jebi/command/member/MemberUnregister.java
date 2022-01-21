package com.jebi.command.member;

import com.jebi.common.Command;
import com.jebi.dao.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class MemberUnregister implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        MemberDAO dao = new MemberDAO();
        int result = dao.setUnreg((String)session.getAttribute("session_id"));
        String kor_name = (String)session.getAttribute("session_name");
        session.invalidate();

        String msg = result==1? kor_name+"님 회원탈퇴가 완료되었습니다.\n 안녕히 가십시오." : "회원탈퇴에 실패되었습니다. \n로그아웃 되셨습니다";

        request.setAttribute("msg", msg);
        request.setAttribute("url", "/jebi");
    }
}
