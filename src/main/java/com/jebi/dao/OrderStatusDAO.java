package com.jebi.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.jebi.common.CommonUtil;
import com.jebi.dto.ClearanceListDTO;
import com.jebi.dto.DeliveryAddressDTO;
import com.jebi.dto.StatusListDTO;

public class OrderStatusDAO {
    CommonUtil util = new CommonUtil();

    public ArrayList<StatusListDTO> getStatusListCategory() {
        ArrayList<StatusListDTO> list = new ArrayList<>();
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "SELECT category, SUBSTR( \n" +
                "        XMLAGG( \n" +
                "                XMLELEMENT( \n" +
                "                        COL, ',', status_code \n" +
                "                    ) \n" +
                "                ORDER BY status_code \n" +
                "            ).EXTRACT('//text()').GETSTRINGVAL(), 2) status_code, \n" +
                "       SUBSTR( \n" +
                "               XMLAGG( \n" +
                "                       XMLELEMENT( \n" +
                "                               COL, ',', status_name \n" +
                "                           ) \n" +
                "                       ORDER BY status_code \n" +
                "                   ).EXTRACT('//text()').GETSTRINGVAL(), 2) status_name \n" +
                "FROM jebi_status_list \n" +
                "GROUP BY category, no \n" +
                "ORDER BY no";

        util.runQuery(query, debugMethod, 0);

        try {
            while(util.getRs().next()) {
                String category = util.getRs().getString("category");
                String[] status_code = util.getRs().getString("status_code").split(",");
                String[] status_name = util.getRs().getString("status_name").split(",");

                Map<String, String> status_list = new HashMap<String, String>();
                for(int i=0; i< status_code.length; i++) {
                    status_list.put(status_code[i], status_name[i]);
                }

                list.add(new StatusListDTO(category, status_list));
            }
        } catch(SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return list;
    }

    public int getCategoryCount(String id, String key) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        int count = 0;
        String query = "SELECT COUNT(item.status_code) cnt FROM jebi_order con, jebi_order_item item WHERE \n" +
                "con.reg_id = '"+id+"' AND item.status_code = '"+key+"'\n" +
                "AND item.order_no = con.order_no";

        util.runQuery(query, debugMethod, 0);
        try {
            if(util.getRs().next()) {
                count = util.getRs().getInt("cnt");
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return count;
    }

    // 주소 추가
    public int insertAddress(DeliveryAddressDTO dto) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "INSERT INTO jebi_dlvr_address \n" +
                "(no, reg_id, cons_zip, cons_ckbaseyn, cons_addr, cons_addr_det, cons_nm_kr, cons_nm_en, mob_no, person_ctms_no) \n" +
                "VALUES(nvl2((SELECT max(no) FROM jebi_dlvr_address), (SELECT (max(no)+1) FROM jebi_dlvr_address), '1'), \n" +
                "'"+dto.getReg_id()+"', '"+dto.getCons_zip()+"', '"+dto.getCons_ckbaseyn()+"', '"+dto.getCons_addr()+"', \n" +
                "'"+dto.getCons_addr_det()+"', '"+dto.getCons_nm_kr()+"', '"+dto.getCons_nm_en()+"', '"+dto.getMob_no()+"', '"+dto.getPerson_ctms_no()+"')";

        return util.runQuery(query, debugMethod, 1);
    }

    // 주소 삭제
    public int deleteAddress(String no, String id) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "DELETE FROM jebi_dlvr_address WHERE no = '"+no+"' AND reg_id = '"+id+"'";

        return util.runQuery(query, debugMethod, 1);
    }

    // 주소 수정
    public int updateAddress(DeliveryAddressDTO dto) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "UPDATE jebi_dlvr_address SET cons_zip = '"+dto.getCons_zip()+"', cons_ckbaseyn = '"+dto.getCons_ckbaseyn()+"', cons_addr = '"+dto.getCons_addr()+"', \n" +
                "cons_addr_det = '"+dto.getCons_addr_det()+"', cons_nm_kr = '"+dto.getCons_nm_kr()+"', cons_nm_en = '"+dto.getCons_nm_en()+"', \n" +
                "mob_no = '"+dto.getMob_no()+"', person_ctms_no = '"+dto.getPerson_ctms_no()+"' \n" +
                "WHERE no = '"+dto.getNo()+"'";

