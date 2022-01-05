package com.jebi.dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import com.jebi.common.CommonUtil;
import com.jebi.dto.MemberDTO;

public class MemberDAO {
    CommonUtil util = new CommonUtil();

    // SHA-256 암호화
    public String encryptSHA256(String value) throws NoSuchAlgorithmException {
        String encryptData = "";

        MessageDigest sha = MessageDigest.getInstance("SHA-256");
        sha.update(value.getBytes());

        byte[] digest = sha.digest();
        for(int i=0; i< digest.length; i++) {
            encryptData += Integer.toHexString(digest[i] & 0xFF).toUpperCase();
        }

        return encryptData;
    }

    public boolean checkId(String id) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        boolean available = true;

        String query = "SELECT id FROM jebi_member WHERE id = '"+id+"'";
        util.runQuery(query, debugMethod, 0);

        try {
            if(util.getRs().next()) {
                available = false;
            }
        } catch(SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return available;
    }

    // 회원가입
    public int insertMember(MemberDTO dto) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "INSERT INTO jebi_member \r\n" +
        "(id, password, kor_name, eng_name, phone, email, sms_rcv_yn, email_rcv_yn) \r\n" +
        "VALUES('"+dto.getId()+"', '"+dto.getPassword()+"', '"+dto.getKor_name()+"', \r\n" +
        "'"+dto.getEng_name()+"', '"+dto.getPhone()+"', '"+dto.getEmail()+"', '"+dto.getSms_rcv_yn()+"', '"+dto.getEmail_rcv_yn()+"')";

        int result = util.runQuery(query, debugMethod, 1);
        util.closeDB();

        return result;
    }
}
