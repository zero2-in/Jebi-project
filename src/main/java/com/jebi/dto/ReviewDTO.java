package com.jebi.dto;

public class ReviewDTO {
    private String no, title, content, attach, reg_id, reg_date, kor_name;
    private int hit;

    //상세보기
    public ReviewDTO(String no, String title, String content, String attach, String kor_name, String reg_id, String reg_date, int hit) {
        this.no = no;
        this.title = title;
        this.content = content;
        this.attach = attach;
        this.kor_name = kor_name;
        this.reg_id = reg_id;
        this.reg_date = reg_date;
        this.hit = hit;
    }

    // 글쓰기 등록 // 글쓰기 수정
    public ReviewDTO(String no, String title, String content, String attach, String reg_id, String reg_date) {
        this.no = no;
        this.title = title;
        this.content = content;
        this.attach = attach;
        this.reg_id = reg_id;
        this.reg_date = reg_date;
    }

    // 리스트
    public ReviewDTO(String no, String title, String reg_date, String kor_name, String attach, int hit) {
        this.no = no;
        this.title = title;
        this.reg_date = reg_date;
        this.kor_name = kor_name;
        this.attach = attach;
        this.hit = hit;
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

    public String getAttach() {
        return attach;
    }

    public String getReg_id() {
        return reg_id;
    }

    public String getReg_date() {
        return reg_date;
    }

    public String getKor_name() {
        return kor_name;
    }

    public int getHit() {
        return hit;
    }
}