        return util.runQuery(query, debugMethod, 1);
    }

    // 주소 조회
    public ArrayList<DeliveryAddressDTO> getAddressList(String id) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        ArrayList<DeliveryAddressDTO> list = new ArrayList<>();
        String query = "SELECT no, cons_zip, cons_addr, cons_addr_det, cons_nm_kr, cons_nm_en, mob_no, person_ctms_no FROM jebi_dlvr_address \n" +
                "WHERE reg_id = '"+id+"'";

        util.runQuery(query, debugMethod, 0);

        try {
            while(util.getRs().next()) {
                String no = util.getRs().getString("no");
                String cons_zip = util.getRs().getString("cons_zip");
                String cons_addr = util.getRs().getString("cons_addr");
                String cons_addr_det = util.getRs().getString("cons_addr_det");
                String cons_nm_kr = util.getRs().getString("cons_nm_kr");
                String cons_nm_en = util.getRs().getString("cons_nm_en");
                String mob_no = util.getRs().getString("mob_no");
                String person_ctms_no = util.getRs().getString("person_ctms_no");

                list.add(new DeliveryAddressDTO(no, cons_zip, cons_addr, cons_addr_det, cons_nm_kr, cons_nm_en, mob_no, person_ctms_no));
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return list;
    }

    // 주소 상세보기 (수정)
    public DeliveryAddressDTO getAddrView(String no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        DeliveryAddressDTO dto = null;

        String query = "SELECT reg_id, cons_zip, cons_ckbaseyn, cons_addr, cons_addr_det, cons_nm_kr, cons_nm_en, mob_no, person_ctms_no FROM jebi_dlvr_address \n" +
                "WHERE no = '"+no+"'";
        util.runQuery(query, debugMethod, 0);

        try {
            if(util.getRs().next()) {
                String reg_id = util.getRs().getString("reg_id");
                String cons_zip = util.getRs().getString("cons_zip");
                String cons_ckbaseyn = util.getRs().getString("cons_ckbaseyn");
                String cons_addr = util.getRs().getString("cons_addr");
                String cons_addr_det = util.getRs().getString("cons_addr_det");
                String cons_nm_kr = util.getRs().getString("cons_nm_kr");
                String cons_nm_en = util.getRs().getString("cons_nm_en");
                String mob_no = util.getRs().getString("mob_no");
                String person_ctms_no = util.getRs().getString("person_ctms_no");

                dto = new DeliveryAddressDTO(no, reg_id, cons_zip, cons_ckbaseyn, cons_addr, cons_addr_det, cons_nm_kr, cons_nm_en, mob_no, person_ctms_no);
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return dto;
    }

    // 기본 배송지로 체크한 것들 바로 꺼내기
    public DeliveryAddressDTO getCkbaseInfo(String id) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        DeliveryAddressDTO dto = null;

        String query = "SELECT cons_zip, cons_addr, cons_addr_det, cons_nm_kr, cons_nm_en, mob_no, person_ctms_no FROM jebi_dlvr_address \n" +
                "WHERE reg_id = '"+id+"' AND cons_ckbaseyn = 'Y'";

        util.runQuery(query, debugMethod, 0);

        try {
            if(util.getRs().next()) {
                String cons_zip = util.getRs().getString("cons_zip");
                String cons_addr = util.getRs().getString("cons_addr");
                String cons_addr_det = util.getRs().getString("cons_addr_det");
                String cons_nm_kr = util.getRs().getString("cons_nm_kr");
                String cons_nm_en = util.getRs().getString("cons_nm_en");
                String mob_no = util.getRs().getString("mob_no");
                String person_ctms_no = util.getRs().getString("person_ctms_no");

                dto = new DeliveryAddressDTO(cons_zip, cons_addr, cons_addr_det, cons_nm_kr, cons_nm_en, mob_no, person_ctms_no);
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return dto;
    }

    public ArrayList<ClearanceListDTO> getClearanceList() {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        ArrayList<ClearanceListDTO> list = new ArrayList<>();
        String query = "SELECT * FROM jebi_clearance_list ORDER BY clearance ASC, no ASC";
        util.runQuery(query, debugMethod, 0);

        try {
            while(util.getRs().next()) {
                String no = util.getRs().getString("no");
                String eng_name = util.getRs().getString("eng_name");
                String clearance = util.getRs().getString("clearance");
                String clearance_category = util.getRs().getString("clearance_category");
                String clearance_name = util.getRs().getString("clearance_name");

                list.add(new ClearanceListDTO(no, eng_name, clearance, clearance_category, clearance_name));
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return list;
    }

    // order 테이블 최대 넘버 구하기
    public String getMaxTable_no() {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String maxNo = "1";
        String query = "SELECT NVL2(MAX(table_no), (MAX(table_no)+1), '1') maxno FROM jebi_order";

        util.runQuery(query, debugMethod, 0);
        try {
            if(util.getRs().next()) {
                maxNo = util.getRs().getString("maxno");
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return maxNo;
    }
}
