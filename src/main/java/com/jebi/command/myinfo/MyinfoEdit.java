package com.jebi.command.myinfo;

import com.jebi.common.Command;
import com.jebi.dao.MemberDAO;
import com.jebi.dto.MemberDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class MyinfoEdit implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");

        String eng_name = request.getParameter("t_eng_name");
        String email = request.getParameter("t_email");
        String sms_rcv_yn = request.getParameter("sms_rcv_yn");
        if(sms_rcv_yn == null) sms_rcv_yn = "N";
        String email_rcv_yn = request.getParameter("email_rcv_yn");
        if(email_rcv_yn == null) email_rcv_yn = "N";
        String mobile = request.getParameter("t_mobile");
        if(mobile == null || mobile.equals("")) mobile = "required";

        HttpSession session = request.getSession();

        MemberDAO dao = new MemberDAO();
        int result = dao.changeMyinfo(new MemberDTO((String)session.getAttribute("session_id"), eng_name, mobile, email, sms_rcv_yn, email_rcv_yn));

        String msg = result==1? "회원정보가 수정되었습니다." : "회원정보 수정에 실패했습니다.";

        request.setAttribute("msg", msg);
        request.setAttribute("url", "Myinfo");
    }
}
