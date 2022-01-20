package com.jebi.dto;

public class AgentOrderDTO {
    private String table_no, dlvr_method, reg_kor_name, reg_eng_name, cons_zip, cons_addr, cons_addr_det, person_ctms_no, reg_mob_no, dlvr_req,
            total_quantity, total_money_yuan, total_money_dollor, svc_dvs, detail_insp, default_pic, add_pic, poly_bag, safety_bag, remove_box,
            simple_clearance, island_mountain, insp_req, photo_req, center_req, order_no, status_name, tracking_no, clearance_code, item_eng_name,
            quantity, money_yuan, item_color, item_size, item_more_info, item_brand, item_url, item_img_url, reg_date, processing_date;

    // 리스트
    public AgentOrderDTO(String table_no, String dlvr_method, String reg_kor_name, String svc_dvs, String order_no, String status_name, String tracking_no, String quantity, String money_yuan, String item_img_url, String reg_date) {
        this.table_no = table_no;
        this.dlvr_method = dlvr_method;
        this.reg_kor_name = reg_kor_name;
        this.svc_dvs = svc_dvs;
        this.order_no = order_no;
        this.status_name = status_name;
        this.tracking_no = tracking_no;
        this.quantity = quantity;
        this.money_yuan = money_yuan;
        this.item_img_url = item_img_url;
        this.reg_date = reg_date;
    }

    public String getTable_no() {
        return table_no;
    }

    public String getDlvr_method() {
        return dlvr_method;
    }

    public String getReg_kor_name() {
        return reg_kor_name;
    }

    public String getReg_eng_name() {
        return reg_eng_name;
    }

    public String getCons_zip() {
        return cons_zip;
    }

    public String getCons_addr() {
        return cons_addr;
    }

    public String getCons_addr_det() {
        return cons_addr_det;
    }

    public String getPerson_ctms_no() {
        return person_ctms_no;
    }

    public String getReg_mob_no() {
        return reg_mob_no;
    }

    public String getDlvr_req() {
        return dlvr_req;
    }

    public String getTotal_quantity() {
        return total_quantity;
    }

    public String getTotal_money_yuan() {
        return total_money_yuan;
    }

    public String getTotal_money_dollor() {
        return total_money_dollor;
    }

    public String getSvc_dvs() {
        return svc_dvs;
    }

    public String getDetail_insp() {
        return detail_insp;
    }

    public String getDefault_pic() {
        return default_pic;
    }

    public String getAdd_pic() {
        return add_pic;
    }

    public String getPoly_bag() {
        return poly_bag;
    }

    public String getSafety_bag() {
        return safety_bag;
    }

    public String getRemove_box() {
        return remove_box;
    }

    public String getSimple_clearance() {
        return simple_clearance;
    }

    public String getIsland_mountain() {
        return island_mountain;
    }

    public String getInsp_req() {
        return insp_req;
    }

    public String getPhoto_req() {
        return photo_req;
    }

    public String getCenter_req() {
        return center_req;
    }

    public String getOrder_no() {
        return order_no;
    }

    public String getStatus_name() {
        return status_name;
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

    public String getReg_date() {
        return reg_date;
    }

    public String getProcessing_date() {
        return processing_date;
    }
}
