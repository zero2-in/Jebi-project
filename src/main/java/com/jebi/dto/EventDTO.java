package com.jebi.dto;

public class EventDTO {
    private String no, title, sub_title, content, attach, start_date, end_date;

    //목록조회
    public EventDTO(String no, String title, String sub_title, String attach, String start_date, String end_date) {
        this.no = no;
        this.title = title;
        this.sub_title = sub_title;
        this.attach = attach;
        this.start_date = start_date;
        this.end_date = end_date;
    }
    //등록//상세조회
    public EventDTO(String no, String title, String sub_title, String content, String attach, String start_date, String end_date) {
        this.no = no;
        this.title = title;
        this.sub_title = sub_title;
        this.content = content;
        this.attach = attach;
        this.start_date = start_date;
        this.end_date = end_date;
    }

    public String getNo() {
        return no;
    }

    public String getTitle() {
        return title;
    }

    public String getSub_title() {
        return sub_title;
    }

    public String getContent() {
        return content;
    }

    public String getAttach() { return attach; }

    public String getStart_date() { return start_date; }

    public String getEnd_date() { return end_date; }


}
