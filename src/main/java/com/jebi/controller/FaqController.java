package com.jebi.controller;

import com.jebi.command.faq.*;
import com.jebi.command.notice.*;
import com.jebi.common.Command;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class FaqController {
    @RequestMapping("Faq")
    public String faq(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String separate = request.getParameter("separate");
        System.out.println(separate);
        if(separate == null || separate.equals("")) separate = "list";
        String pageLink = "";

        switch(separate) {
            // 자주하는질문 리스트
            case "list" : {
                Command list = new FaqList();
                list.execute(request, response);
                pageLink = "faq/faq_list";
                break;
            }
            // 자주하는질문 상세보기
            case "view" : {
                Command view = new FaqView();
                view.execute(request, response);
                pageLink = "faq/faq_view";
                break;
            }
            // 자주하는질문 글쓰기
            case "write" : {
                Command write = new FaqWrite();
                write.execute(request, response);
                pageLink = "faq/faq_write";
                break;
            }
            // 자주하는질문 글등록
            case "save" : {
                Command save = new FaqSave();
                save.execute(request, response);
                pageLink = "common_alert_page";
                break;
            }
            // 자주하는질문 수정폼
            case "modify" : {
                Command modify = new FaqModify();
                modify.execute(request, response);
                pageLink = "faq/faq_modify";
                break;
            }
            // 자주하는질문 수정
            case "update" : {
                Command update = new FaqUpdate();
                update.execute(request, response);
                pageLink = "common_alert_page";
                break;
            }
            // 자주하는질문 삭제
            case "delete" : {
                Command delete = new FaqDelete();
                delete.execute(request, response);
                pageLink = "common_alert_page";
                break;
            }
        }

        return pageLink;
    }
}

