package com.jebi.command.deliveryagent;

import com.jebi.common.Command;
import com.jebi.dao.OrderStatusDAO;
import com.jebi.dto.DeliveryAddressDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class DeliveryAddressAdd implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        String cons_zip = request.getParameter("cons_zip");
        String cons_ckbaseyn = request.getParameter("cons_ckbaseyn");
        if(!cons_ckbaseyn.equals("Y")) cons_ckbaseyn = "N";
        String cons_addr = request.getParameter("cons_addr");
        String cons_addr_det = request.getParameter("cons_addr_det");
        String cons_nm_kr = request.getParameter("cons_nm_kr");
        String cons_nm_en = request.getParameter("cons_nm_en");
        String mob_no = request.getParameter("mob_no");
        String person_ctms_no = request.getParameter("person_ctms_no");

        HttpSession session = request.getSession();

        String id = (String)session.getAttribute("session_id");

        OrderStatusDAO dao = new OrderStatusDAO();
        int result = dao.insertAddress(new DeliveryAddressDTO(id, cons_zip, cons_ckbaseyn, cons_addr, cons_addr_det, cons_nm_kr, cons_nm_en, mob_no, person_ctms_no));

        if(result==1) out.print("success");
        else out.print("failed");
    }
}
