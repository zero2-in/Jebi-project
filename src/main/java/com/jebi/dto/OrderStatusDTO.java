package com.jebi.dto;

public class OrderStatusDTO {
    private String status_code, status_name;

    public OrderStatusDTO(String status_code, String status_name) {
        this.status_code = status_code;
        this.status_name = status_name;
    }

    public String getStatus_code() {
        return this.status_code;
    }

    public void setStatus_code(String status_code) {
        this.status_code = status_code;
    }

    public String getStatus_name() {
        return this.status_name;
    }

    public void setStatus_name(String status_name) {
        this.status_name = status_name;
    }
}
