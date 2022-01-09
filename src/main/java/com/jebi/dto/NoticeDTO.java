package com.jebi.dto;

public class NoticeDTO {
    private String no, title, content, important, reg_id, reg_name, reg_date, hit;

    // 리스트
    public NoticeDTO(String no, String title, String important, String reg_name, String reg_date, String hit) {
        this.no = no;
        this.title = title;
        this.important = important;
        this.reg_name = reg_name;
        this.reg_date = reg_date;
        this.hit = hit;
    }

    public String getNo() {
        return this.no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImportant() {
        return this.important;
    }

    public void setImportant(String important) {
        this.important = important;
    }

    public String getReg_id() {
        return this.reg_id;
    }

    public void setReg_id(String reg_id) {
        this.reg_id = reg_id;
    }

    public String getReg_name() {
        return this.reg_name;
    }

    public void setReg_name(String reg_name) {
        this.reg_name = reg_name;
    }

    public String getReg_date() {
        return this.reg_date;
    }

    public void setReg_date(String reg_date) {
        this.reg_date = reg_date;
    }

    public String getHit() {
        return this.hit;
    }

    public void setHit(String hit) {
        this.hit = hit;
    }    
}
