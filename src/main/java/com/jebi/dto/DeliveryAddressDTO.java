package com.jebi.dto;

public class DeliveryAddressDTO {
    private String no, reg_id, cons_zip, cons_ckbaseyn, cons_addr, cons_addr_det, cons_nm_kr, cons_nm_en, mob_no, person_ctms_no;

    public DeliveryAddressDTO(String reg_id, String cons_zip, String cons_ckbaseyn, String cons_addr, String cons_addr_det, String cons_nm_kr, String cons_nm_en, String mob_no, String person_ctms_no) {
        this.reg_id = reg_id;
        this.cons_zip = cons_zip;
        this.cons_ckbaseyn = cons_ckbaseyn;
        this.cons_addr = cons_addr;
        this.cons_addr_det = cons_addr_det;
        this.cons_nm_kr = cons_nm_kr;
        this.cons_nm_en = cons_nm_en;
        this.mob_no = mob_no;
        this.person_ctms_no = person_ctms_no;
    }

    // 리스트
    public DeliveryAddressDTO(String no, String cons_zip, String cons_addr, String cons_addr_det, String cons_nm_kr, String cons_nm_en, String mob_no) {
        this.no = no;
        this.cons_zip = cons_zip;
        this.cons_addr = cons_addr;
        this.cons_addr_det = cons_addr_det;
        this.cons_nm_kr = cons_nm_kr;
        this.cons_nm_en = cons_nm_en;
        this.mob_no = mob_no;
    }

    public String getNo() {
        return no;
    }

    public String getReg_id() {
        return reg_id;
    }

    public String getCons_zip() {
        return cons_zip;
    }

    public String getCons_ckbaseyn() {
        return cons_ckbaseyn;
    }

    public String getCons_addr() {
        return cons_addr;
    }

    public String getCons_addr_det() {
        return cons_addr_det;
    }

    public String getCons_nm_kr() {
        return cons_nm_kr;
    }

    public String getCons_nm_en() {
        return cons_nm_en;
    }

    public String getMob_no() {
        return mob_no;
    }

    public String getPerson_ctms_no() {
        return person_ctms_no;
    }
}
