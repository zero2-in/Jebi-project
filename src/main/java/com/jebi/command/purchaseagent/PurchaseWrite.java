package com.jebi.command.purchaseagent;

import com.jebi.common.Command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PurchaseWrite implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");

        String logi_center = request.getParameter("t_center");      // 물류센터
        String dlvr_way = request.getParameter("dlvr_way");         // 운송방식 1: 항공, 2: 해운

        request.setAttribute("logi_center", logi_center);
        request.setAttribute("dlvr_way", dlvr_way);
    }
}
