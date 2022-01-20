package com.jebi.dao;

import java.sql.Array;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.jebi.common.CommonUtil;
import com.jebi.dto.*;
import org.springframework.core.annotation.Order;

public class OrderStatusDAO {
    CommonUtil util = new CommonUtil();

    // 마이페이지
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

    public ArrayList<AgentOrderDTO> getAgentList(String id) {
        ArrayList<AgentOrderDTO> list = new ArrayList<>();
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "SELECT a.table_no, a.order_no, to_char(a.reg_date, 'yyyy-MM-dd hh:mi') AS reg_date, \n" +
                "to_char(a.processing_date, 'yyyy-MM-dd hh:mi') AS processing_date, \n" +
                "stat.status_name, info.dlvr_method, info.svc_dvs, info.reg_kor_name, a.agent_type, \n" +
                "item.quantity, to_char(item.money_yuan, 'FM999999999999990.00') AS money_yuan, item.tracking_no, item.item_img_url \n" +
                "FROM jebi_order a, jebi_order_item item, jebi_order_info info, jebi_status_list stat \n" +
                "WHERE a.reg_id = '"+id+"' AND a.table_no = item.table_no AND a.order_no = item.order_no \n" +
                "AND a.table_no = info.table_no AND item.status_code = stat.status_code";

        util.runQuery(query, debugMethod, 0);

        try {
            while(util.getRs().next()) {
                String table_no = util.getRs().getString("table_no");
                String order_no = util.getRs().getString("order_no");
                String reg_date = util.getRs().getString("reg_date");
                String status_name = util.getRs().getString("status_name");
                String dlvr_method = util.getRs().getString("dlvr_method");
                if(dlvr_method.equals("plane")) dlvr_method = "항공";
                else if(dlvr_method.equals("ship")) dlvr_method = "해운";
                String svc_dvs = util.getRs().getString("svc_dvs");
                if(svc_dvs.equals("manual")) svc_dvs = "수동결제";
                else if(svc_dvs.equals("auto")) svc_dvs = "자동결제";
                String reg_kor_name = util.getRs().getString("reg_kor_name");
                String agent_type = util.getRs().getString("agent_type");
                String quantity = util.getRs().getString("quantity");
                String money_yuan = util.getRs().getString("money_yuan");
                String tracking_no = util.getRs().getString("tracking_no");
                String item_img_url = util.getRs().getString("item_img_url");
                String processing_date = util.getRs().getString("processing_date");

                list.add(new AgentOrderDTO(table_no, dlvr_method, reg_kor_name, svc_dvs, order_no, agent_type, status_name, tracking_no, quantity, money_yuan, item_img_url, reg_date, processing_date));
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return list;
    }

    public AgentOrderDTO getOrderView(String table_no, String order_no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        AgentOrderDTO dto = null;
        String query = "SELECT a.table_no, a.order_no, stat.status_name, info.dlvr_method, a.agent_type, info.svc_dvs, \n" +
                "info.reg_kor_name, info.reg_eng_name, info.person_ctms_no, info.reg_mob_no, info.cons_zip, \n" +
                "info.cons_addr, info.cons_addr_det, info.dlvr_req, item.tracking_no, \n" +
                "c.clearance, c.clearance_category, c.clearance_name, \n" +
                "c.eng_name AS item_name, item.item_url, item.item_img_url, item.quantity, to_char(item.money_yuan, 'FM999999999999990.00') AS money_yuan, \n" +
                "info.total_money_yuan, item.item_color, item.item_size, item.item_more_info, \n" +
                "info.total_money_dollor, info.detail_insp, info.default_pic, info.add_pic, \n" +
                "info.poly_bag, info.safety_bag, info.remove_box, info.simple_clearance, info.island_mountain, \n" +
                "info.insp_req, info.photo_req, info.center_req, to_char(a.reg_date, 'yyyy-MM-dd hh:mi') AS reg_date, \n" +
                "to_char(a.processing_date, 'yyyy-MM-dd hh:mi') AS processing_date \n" +
                "FROM jebi_order a, jebi_order_item item, \n" +
                "jebi_order_info info, jebi_status_list stat, \n" +
                "jebi_clearance_list c \n" +
                "WHERE a.table_no = '"+table_no+"' AND a.order_no = '"+order_no+"' \n" +
                "AND item.order_no = a.order_no AND item.table_no = a.table_no AND \n" +
                "info.table_no = a.table_no AND stat.status_code = item.status_code AND \n" +
                "item.clearance_code = c.no";

        util.runQuery(query, debugMethod, 0);

        try {
            if(util.getRs().next()) {
                String status_name = util.getRs().getString("status_name");
                String dlvr_method = util.getRs().getString("dlvr_method");
                String agent_type = util.getRs().getString("agent_type");
                String svc_dvs = util.getRs().getString("svc_dvs");
                String reg_kor_name = util.getRs().getString("reg_kor_name");
                String reg_eng_name = util.getRs().getString("reg_eng_name");
                String person_ctms_no = util.getRs().getString("person_ctms_no");
                String reg_mob_no = util.getRs().getString("reg_mob_no");
                String cons_zip = util.getRs().getString("cons_zip");
                String cons_addr = util.getRs().getString("cons_addr");
                String cons_addr_det = util.getRs().getString("cons_addr_det");
                String dlvr_req = util.getRs().getString("dlvr_req");
                String tracking_no = util.getRs().getString("tracking_no");
                String clearance = util.getRs().getString("clearance");
                String clearance_category = util.getRs().getString("clearance_category");
                String clearance_name = util.getRs().getString("clearance_name");
                String item_name = util.getRs().getString("item_name");
                String item_url = util.getRs().getString("item_url");
                String item_img_utl = util.getRs().getString("item_img_url");
                String quantity = util.getRs().getString("quantity");
                String money_yuan = util.getRs().getString("money_yuan");
                String total_money_yuan = util.getRs().getString("total_money_yuan");
                String item_color = util.getRs().getString("item_color");
                String item_size = util.getRs().getString("item_size");
                String item_more_info = util.getRs().getString("item_more_info");
                String total_money_dollor = util.getRs().getString("total_money_dollor");
                String detail_insp = util.getRs().getString("detail_insp");
                String default_pic = util.getRs().getString("default_pic");
                String add_pic = util.getRs().getString("add_pic");
                String poly_bag = util.getRs().getString("poly_bag");
                String safety_bag = util.getRs().getString("safety_bag");
                String remove_box = util.getRs().getString("remove_box");
                String simple_clearance = util.getRs().getString("simple_clearance");
                String island_mountain = util.getRs().getString("island_mountain");
                String insp_req = util.getRs().getString("insp_req");
                String photo_req = util.getRs().getString("photo_req");
                String center_req = util.getRs().getString("center_req");
                String reg_date = util.getRs().getString("reg_date");
                String processing_date = util.getRs().getString("processing_date");

                dto = new AgentOrderDTO(table_no, dlvr_method, reg_kor_name, reg_eng_name, cons_zip, cons_addr, cons_addr_det, person_ctms_no, reg_mob_no,
                        dlvr_req, total_money_yuan, total_money_dollor, svc_dvs, detail_insp, default_pic, add_pic, poly_bag, safety_bag, remove_box, simple_clearance,
                        island_mountain, insp_req, photo_req, center_req, order_no, status_name, tracking_no, item_name, quantity, money_yuan, item_color, item_size,
                        item_more_info, item_url, item_img_utl, agent_type, clearance, clearance_category, clearance_name, reg_date, processing_date);
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return dto;
    }

    // 주문 신청 현황 주문문의
    public ArrayList<OrderReplyDTO> getOrderReply(String table_no, String reg_date) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        ArrayList<OrderReplyDTO> list = new ArrayList<>();
        String query = "SELECT a.no, a.comment_content, b.kor_name AS comment_reg_name, a.comment_reg_id, \n" +
                "to_char(a.comment_reg_date, 'yyyy-MM-dd') AS comment_reg_date \n" +
                "FROM jebi_order_reply a, jebi_member b, jebi_order c \n" +
                "WHERE a.COMMENT_REG_ID = b.ID AND c.table_no = a.TABLE_NO AND c.table_no = '"+table_no+"' AND to_char(a.comment_reg_date, 'yyyy-MM-dd') = '"+reg_date+"' \n" +
                "ORDER BY a.comment_reg_date ASC";

        util.runQuery(query, debugMethod, 0);
        try {
            while(util.getRs().next()) {
                String no = util.getRs().getString("no");
                String comment_content = util.getRs().getString("comment_content");
                String comment_reg_name = util.getRs().getString("comment_reg_name");
                String comment_reg_id = util.getRs().getString("comment_reg_id");
                String comment_reg_date = util.getRs().getString("comment_reg_date");

                list.add(new OrderReplyDTO(no, comment_content, comment_reg_id, comment_reg_date, comment_reg_name, table_no));
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return list;
    }

    // 날짜별 주문문의 댓글 수 조회
    public ArrayList<OrderReplyDTO> getReplyDate(String table_no) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        ArrayList<OrderReplyDTO> list = new ArrayList<>();
        String query = "SELECT to_char(comment_reg_date, 'yyyy-MM-dd') AS reg_date, COUNT(comment_content) AS cnt FROM jebi_order_reply \n" +
                "WHERE table_no = '"+table_no+"' \n" +
                "GROUP BY to_char(comment_reg_date, 'yyyy-MM-dd')";
        util.runQuery(query, debugMethod, 0);

        try {
            while(util.getRs().next()) {
                String comment_reg_date = util.getRs().getString("reg_date");
                int comment_count = util.getRs().getInt("cnt");

                list.add(new OrderReplyDTO(table_no, comment_reg_date, comment_count));
            }
        } catch (SQLException e) {
            util.viewErr(debugMethod);
        } finally {
            util.closeDB();
        }

        return list;
    }

    // 주문 문의 등록
    public int insertOrderReply(OrderReplyDTO dto) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "INSERT INTO jebi_order_reply\n" +
                "(NO, COMMENT_CONTENT, COMMENT_REG_ID, COMMENT_REG_DATE, TABLE_NO)\n" +
                "VALUES((SELECT NVL2(MAX(no), MAX(no)+1, '1') FROM jebi_order_reply), ?, '"+dto.getComment_reg_id()+"', \n" +
                "CURRENT_TIMESTAMP, '"+dto.getTable_no()+"')";

        return util.runQuery(query, debugMethod, dto.getComment_content());
    }



    // 배송대행
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

    // 배송대행 신청
    public int doRequestDeliveryAgent(DlvrOrderItemDTO itemDTO, DlvrOrderInfoDTO infoDTO, String id) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "INSERT INTO jebi_order (table_no, order_no, agent_type, reg_id, reg_date) \n" +
                "VALUES('"+itemDTO.getTable_no()+"', '"+itemDTO.getOrder_no()+"', '"+infoDTO.getAgent_type()+"', '"+id+"', CURRENT_TIMESTAMP)";
        int result = util.runQuery(query, debugMethod, 1);

        if(result == 1) return doInsertOrderItem(itemDTO, infoDTO);
        else return 0;
    }

    // 배송대행 아이템 디비 집어넣기
    private int doInsertOrderItem(DlvrOrderItemDTO dto, DlvrOrderInfoDTO infoDTO) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "INSERT INTO jebi_order_item \n" +
                "(table_no, order_no, status_code, tracking_no, clearance_code, item_eng_name, quantity, money_yuan, item_color, \n" +
                "item_size, item_more_info, item_brand, item_url, item_img_url) \n" +
                "VALUES('"+dto.getTable_no()+"', '"+dto.getOrder_no()+"', '"+dto.getStatus_code()+"', \n" +
                "'"+dto.getTracking_no()+"', '"+dto.getClearance_code()+"', '"+dto.getItem_eng_name()+"', \n" +
                "'"+dto.getQuantity()+"' ,'"+dto.getMoney_yuan()+"' ,'"+dto.getItem_color()+"', \n" +
                "'"+dto.getItem_size()+"', '"+dto.getItem_more_info()+"', '"+dto.getItem_brand()+"', '"+dto.getItem_url()+"', \n" +
                "'"+dto.getItem_img_url()+"')";
        int result = util.runQuery(query, debugMethod, 1);

        if(result == 1) return doInsertOrderInfo(infoDTO);
        else return 0;
    }

    // 배송대행 정보디비 집어넣기
    private int doInsertOrderInfo(DlvrOrderInfoDTO dto) {
        String debugMethod = new Object(){}.getClass().getEnclosingMethod().getName();

        String query = "INSERT INTO jebi_order_info \n" +
                "(table_no, dlvr_method, reg_kor_name, reg_eng_name, cons_zip, cons_addr, cons_addr_det, person_ctms_no, \n" +
                "reg_mob_no, dlvr_req, total_quantity, total_money_yuan, total_money_dollor, svc_dvs, detail_insp, \n" +
                "default_pic, add_pic, poly_bag, safety_bag, remove_box, simple_clearance, island_mountain, insp_req, \n" +
                "photo_req, center_req) \n" +
                "VALUES('"+dto.getTable_no()+"', '"+dto.getDlvr_method()+"', '"+dto.getReg_kor_name()+"', \n" +
                "'"+dto.getReg_eng_name()+"', '"+dto.getCons_zip()+"', '"+dto.getCons_addr()+"', \n" +
                "'"+dto.getCons_addr_det()+"', '"+dto.getPerson_ctms_no()+"', '"+dto.getReg_mob_no()+"', \n" +
                "'"+dto.getDlvr_req()+"', '"+dto.getTotal_quantity()+"', '"+dto.getTotal_money_yuan()+"', \n" +
                "'"+dto.getTotal_money_dollor()+"', '"+dto.getSvc_dvs()+"', '"+dto.getDetail_insp()+"', \n" +
                "'"+dto.getDefault_pic()+"', '"+dto.getAdd_pic()+"', '"+dto.getPoly_bag()+"', '"+dto.getSafety_bag()+"', \n" +
                "'"+dto.getRemove_box()+"', '"+dto.getSimple_clearance()+"', '"+dto.getIsland_mountain()+"', \n" +
                "'"+dto.getInsp_req()+"', '"+dto.getPhoto_req()+"', '"+dto.getCenter_req()+"')";

        return util.runQuery(query, debugMethod, 1);
    }
}