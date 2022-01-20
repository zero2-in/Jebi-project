package com.jebi.command.deliveryagent;

import com.jebi.common.Command;
import com.jebi.dao.MemberDAO;
import com.jebi.dao.OrderStatusDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class DeliveryWrite implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        MemberDAO memberDao = new MemberDAO();
        OrderStatusDAO dao = new OrderStatusDAO();

        String logi_center = request.getParameter("t_center");      // 물류센터
        String dlvr_way = request.getParameter("dlvr_way");         // 운송방식 1: 항공, 2: 해운

        HttpSession session = request.getSession();

        request.setAttribute("logi_center", logi_center);
        request.setAttribute("dlvr_way", dlvr_way);
        request.setAttribute("member_dto", memberDao.getMyList((String)session.getAttribute("session_id")));
        request.setAttribute("ckbase_dto", dao.getCkbaseInfo((String)session.getAttribute("session_id")));
        request.setAttribute("clearance_list", dao.getClearanceList());
    }
}