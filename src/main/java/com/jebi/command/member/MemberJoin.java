package com.jebi.command.member;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jebi.common.Command;
import com.jebi.dao.MemberDAO;
import com.jebi.dto.MemberDTO;

public class MemberJoin implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        MemberDAO dao = new MemberDAO();

        String id = request.getParameter("id");
        String password = "";
        try {
            password = dao.encryptSHA256(request.getParameter("password"));
        } catch (NoSuchAlgorithmException e) {
            System.out.println("암호화 실패!");
            e.printStackTrace();
        }
        String kor_name = request.getParameter("kor_name");
        String eng_name = request.getParameter("eng_name");
        String phone = request.getParameter("mobile");
        String email = request.getParameter("email");
        String sms_rcv_yn = request.getParameter("SMS_RCV_YN");
        String email_rcv_yn = request.getParameter("EMAIL_RCV_YN");

        if(sms_rcv_yn == null) sms_rcv_yn = "";
        if(email_rcv_yn == null) email_rcv_yn = "";

        int result = dao.insertMember(new MemberDTO(id, password, kor_name, eng_name, phone, email, sms_rcv_yn, email_rcv_yn));
        String msg = result==1? "회원가입이 완료되었습니다!" : "회원가입에 실패했습니다.";
        String separate = result==1? "login" : "join";
        request.setAttribute("msg", msg);
        request.setAttribute("url", "Member");
        request.setAttribute("separate", separate);
    }
}
