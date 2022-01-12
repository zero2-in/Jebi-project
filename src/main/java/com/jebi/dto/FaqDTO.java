package com.jebi.dto;

public class FaqDTO {
    private String no, title, category_code, category_name, content, reg_id, reg_name, reg_date;
    private int hit;

    public FaqDTO(String no, String title, String reg_name, String reg_date) {
        this.no = no;
        this.title = title;
        this.reg_name = reg_name;
        this.reg_date = reg_date;
    }

    public FaqDTO(String no, String title, String content, String reg_id, String reg_name, String reg_date, int hit, String category_code) {
        this.no = no;
        this.title = title;
        this.content = content;
        this.reg_id = reg_id;
        this.reg_name = reg_name;
        this.reg_date = reg_date;
        this.hit = hit;
        this.category_code = category_code;
    }

    public FaqDTO(String no, String title, String content, String category_code, String reg_id) {
        this.no = no;
        this.title = title;
        this.category_code = category_code;
        this.content = content;
        this.reg_id = reg_id;
    }

    public String getNo() {
        return no;
    }

    public String getTitle() {
        return title;
    }

    public String getCategory_code() {
        return category_code;
    }

    public String getCategory_name() {
        return category_name;
    }

    public String getContent() {
        return content;
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

    public int getHit() {
        return hit;
    }
}
