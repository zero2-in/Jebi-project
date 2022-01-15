package com.jebi.dto;

public class StatusListDTO {
    private String category, status_code, status_name;

    public StatusListDTO(String category, String status_code, String status_name) {
        this.category = category;
        this.status_code = status_code;
        this.status_name = status_name;
    }

    public String getCategory() {
        return category;
    }

    public String getStatus_code() {
        return status_code;
    }

    public String getStatus_name() {
        return status_name;
    }
}
