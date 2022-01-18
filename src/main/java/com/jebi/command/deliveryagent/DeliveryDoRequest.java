package com.jebi.command.deliveryagent;

import com.jebi.common.Command;
import com.jebi.dao.OrderStatusDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class DeliveryDoRequest implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String logi_center = request.getParameter("t_logi_center");
        String dlvr_way = request.getParameter("dlvr_way");
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

        String shop_no = request.getParameter("t_shop_no");
        String tracking_no = request.getParameter("t_tracking_no");
        String clearance_code = request.getParameter("t_item_seq");
        String item_eng_name = request.getParameter("t_item_eng_name");
        String quantity = request.getParameter("t_quantity");
        String amount = request.getParameter("t_amount");
        String color = request.getParameter("t_color");
        String size = request.getParameter("t_size");
        String option_more_info = request.getParameter("t_shop_site");
        String brand = request.getParameter("t_brand");
        String shop_url = request.getParameter("t_shop_url");
        String img_url = request.getParameter("t_img_url");

        String svc_dvs = request.getParameter("svc_dvs");
        if(svc_dvs.equals("1")) svc_dvs = "auto";
        if(svc_dvs.equals("2")) svc_dvs = "manual";

        String detail_insp = request.getParameter("detail_insp");
        if(detail_insp.equals("detail")) detail_insp = "Y";
        else detail_insp = "N";
        String default_pic = request.getParameter("default_pic");
        if(default_pic.equals("default")) default_pic = "Y";
        else default_pic = "N";
        String add_pic = request.getParameter("add_pic");
        if(add_pic.equals("more")) add_pic = "Y";
        else add_pic = "N";
        String insp_req = request.getParameter("insp_req");
        String photo_req = request.getParameter("photo_req");
        String poly_bag = request.getParameter("poly_bag");
        if(poly_bag.equals("poly")) poly_bag = "Y";
        else poly_bag = "N";
        String safety_bag = request.getParameter("safety_bag");
        if(safety_bag.equals("safety")) safety_bag = "Y";
        else safety_bag = "N";
        String remove_box = request.getParameter("remove_box");
        if(remove_box.equals("box_remove")) remove_box = "Y";
        else remove_box = "N";
        String simple_clearance = request.getParameter("simple_clearance");
        if(simple_clearance.equals("simple_cl")) simple_clearance = "Y";
        else simple_clearance = "N";
        String island_mountain = request.getParameter("island_mountain");
        if(island_mountain.equals("mountain_area")) island_mountain = "Y";
        else island_mountain = "N";
        String center_req = request.getParameter("center_req");

        HttpSession session = request.getSession();

        String reg_id = (String)session.getAttribute("session_id");
        OrderStatusDAO dao = new OrderStatusDAO();

        String table_no = dao.getMaxTable_no();


    }
}
