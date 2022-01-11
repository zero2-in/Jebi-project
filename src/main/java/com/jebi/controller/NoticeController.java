package com.jebi.controller;

import com.jebi.command.notice.*;
import com.jebi.common.Command;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class NoticeController {
    @RequestMapping("Notice")
    public String notice(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String separate = request.getParameter("separate");
        if(separate == null || separate.equals("")) separate = "list";
        String pageLink = "";

        switch(separate) {
            // 공지사항 리스트
            case "list" : {
                Command list = new NoticeList();
                list.execute(request, response);
                pageLink = "notice/notice_list";
                break;
            }
            // 공지사항 보기
            case "view" : {
                Command view = new NoticeView();
                view.execute(request, response);
                pageLink = "notice/notice_view";
                break;
            }
            // 공지사항 쓰기
            case "write" : {
                pageLink = "notice/notice_write";
                break;
            }
            // 공지사항 등록
            case "save" : {
                Command save = new NoticeSave();
                save.execute(request, response);
                pageLink = "common_alert_page";
                break;
            }
            // 공지사항 수정폼
            case "modify" : {
                Command modify = new NoticeModify();
                modify.execute(request, response);
                pageLink = "notice/notice_modify";
                break;
            }
            // 공지사항 수정
            case "update" : {
                Command update = new NoticeUpdate();
                update.execute(request, response);
                pageLink = "common_alert_page";
                break;
            }
            // 공지사항 삭제
            case "delete" : {
                Command delete = new NoticeDelete();
                delete.execute(request, response);
                pageLink = "common_alert_page";
                break;
            }
        }

        return pageLink;
    }
}
