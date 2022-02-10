package com.jebi.command.orderstatus;

import com.jebi.common.Command;
import com.jebi.dao.MemberDAO;
import com.jebi.dao.OrderStatusDAO;
import com.jebi.dto.OrderStatusSearchDTO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class OrderStatusList implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        MemberDAO memberDao = new MemberDAO();
        OrderStatusDAO dao = new OrderStatusDAO();

        HttpSession session = request.getSession();
        String id = (String)session.getAttribute("session_id");

        // 검색
        String agentType = request.getParameter("AGENT_TYPE");
        if(agentType == null) agentType = "";
        String statusCode = request.getParameter("STATUS_CODE");
        if(statusCode == null) statusCode = "";
        String svc_dvs = request.getParameter("SVC_DVS");
        if(svc_dvs == null) svc_dvs = "";
        String orderNo = request.getParameter("ORDER_NO");
        if(orderNo == null) orderNo = "";
        String trackingNo = request.getParameter("TRACKING_NO");
        if(trackingNo == null) trackingNo = "";
        String reg_kor_name = request.getParameter("REG_KOR_NAME");
        if(reg_kor_name == null) reg_kor_name = "";
        String item_eng_name = request.getParameter("ITEM_ENG_NAME");
        if(item_eng_name == null) item_eng_name = "";
        OrderStatusSearchDTO searchDTO = new OrderStatusSearchDTO(agentType, statusCode, svc_dvs, orderNo, trackingNo, reg_kor_name, item_eng_name);

        request.setAttribute("dto", memberDao.getMyList(id));
        request.setAttribute("status_list", dao.getStatusListCategory());
        request.setAttribute("agent_list", dao.getAgentList(id, searchDTO));
        request.setAttribute("order_count", dao.getOrderCount(id));
        request.setAttribute("dao", dao);

        request.setAttribute("s_dto", searchDTO);
    }
}