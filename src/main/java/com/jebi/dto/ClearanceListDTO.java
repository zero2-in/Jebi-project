package com.jebi.dto;

public class ClearanceListDTO {
    private String no, eng_name, clearance, clearance_category, clearance_name;

    public ClearanceListDTO(String no, String eng_name, String clearance, String clearance_category, String clearance_name) {
        this.no = no;
        this.eng_name = eng_name;
        this.clearance = clearance;
        this.clearance_category = clearance_category;
        this.clearance_name = clearance_name;
    }

    public String getNo() {
        return no;
    }

    public String getEng_name() {
        return eng_name;
    }

    public String getClearance() {
        return clearance;
    }

    public String getClearance_category() {
        return clearance_category;
    }

    public String getClearance_name() {
        return clearance_name;
    }
}
