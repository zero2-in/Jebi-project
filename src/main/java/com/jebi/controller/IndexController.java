package com.jebi.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jebi.dao.DepartureDAO;
import com.jebi.dao.NoticeDAO;
import com.jebi.dao.ReviewDAO;
import com.jebi.dto.DepartureDTO;
import com.jebi.dto.NoticeDTO;
import com.jebi.dto.ReviewDTO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
    @RequestMapping(value={"/", "/jebi"})
    public String index(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ReviewDAO dao = new ReviewDAO();
        ArrayList<ReviewDTO> reviewdtos= dao.getReviewList("", 1, 1);
        request.setAttribute("reviewdtos", reviewdtos);

        NoticeDAO dao1 = new NoticeDAO();
        ArrayList<NoticeDTO> noticedtos= dao1.getNoticeList("", 1, 6);
        request.setAttribute("noticedtos", noticedtos);



        String category = request.getParameter("t_category");

        Date time = new Date();
        SimpleDateFormat format1 = new SimpleDateFormat("yyyyMM");
        String todayMonth = format1.format(time);

        ArrayList<DepartureDTO> dtos = new DepartureDAO().getDepartList(todayMonth);

        request.setAttribute("t_dtos", dtos);
        request.setAttribute("category", category);
        return "index";
    }
    // 출항스케줄 팝업창
    @RequestMapping("DepartureSchedule")
    public String DepartureSchedule() {
        return "departure_schedule";
    }


}
