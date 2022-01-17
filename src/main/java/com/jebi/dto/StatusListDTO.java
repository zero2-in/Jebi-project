package com.jebi.dto;

import java.util.Map;

public class StatusListDTO {
    private String category;
    private Map<String, String> status_list;

    public StatusListDTO(String category, Map<String, String> status_list) {
        this.category = category;
        this.status_list = status_list;
    }

    public String getCategory() {
        return category;
    }

    public Map<String, String> getStatus_list() {
        return status_list;
    }
}
