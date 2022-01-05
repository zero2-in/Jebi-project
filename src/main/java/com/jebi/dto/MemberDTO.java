package com.jebi.dto;

public class MemberDTO {
    private String id, password, kor_name, eng_name, phone, email, sms_rcv_yn, email_rcv_yn;

    // 회원가입 필드
    public MemberDTO(String id, String password, String kor_name, String eng_name, String phone, String email, String sms_rcv_yn, String email_rcv_yn) {
        this.id = id;
        this.password = password;
        this.kor_name = kor_name;
        this.eng_name = eng_name;
        this.phone = phone;
        this.email = email;
        this.sms_rcv_yn = sms_rcv_yn;
        this.email_rcv_yn = email_rcv_yn;
    }


    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getKor_name() {
        return this.kor_name;
    }

    public void setKor_name(String kor_name) {
        this.kor_name = kor_name;
    }

    public String getEng_name() {
        return this.eng_name;
    }

    public void setEng_name(String eng_name) {
        this.eng_name = eng_name;
    }

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSms_rcv_yn() {
        return this.sms_rcv_yn;
    }

    public void setSms_rcv_yn(String sms_rcv_yn) {
        this.sms_rcv_yn = sms_rcv_yn;
    }

    public String getEmail_rcv_yn() {
        return this.email_rcv_yn;
    }

    public void setEmail_rcv_yn(String email_rcv_yn) {
        this.email_rcv_yn = email_rcv_yn;
    }    
}