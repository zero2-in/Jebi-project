package com.jebi.dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import com.jebi.common.CommonUtil;
import com.jebi.dto.KakaoDTO;
import com.jebi.dto.MailboxDTO;
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

        String query = "SELECT kor_name FROM jebi_member WHERE id = '"+id+"' AND password = '"+password+"' AND unreg = 'N'";
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

    public boolean testLogin(String id, String password) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        boolean test = false;
        String query = "SELECT kor_name cnt FROM jebi_member WHERE id = '"+id+"' AND password = '"+password+"'";

        util.runQuery(query, debugMethod, 0);

        try {
            if(util.getRs().next()) {
                test = true;
            }
        } catch(SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return true;
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
        "(id, password, kor_name, eng_name, phone, email, sms_rcv_yn, email_rcv_yn, locker) \r\n" +
        "VALUES('"+dto.getId()+"', '"+dto.getPassword()+"', '"+dto.getKor_name()+"', \r\n" +
        "'"+dto.getEng_name()+"', '"+dto.getPhone()+"', '"+dto.getEmail()+"', '"+dto.getSms_rcv_yn()+"', '"+dto.getEmail_rcv_yn()+"', '"+dto.getLocker()+"')";

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
        "(id, password, kor_name, eng_name, phone, email, sms_rcv_yn, email_rcv_yn, social_login) \r\n" +
        "VALUES('"+dto.getN_id()+"', 'naver', '"+dto.getN_name()+"', \r\n" +
        "'naver', '"+dto.getN_mobile()+"', '"+dto.getN_email()+"', 'N', 'N', 'NAVER')";

        util.runQuery(query, debugMethod, 1);
        util.closeDB();
    }

    // 카카오 등록 
    private void insertKakao(KakaoDTO dto) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "INSERT INTO jebi_member \r\n" +
        "(id, password, kor_name, eng_name, phone, email, sms_rcv_yn, email_rcv_yn, social_login) \r\n" +
        "VALUES('"+dto.getKid()+"', 'kakao', '"+dto.getKnickname()+"', \r\n" +
        "'kakao', 'required', '"+dto.getKemail()+"', 'N', 'N', 'KAKAO')";

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

    public String getMaxLockerNum() {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String locker = "#JB00001";
        String query = "SELECT nvl2(max(locker), '#JB'||LTRIM((TO_CHAR((substr(max(locker), 4)+1), '00000'))), '#JB00001') " +
                "AS maxlocker FROM jebi_member";
        util.runQuery(query, debugMethod, 0);

        try {
            if(util.getRs().next()) {
                locker = util.getRs().getString("maxlocker");
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return locker;
    }

    public MemberDTO getMyList(String id) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        MemberDTO dto = null;

        String query = "SELECT kor_name, eng_name, phone, email, SMS_RCV_YN, EMAIL_RCV_YN, ADMINISTRATOR, \n" +
                "to_char(REG_DATE, 'yyyy-MM-dd') AS reg_date, UNREG, to_char(UNREG_DATE, 'yyyy-MM-dd hh:mi') AS unreg_date, " +
                "to_char(LAST_LOGIN_DATE, 'yyyy-MM-dd hh:mi') AS last_login_date, " +
                "LOCKER, social_login FROM jebi_member \n" +
                "WHERE id = '"+id+"'";

        util.runQuery(query, debugMethod, 0);

        try {
            if(util.getRs().next()) {
                String kor_name = util.getRs().getString("kor_name");
                String eng_name = util.getRs().getString("eng_name");
                String phone = util.getRs().getString("phone");
                String email = util.getRs().getString("email");
                String sms_rcv_yn = util.getRs().getString("sms_rcv_yn");
                String email_rcv_yn = util.getRs().getString("email_rcv_yn");
                String administrator = util.getRs().getString("administrator");
                String reg_date = util.getRs().getString("reg_date");
                String unreg = util.getRs().getString("unreg");
                String unreg_date = util.getRs().getString("unreg_date");
                String last_login_date = util.getRs().getString("last_login_date");
                String locker = util.getRs().getString("locker");
                String social_login = util.getRs().getString("social_login");

                dto = new MemberDTO(id, kor_name, eng_name, phone, email, sms_rcv_yn, email_rcv_yn, locker, unreg, unreg_date, last_login_date, administrator, reg_date, social_login);
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return dto;
    }

    public int changePassword(String id, String password) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "UPDATE jebi_member SET password = '"+password+"', required_reset_password = 'N' WHERE id = '"+id+"'";

        return util.runQuery(query, debugMethod, 1);
    }

    public int changeMyinfo(MemberDTO dto) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "UPDATE jebi_member SET ENG_NAME = '"+dto.getEng_name()+"', PHONE = '"+dto.getPhone()+"', EMAIL = '"+dto.getEmail()+"', \n" +
                "SMS_RCV_YN = '"+dto.getSms_rcv_yn()+"', EMAIL_RCV_YN = '"+dto.getEmail_rcv_yn()+"' WHERE id = '"+dto.getId()+"'";

        return util.runQuery(query, debugMethod, 1);
    }

    public int setUnreg(String id) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "UPDATE jebi_member SET unreg = 'Y', unreg_date = CURRENT_TIMESTAMP, LOCKER = '' WHERE id = '"+id+"'";

        return util.runQuery(query, debugMethod, 1);
    }

    // 메일함 가져오기
    public ArrayList<MailboxDTO> getMailSession(String id) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        ArrayList<MailboxDTO> list = new ArrayList<>();
        String query = "SELECT a.no, a.title, b.kor_name AS reg_name FROM jebi_mailbox a, jebi_member b \n" +
                "WHERE a.to_userid = '"+id+"' AND a.reg_id = b.id AND a.has_read = 'N' ORDER BY a.reg_date DESC";

        util.runQuery(query, debugMethod, 0);

        try {
            while(util.getRs().next()) {
                String no = util.getRs().getString("no");
                String title = util.getRs().getString("title");
                String reg_name = util.getRs().getString("reg_name");

                list.add(new MailboxDTO(no, title, reg_name, ""));
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return list;
    }

    // 아이디 찾기
    public int findId(String kor_name, String mobile) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String id = "";
        String query = "SELECT id FROM jebi_member WHERE kor_name = '"+kor_name+"' AND phone = '"+mobile+"'";
        util.runQuery(query, debugMethod, 0);

        try {
            if(util.getRs().next()) {
                id = util.getRs().getString("id");
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        if(id.equals("")) return 0;
        else return sendEmail(id, 0);
    }

    // 비밀번호 찾기
    public int findPw(String id, String kor_name, String mobile) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        int result = 0;
        String query = "SELECT * FROM jebi_member WHERE id = '"+id+"' AND kor_name = '"+kor_name+"' AND phone = '"+mobile+"'";

        util.runQuery(query, debugMethod, 0);
        try {
            if (util.getRs().next()) {
                result = 1;
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }
        if(result == 1) return sendEmail(id, 1);
        else return 0;
    }

    // type[0] : findId, type[1] : findPw
    private int sendEmail(String id, int type) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "SELECT email FROM jebi_member WHERE id = '"+id+"'";

        util.runQuery(query, debugMethod, 0);

        try {
            if(util.getRs().next()) {
                if(type == 0) {
                    util.sendMail(util.getRs().getString("email"), id, "", type);
                } else {
                    String randomPassword = util.getRandomPassword();
                    String email = util.getRs().getString("email");
                    try {
                        query = "UPDATE jebi_member SET password = '"+encryptSHA256(randomPassword)+"', required_reset_password = 'Y' WHERE id = '"+id+"'";
                    } catch (NoSuchAlgorithmException e) {
                        e.printStackTrace();
                    }

                    int result = util.runQuery(query, debugMethod, 1);

                    if(result == 1) util.sendMail(email, id, randomPassword, type);
                    else return 0;
                }
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return 1;
    }

    // 임시 비밀번호로 로그인했는지 테스트
    public String testLogin(String id) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String result = "";
        String query = "SELECT REQUIRED_RESET_PASSWORD FROM JEBI_MEMBER WHERE id = '"+id+"'";
        util.runQuery(query, debugMethod, 0);

        try {
            if(util.getRs().next()) {
                result = util.getRs().getString("required_reset_password");
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return result;
    }
}
