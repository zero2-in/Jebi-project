package com.jebi.dto;

public class QnaReplyDTO {
    private String no, qna_no, comment_content, comment_reg_id, comment_reg_name, comment_reg_date;

    public QnaReplyDTO(String no, String qna_no, String comment_content, String comment_reg_id, String comment_reg_name, String comment_reg_date) {
        this.no = no;
        this.qna_no = qna_no;
        this.comment_content = comment_content;
        this.comment_reg_id = comment_reg_id;
        this.comment_reg_name = comment_reg_name;
        this.comment_reg_date = comment_reg_date;
    }

    // 등록
    public QnaReplyDTO(String qna_no, String comment_content, String comment_reg_id) {
        this.qna_no = qna_no;
        this.comment_content = comment_content;
        this.comment_reg_id = comment_reg_id;
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

    public String getQna_no() {
        return qna_no;
    }

    public String getComment_reg_name() {
        return comment_reg_name;
    }
}
