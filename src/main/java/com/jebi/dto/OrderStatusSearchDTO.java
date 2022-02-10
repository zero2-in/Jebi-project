package com.jebi.dto;

public class OrderStatusSearchDTO {
    private String agentType, statusCode, svc_dvs, orderNo, trackingNo, reg_kor_name, item_eng_name;

    public OrderStatusSearchDTO(String agentType, String statusCode, String svc_dvs, String orderNo, String trackingNo, String reg_kor_name, String item_eng_name) {
        this.agentType = agentType;
        this.statusCode = statusCode;
        this.svc_dvs = svc_dvs;
        this.orderNo = orderNo;
        this.trackingNo = trackingNo;
        this.reg_kor_name = reg_kor_name;
        this.item_eng_name = item_eng_name;
    }

    public String getAgentType() {
        return agentType;
    }

    public String getStatusCode() {
        return statusCode;
    }

    public String getSvc_dvs() {
        return svc_dvs;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public String getTrackingNo() {
        return trackingNo;
    }

    public String getReg_kor_name() {
        return reg_kor_name;
    }

    public String getItem_eng_name() {
        return item_eng_name;
    }
}
