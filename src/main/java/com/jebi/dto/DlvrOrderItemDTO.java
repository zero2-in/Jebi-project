package com.jebi.dto;

public class DlvrOrderItemDTO {
    private String table_no, order_no, status_code, tracking_no, clearance_code, item_eng_name, quantity, money_yuan, item_color, item_size, item_more_info, item_brand, item_url, item_img_url;

    public DlvrOrderItemDTO(String table_no, String order_no, String status_code, String tracking_no, String clearance_code, String item_eng_name, String quantity, String money_yuan, String item_color, String item_size, String item_more_info, String item_brand, String item_url, String item_img_url) {
        this.table_no = table_no;
        this.order_no = order_no;
        this.status_code = status_code;
        this.tracking_no = tracking_no;
        this.clearance_code = clearance_code;
        this.item_eng_name = item_eng_name;
        this.quantity = quantity;
        this.money_yuan = money_yuan;
        this.item_color = item_color;
        this.item_size = item_size;
        this.item_more_info = item_more_info;
        this.item_brand = item_brand;
        this.item_url = item_url;
        this.item_img_url = item_img_url;
    }

    public String getTable_no() {
        return table_no;
    }

    public String getOrder_no() {
        return order_no;
    }

    public String getStatus_code() {
        return status_code;
    }

    public String getTracking_no() {
        return tracking_no;
    }

    public String getClearance_code() {
        return clearance_code;
    }

    public String getItem_eng_name() {
        return item_eng_name;
    }

    public String getQuantity() {
        return quantity;
    }

    public String getMoney_yuan() {
        return money_yuan;
    }

    public String getItem_color() {
        return item_color;
    }

    public String getItem_size() {
        return item_size;
    }

    public String getItem_more_info() {
        return item_more_info;
    }

    public String getItem_brand() {
        return item_brand;
    }

    public String getItem_url() {
        return item_url;
    }

    public String getItem_img_url() {
        return item_img_url;
    }
}
