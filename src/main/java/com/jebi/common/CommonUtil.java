package com.jebi.common;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.io.StringReader;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;

public class CommonUtil {
    private Connection con = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    /*
        사용법 : 
        CommonUtil util = new CommonUtil();   -- 객체 생성

        public ... getExample() {
            String debugMethod = new Object() {}.getClass().getEnclosingMethod().getName(); -- 현재 메소드 명
            String query = "SELECT * FROM 뭐시기"; 
            
            util.runQuery(query, debugMethod, 0);                   -- 0: 오직 query가 SELECT문 일때만 사용하세요.
            try {
                while(util.getRs().next()) {                        -- util.getRs().next() == rs.next()
                    String no = util.getRs().getString("no");       -- util.getRs().getString() == rs.getString()
                    ...
                }
            } catch(SQLException e) {
                util.viewErr(debugMethod);
            }
        }
    */


    // type[0] : SELECT, type[1] : UPDATE, DELETE, INSERT
    public int runQuery(String query, String debugMethod, int type) {
        int result = 0;

        try {
            con = DBConnection.getConnection();
            ps = con.prepareStatement(query);
            switch(type) {
                case 0 : rs = ps.executeQuery(); result+=1; break;
                case 1 : result = ps.executeUpdate(); closeDB(); break;
            }
        } catch(SQLException e) {
            e.printStackTrace();
            System.out.println("\n\n-------------------------------------");
            System.out.println(debugMethod+"메소드에서 오류가 발생했습니다!");
            System.out.println("실행된 query : "+query);
            System.out.println("-------------------------------------\n\n");
        }

        return result;
    }

    // 긴 글 등록
    public int runQuery(String query, String debugMethod, String content) {
        int result = 0;

        try {
            con = DBConnection.getConnection();
            con.setAutoCommit(false);
            StringReader reader = new StringReader(content);
            ps = con.prepareStatement(query);
            ps.setCharacterStream(1, reader, content.length());
            result = ps.executeUpdate();
            con.commit();
            con.setAutoCommit(true);
        } catch(SQLException e) {
            e.printStackTrace();
            System.out.println("\n\n-------------------------------------");
            System.out.println(debugMethod+"메소드에서 오류가 발생했습니다!");
            System.out.println("실행된 query : "+query);
            System.out.println("-------------------------------------\n\n");
        }

        return result;
    }

    public void viewErr(String debugMethod) {
        System.out.println("\n\n---------------------------------");
        System.out.println(debugMethod+"메소드에서 ResultSet 오류가 발생했습니다");
        System.out.println("---------------------------------\n\n");
    }

    public ResultSet getRs() {
        return this.rs;
    }

    public void closeDB() {
        DBConnection.closeDB(con, ps, rs);
    }

    public static String getFile_dir(String directoryName) {
        return "C:/Users/fushi/Desktop/work-jsh/java_project/jebi-project/src/main/webapp/file_room/"+directoryName+"/";
    }

