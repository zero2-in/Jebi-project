package com.jebi.dto;

public class MemberDTO {
    private String id, password, kor_name, eng_name, phone, email, sms_rcv_yn, email_rcv_yn, locker, unreg, unreg_date, last_login_date, administrator, reg_date;

    // 회원가입 필드
    public MemberDTO(String id, String password, String kor_name, String eng_name, String phone, String email, String sms_rcv_yn, String email_rcv_yn, String locker) {
        this.id = id;
        this.password = password;
        this.kor_name = kor_name;
        this.eng_name = eng_name;
        this.phone = phone;
        this.email = email;
        this.sms_rcv_yn = sms_rcv_yn;
        this.email_rcv_yn = email_rcv_yn;
        this.locker = locker;
    }

    // 마이페이지 뷰


    public MemberDTO(String id, String kor_name, String eng_name, String phone, String email, String sms_rcv_yn, String email_rcv_yn, String locker, String unreg, String unreg_date, String last_login_date, String administrator, String reg_date) {
        this.id = id;
        this.kor_name = kor_name;
        this.eng_name = eng_name;
        this.phone = phone;
        this.email = email;
        this.sms_rcv_yn = sms_rcv_yn;
        this.email_rcv_yn = email_rcv_yn;
        this.locker = locker;
        this.unreg = unreg;
        this.unreg_date = unreg_date;
        this.last_login_date = last_login_date;
        this.administrator = administrator;
        this.reg_date = reg_date;
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

    public String getLocker() {
        return locker;
    }

    public String getUnreg() {
        return unreg;
    }

    public String getUnreg_date() {
        return unreg_date;
    }

    public String getLast_login_date() {
        return last_login_date;
    }

    public String getAdministrator() {
        return administrator;
    }

    public String getReg_date() {
        return reg_date;
    }
}