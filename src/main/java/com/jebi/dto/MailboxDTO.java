package com.jebi.dto;

public class MailboxDTO {
    private String no, title, content, to_userid, reg_id, reg_name, reg_date, read_date;

    // 리스트
    public MailboxDTO(String no, String title, String reg_name, String reg_date, String read_date) {
        this.no = no;
        this.title = title;
        this.reg_name = reg_name;
        this.reg_date = reg_date;
        this.read_date = read_date;
    }

    // 보기
    public MailboxDTO(String no, String title, String content) {
        this.no = no;
        this.title = title;
        this.content = content;
    }

    public String getNo() {
        return no;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public String getTo_userid() {
        return to_userid;
    }

    public String getReg_id() {
        return reg_id;
    }

    public String getReg_name() {
        return reg_name;
    }

    public String getReg_date() {
        return reg_date;
    }

    public String getRead_date() {
        return read_date;
    }
}
