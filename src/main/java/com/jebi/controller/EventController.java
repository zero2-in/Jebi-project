package com.jebi.controller;

import com.jebi.command.event.EventList;
import com.jebi.command.event.EventModify;
import com.jebi.command.event.EventSave;
import com.jebi.command.event.EventView;
import com.jebi.command.notice.*;
import com.jebi.common.Command;
import com.jebi.common.CommonUtil;
import com.jebi.common.MultipartCommand;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class EventController {
    @RequestMapping("Event")
    public String event(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String separate = request.getParameter("separate");
        if (separate == null || separate.equals("")) separate = "list";
        String pageLink = "";

        switch (separate) {
            // 이벤트 리스트
            case "list": {
                Command list = new EventList();
                list.execute(request, response);
                pageLink = "event/event_list";
                break;
            }
            //  이벤트 글쓰기
            case "write" : {
                pageLink = "event/event_write";
                break;
            }
            //  이벤트 글쓰기등록
            case "save" : {
                MultipartRequest mpr = getMpr(request);
                MultipartCommand save = new EventSave();
                save.execute(mpr, request, response);
                pageLink = "common_alert_page";
                break;
            }
            // 이벤트 상세보기
            case "view" : {
                Command view = new EventView();
                view.execute(request, response);
                pageLink = "event/event_view";
                break;
            }
            // 공지사항 수정폼
            case "modify" : {
                Command modify = new EventModify();
                modify.execute(request, response);
                pageLink = "event/event_modify";
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

    // MultipartRequest 가져오기
    private MultipartRequest getMpr(HttpServletRequest request) throws IOException {
        return new MultipartRequest(request, CommonUtil.getFile_dir("event"), (1024 * 1024 * 10), "UTF-8", new DefaultFileRenamePolicy());
    }
}
