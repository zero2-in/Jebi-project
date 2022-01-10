package com.jebi.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jebi.command.notice.NoticeList;
import com.jebi.command.notice.NoticeView;
import com.jebi.common.Command;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CSCenterController {
    @RequestMapping("CSCenter")
    public String csCenter(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String separate = request.getParameter("separate");
        if(separate == null || separate.equals("")) separate = "notice";
        String pageLink = "";

        switch(separate) {
            // 공지사항 리스트
            case "notice" : {
                Command list = new NoticeList();
                list.execute(request, response);
                pageLink = "notice/notice_list";
                break;
            }
            // 공지사항 보기
            case "notice-view" : {
                Command view = new NoticeView();
                view.execute(request, response);
                pageLink = "notice/notice_view";
                break;
            }
        }

        return pageLink;
    }
}
