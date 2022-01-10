package com.jebi.dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.SQLException;

import com.jebi.common.CommonUtil;
import com.jebi.dto.KakaoDTO;
import com.jebi.dto.MemberDTO;
import com.jebi.dto.NaverDTO;

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

    public String getLogin(String id, String password) {
        String name = "";
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "SELECT kor_name FROM jebi_member WHERE id = '"+id+"' AND password = '"+password+"'";
        util.runQuery(query, debugMethod, 0);

        try {
            if(util.getRs().next()) {
                name = util.getRs().getString("kor_name");
                setLastLogin(id);
            }
        } catch(SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return name;
    }

    public boolean checkAdmin(String id) {
        boolean admin = false;
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "SELECT administrator FROM jebi_member WHERE id = '"+id+"'";
        util.runQuery(query, debugMethod, 0);
        
        try {
            if(util.getRs().next()) {
                if(util.getRs().getString("administrator").equals("Y")) {
                    admin = true;
                }
            }
        } catch(SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return admin;
    }

    public boolean checkEmail(String id, String email) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        boolean already = false;
        String query = "SELECT id, email FROM jebi_member WHERE email = '"+email+"'";
        util.runQuery(query, debugMethod, 0);
        try {
            if(util.getRs().next()) {
                if(id.equals(util.getRs().getString("id"))) {
                    already = false;
                }
                else {
                    already = true;
                }
            }
        } catch(SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return already;
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

    // 이미 네이버 등록했는지 확인
    public boolean checkNaver(NaverDTO dto) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        boolean already = false;
        
        String query = "SELECT id FROM jebi_member WHERE id = '"+dto.getN_id()+"'";
        util.runQuery(query, debugMethod, 0);

        try {
            if(util.getRs().next()) {
                already = true;
                setLastLogin(dto.getN_id());
            }
            else {
                insertNaver(dto);
                setLastLogin(dto.getN_id());
            }
        } catch(SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return already;
    }

    // 이미 카카오 등록했는지 확인
    public boolean checkKakao(KakaoDTO dto) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        boolean already = false;

        String query = "SELECT id FROM jebi_member WHERE id = '"+dto.getKid()+"'";
        util.runQuery(query, debugMethod, 0);

        try {
            if(util.getRs().next()) {
                already = true;
                setLastLogin(dto.getKid());
            }
            else {
                insertKakao(dto);
                setLastLogin(dto.getKid());
            }
        } catch(SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return already;
    }

    // 네이버 등록
    private void insertNaver(NaverDTO dto) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "INSERT INTO jebi_member \r\n" +
        "(id, password, kor_name, eng_name, phone, email, sms_rcv_yn, email_rcv_yn) \r\n" +
        "VALUES('"+dto.getN_id()+"', 'naver', '"+dto.getN_name()+"', \r\n" +
        "'naver', '"+dto.getN_mobile()+"', '"+dto.getN_email()+"', 'N', 'N')";

        util.runQuery(query, debugMethod, 1);
        util.closeDB();
    }

    // 카카오 등록 
    private void insertKakao(KakaoDTO dto) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "INSERT INTO jebi_member \r\n" +
        "(id, password, kor_name, eng_name, phone, email, sms_rcv_yn, email_rcv_yn) \r\n" +
        "VALUES('"+dto.getKid()+"', 'kakao', '"+dto.getKnickname()+"', \r\n" +
        "'kakao', 'required', '"+dto.getKemail()+"', 'N', 'N')";

        util.runQuery(query, debugMethod, 1);
        util.closeDB();
    }

    // 최종 로그인 시간 등록
    private void setLastLogin(String id) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "UPDATE jebi_member SET last_login_date = CURRENT_TIMESTAMP WHERE id = '"+id+"'";
        util.runQuery(query, debugMethod, 1);
        util.closeDB();
    }

    // 비밀번호 난수 생성
    public String getSecurePassword(int num) {
        StringBuffer buffer = new StringBuffer();
        SecureRandom random = new SecureRandom();

        char[] pwdTable = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
				'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
				'Y', 'Z',	//0~25(26)
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
				'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
				'y', 'z',	//26~51(26)
				'1', '2', '3', '4', '5', '6', '7', '8', '9', '0',	//52~61(10)
				'*', '#', '+', '-', '_', '=', '~', '!', '@', '$', '%', '^', '&', '(',
				')', '{', '}', '[', ']', ':', ';', '<', '>', '?', '/'//62~86(25)
				};
            
        String[] s = new String[8];
        int[] randomNum = new int[s.length];
        s[0] = Character.toString(pwdTable[random.nextInt(26)]);	// 대문자
        s[1] = Character.toString(pwdTable[random.nextInt(26)]);	
        s[2] = Character.toString(pwdTable[random.nextInt(26)+26]);	// 소문자
        s[3] = Character.toString(pwdTable[random.nextInt(26)+26]);
        s[4] = Character.toString(pwdTable[random.nextInt(10)+52]);	// 숫자
        s[5] = Character.toString(pwdTable[random.nextInt(10)+52]);
        s[6] = Character.toString(pwdTable[random.nextInt(25)+62]);	// 특수문자
        s[7] = Character.toString(pwdTable[random.nextInt(25)+62]);
        for(int i=0; i<randomNum.length; i++) {
            randomNum[i] = random.nextInt(s.length);
            for(int j=0; j<i; j++) {
                if(randomNum[i] == randomNum[j])
                    i--;
            }
        }
        buffer.append(s[(random.nextInt(2)+2)]);
        for(int i=0; i<s.length; i++) {
            buffer.append(s[randomNum[i]]);
        }
        for(int i=0; i<(num-(s.length+1)); i++) {
            buffer.append(pwdTable[random.nextInt(pwdTable.length)]);
        }

        return buffer.toString();
    }
}