    public void sendMail(String email, String id, String temp_password, int type) {
        final String bodyEncoding = "UTF-8";

        String subject = "[제비]";
        if(type == 0) subject += " - 아이디 찾기 결과입니다.";
        else subject += " - 임시 비밀번호가 발급되었습니다.";
        String fromEmail = "wowin21@gmail.com";
        String fromUsername = "제비";
        String toEmail = email;

        final String username = "wowin21";
        final String password = "taytemgzgisijkth";

        StringBuffer buffer = new StringBuffer();
        buffer.append("<div style='border: 1px solid #dcdcdc; padding: 0px; margin: 0px; width: 600px; box-sizing: border-box;'>");
        buffer.append("    <h1 style='color: #78148c; text-align: center;'>");
        if(type == 0) buffer.append("아이디 찾기");
        else buffer.append("비밀번호 찾기");
        buffer.append("    </h1>");
        buffer.append("    <br>");
        buffer.append("    <p style='margin: 0px; padding: 0px; font-size: 18px;'>안녕하세요 제비입니다.</p>");
        buffer.append("    <p style='margin: 0px; padding: 0px; font-size: 18px;'>이 메일은 아이디/비밀번호 찾기를 위한 메일입니다.</p>");
        buffer.append("    <p style='margin: 0px; padding: 0px; font-size: 18px;'>아래는 찾으시는 정보입니다.</p>");
        buffer.append("    <br>");
        buffer.append("    <div style='padding: 0;'>");
        buffer.append("        <p style='border: 1px solid #fff; margin: 0; padding: 8px 3px; text-align: center; width: 25%; box-sizing: border-box; background: #78148c; color: #fff; float: left;'>");
        if(type == 0) buffer.append("아이디");
        else buffer.append("임시 비밀번호");
        buffer.append("        <p style='border: 1px solid #fff; margin: 0; padding: 8px 3px; text-align: center; width: 75%; box-sizing: border-box; background: #f3f3f3; font-weight: 300; float: right;'>");
        if(type == 0) buffer.append(id);
        else buffer.append(temp_password);
        buffer.append("        </p>");
        buffer.append("    </div>");
        buffer.append("    <div style='clear: both;'></div>");
        buffer.append("    <br>");
        buffer.append("    <div style='margin: 0; padding: 0; background-color: #78148c; border: 1px solid #fff;'>");
        buffer.append("        <p style='color: #fff; font-size: 18px; margin: 0; padding: 8px 3px; font-weight: 600;'>구매/배송대행은 제비</p>");
        buffer.append("    </div>");
        buffer.append("</div>");
        String html = buffer.toString();

        Properties props = new Properties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.auth", "true");

        props.put("mail.smtp.quitwait", "false");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false");

        try {
            Authenticator auth = new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            };

            Session session = Session.getInstance(props, auth);

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail, fromUsername));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
            message.setSubject(subject);
            message.setSentDate(new Date());

            Multipart mParts = new MimeMultipart();
            MimeBodyPart mTextPart = new MimeBodyPart();
            MimeBodyPart mFilePart = null;

            mTextPart.setText(html, bodyEncoding, "html");
            mParts.addBodyPart(mTextPart);

            message.setContent(mParts);

            MailcapCommandMap MailcapCmdMap = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
            MailcapCmdMap.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
            MailcapCmdMap.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
            MailcapCmdMap.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
            MailcapCmdMap.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
            MailcapCmdMap.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
            CommandMap.setDefaultCommandMap(MailcapCmdMap);

            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getRandomPassword() {
        int pwLength = 9;
        char[] pwdTable = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
                'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
                'Y', 'Z',	//0~25(26)
                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
                'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
                'y', 'z',	//26~51(26)
                '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'	//52~61(10)
        };

        StringBuffer buffer = new StringBuffer();
        SecureRandom random = new SecureRandom();

        String[] s = new String[6];
        int[] randomNum = new int[s.length];
        s[0] = Character.toString(pwdTable[random.nextInt(26)]);	//첫문자는 소문자
        s[1] = Character.toString(pwdTable[random.nextInt(26)]);
        s[2] = Character.toString(pwdTable[random.nextInt(26)+26]);	//소문자 2
        s[3] = Character.toString(pwdTable[random.nextInt(26)+26]);
        s[4] = Character.toString(pwdTable[random.nextInt(10)+52]);	//대문자2
        s[5] = Character.toString(pwdTable[random.nextInt(10)+52]);
        for(int i=0; i<randomNum.length; i++) {
            randomNum[i] = random.nextInt(s.length);
            for(int j=0; j<i; j++) {
                if(randomNum[i] == randomNum[j])
                    i--;
            }
        }
        buffer.append(Character.toString(pwdTable[random.nextInt(26)+26])); //first lower case
        for(int i=0; i<s.length; i++) {
            buffer.append(s[randomNum[i]]);
        }
        for(int i=0; i<(pwLength-(s.length+1)); i++) {
            buffer.append(pwdTable[random.nextInt(pwdTable.length)]);
        }
        return buffer.toString();
    }
}
