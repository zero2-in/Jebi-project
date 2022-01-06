package com.jebi.dto;

public class NaverDTO {
    private String n_id, n_email, n_mobile, n_name;

    public NaverDTO(String n_id, String n_email, String n_mobile, String n_name) {
        this.n_id = n_id;
        this.n_email = n_email;
        this.n_mobile = n_mobile;
        this.n_name = n_name;
    }

    public String getN_id() {
        return this.n_id;
    }

    public void setN_id(String n_id) {
        this.n_id = n_id;
    }

    public String getN_email() {
        return this.n_email;
    }

    public void setN_email(String n_email) {
        this.n_email = n_email;
    }

    public String getN_mobile() {
        return this.n_mobile;
    }

    public void setN_mobile(String n_mobile) {
        this.n_mobile = n_mobile;
    }

    public String getN_name() {
        return this.n_name;
    }

    public void setN_name(String n_name) {
        this.n_name = n_name;
    }
}
