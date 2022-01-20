package com.jebi.command.deliveryagent;

import com.jebi.common.Command;
import com.jebi.dao.OrderStatusDAO;
import com.jebi.dto.DlvrOrderInfoDTO;
import com.jebi.dto.DlvrOrderItemDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class DeliveryDoRequest implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String logi_center = request.getParameter("t_logi_center");
        String dlvr_way = request.getParameter("t_dlvr_way");
        if(dlvr_way.equals("1")) dlvr_way = "plane";
        if(dlvr_way.equals("2")) dlvr_way = "ship";
        String kor_name = request.getParameter("t_kor_name");
        String eng_name = request.getParameter("t_eng_name");

        //String ctms_dvs = request.getParameter("ctms_dvs");
        String person_ctms_no = request.getParameter("person_ctms_no");
        String mobile = request.getParameter("t_mobile");

        String zip = request.getParameter("t_zip");
        String address = request.getParameter("t_address_1");
        String address_det = request.getParameter("t_address_2");
        String dlvr_req = request.getParameter("t_dlvr_req");
        if(dlvr_req == null) dlvr_req = "";

        String shop_no = request.getParameter("t_shop_no");
        String tracking_no = request.getParameter("t_tracking_no");
        String clearance_code = request.getParameter("t_item_seq");
        String item_eng_name = request.getParameter("t_item_eng_name");
        String quantity = request.getParameter("t_quantity");
        String amount = request.getParameter("t_amount");
        String color = request.getParameter("t_color");
        String size = request.getParameter("t_size");
        String option_more_info = request.getParameter("t_shop_site");
        if(option_more_info == null) option_more_info = "";
        String brand = request.getParameter("t_brand");
        if(brand == null) brand = "";
        String shop_url = request.getParameter("t_shop_url");
        String img_url = request.getParameter("t_img_url");

        String total_pro_qty = request.getParameter("TOTAL_PRO_QTY");
        String total_pro_cost = request.getParameter("TOTAL_PRO_COST");
        String total_pro_cost_usd = request.getParameter("TOTAL_PRO_COST_USD");

        String svc_dvs = request.getParameter("svc_dvs");
        if(svc_dvs.equals("1")) svc_dvs = "auto";
        if(svc_dvs.equals("2")) svc_dvs = "manual";

        String detail_insp = request.getParameter("detail_insp");
        if(detail_insp == null) detail_insp = "N";
        else if(detail_insp.equals("detail")) detail_insp = "Y";
        String default_pic = request.getParameter("default_pic");
        if(default_pic == null) default_pic = "N";
        else if(default_pic.equals("default")) default_pic = "Y";
        String add_pic = request.getParameter("add_pic");
        if(add_pic == null) add_pic = "N";
        else if(add_pic.equals("more")) add_pic = "Y";
        String insp_req = request.getParameter("insp_req");
        if(insp_req == null) insp_req = "";
        String photo_req = request.getParameter("photo_req");
        if(photo_req == null) photo_req = "";
        String poly_bag = request.getParameter("poly_bag");
        if(poly_bag == null) poly_bag = "N";
        else if(poly_bag.equals("poly")) poly_bag = "Y";
        String safety_bag = request.getParameter("safety_bag");
        if(safety_bag == null) safety_bag = "N";
        else if(safety_bag.equals("safety")) safety_bag = "Y";
        String remove_box = request.getParameter("remove_box");
        if(remove_box == null) remove_box = "N";
        else if(remove_box.equals("box_remove")) remove_box = "Y";
        String simple_clearance = request.getParameter("simple_clearance");
        if(simple_clearance == null) simple_clearance = "N";
        else if(simple_clearance.equals("simple_cl")) simple_clearance = "Y";
        String island_mountain = request.getParameter("island_mountain");
        if(island_mountain == null) island_mountain = "N";
        else if(island_mountain.equals("mountain_area")) island_mountain = "Y";
        String center_req = request.getParameter("center_req");
        if(center_req == null) center_req = "";

        HttpSession session = request.getSession();

        String reg_id = (String)session.getAttribute("session_id");
        OrderStatusDAO dao = new OrderStatusDAO();

        String table_no = dao.getMaxTable_no();

        DlvrOrderInfoDTO infoDTO = new DlvrOrderInfoDTO(table_no, dlvr_way, kor_name, eng_name, zip, address, address_det, person_ctms_no, mobile, dlvr_req, total_pro_qty, total_pro_cost, total_pro_cost_usd, svc_dvs, detail_insp, default_pic, add_pic, poly_bag, safety_bag, remove_box, simple_clearance, island_mountain, insp_req, photo_req, center_req);
        DlvrOrderItemDTO itemDTO = new DlvrOrderItemDTO(table_no, shop_no, "D2", tracking_no, clearance_code, item_eng_name, quantity, amount, color, size, option_more_info, brand, shop_url, img_url);

        int result = dao.doRequestDeliveryAgent(itemDTO, infoDTO, reg_id);

        String msg = result==1? "배송대행신청이 완료되었습니다." : "배송대행 신청에 실패했습니다.";

        request.setAttribute("msg", msg);
        request.setAttribute("url", "OrderStatus");
    }
}
