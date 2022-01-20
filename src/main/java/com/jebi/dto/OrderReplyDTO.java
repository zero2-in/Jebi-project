package com.jebi.dto;

public class OrderReplyDTO {
    private String no, comment_content, comment_reg_id, comment_reg_date, comment_reg_name, table_no;
    private int comment_count;

    public OrderReplyDTO(String no, String comment_content, String comment_reg_id, String comment_reg_date, String comment_reg_name, String table_no) {
        this.no = no;
        this.comment_content = comment_content;
        this.comment_reg_id = comment_reg_id;
        this.comment_reg_date = comment_reg_date;
        this.comment_reg_name = comment_reg_name;
        this.table_no = table_no;
    }

    public OrderReplyDTO(String table_no, String comment_reg_date, int comment_count) {
        this.table_no = table_no;
        this.comment_reg_date = comment_reg_date;
        this.comment_count = comment_count;
    }

    public OrderReplyDTO(String comment_content, String comment_reg_id, String table_no) {
        this.comment_content = comment_content;
        this.comment_reg_id = comment_reg_id;
        this.table_no = table_no;
    }

    public String getNo() {
        return no;
    }

    public String getComment_content() {
        return comment_content;
    }

    public String getComment_reg_id() {
        return comment_reg_id;
    }

    public String getComment_reg_date() {
        return comment_reg_date;
    }

    public String getComment_reg_name() {
        return comment_reg_name;
    }

    public String getTable_no() {
        return table_no;
    }

    public int getComment_count() {
        return comment_count;
    }
}
