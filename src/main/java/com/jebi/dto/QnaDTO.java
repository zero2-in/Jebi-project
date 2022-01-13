package com.jebi.dto;

public class QnaDTO {
    private String no, category_code, category_name, title, content, important, attach, reg_id, reg_name, reg_date;

    // 조회
    public QnaDTO(String no, String category_name, String title, String important, String reg_name, String reg_date) {
        this.no = no;
        this.category_name = category_name;
        this.title = title;
        this.important = important;
        this.reg_name = reg_name;
        this.reg_date = reg_date;
    }

    // 등록
    public QnaDTO(String no, String category_code, String title, String content, String important, String attach, String reg_id) {
        this.no = no;
        this.category_code = category_code;
        this.title = title;
        this.content = content;
        this.important = important;
        this.attach = attach;
        this.reg_id = reg_id;
    }

    // 상세보기
    public QnaDTO(String no, String category_code, String category_name, String title, String content, String important, String attach, String reg_id, String reg_name, String reg_date) {
        this.no = no;
        this.category_code = category_code;
        this.category_name = category_name;
        this.title = title;
        this.content = content;
        this.important = important;
        this.attach = attach;
        this.reg_id = reg_id;
        this.reg_name = reg_name;
        this.reg_date = reg_date;
    }

    // 조회
    public QnaDTO(String no, String category_name, String title, String reg_name, String reg_date) {
        this.no = no;
        this.category_name = category_name;
        this.title = title;
        this.reg_id = reg_id;
        this.reg_name = reg_name;
        this.reg_date = reg_date;
    }

    public String getNo() {
        return no;
    }

    public String getCategory_code() {
        return category_code;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public String getReg_id() {
        return reg_id;
    }

    public String getReg_date() {
        return reg_date;
    }

    public String getReg_name() {
        return reg_name;
    }

    public String getImportant() {
        return important;
    }

    public String getAttach() {
        return attach;
    }

    public String getCategory_name() {
        return category_name;
    }
}
