package com.jebi.controller;

import com.jebi.command.event.EventDelete;
import com.jebi.command.event.EventModify;
import com.jebi.command.event.EventUpdate;
import com.jebi.command.event.EventView;
import com.jebi.command.review.*;
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
public class ReviewController {
    @RequestMapping(value="Review")
    public String review(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String separate = request.getParameter("separate");
        if(separate == null || separate.equals("")) separate = "list";
        String pageLink = "";

        switch(separate) {
            //  리뷰 리스트
            case "list": {
                Command list = new ReviewList();
                list.execute(request, response);
                pageLink = "review/review_list";
                break;
            }
            //  리뷰 글쓰기
            case "write": {
                pageLink = "review/review_write";
                break;
            }
            //  리뷰 글쓰기등록
            case "save" : {
                MultipartRequest mpr = getMpr(request);
                MultipartCommand save = new ReviewSave();
                save.execute(mpr, request, response);
                pageLink = "common_alert_page";
                break;
            }
            // 리뷰 상세보기
            case "view" : {
                Command view = new ReviewView();
                view.execute(request, response);
                pageLink = "review/review_view";
                break;
            }
            // 리뷰 수정폼
            case "modify" : {
                Command modify = new ReviewModify();
                modify.execute(request, response);
                pageLink = "review/review_modify";
                break;
            }
            // 리뷰 수정
            case "update" : {
                MultipartRequest mpr = getMpr(request);
                MultipartCommand update = new ReviewUpdate();
                update.execute(mpr, request, response);
                pageLink = "common_alert_page";
                break;
            }
            // 리뷰 삭제
            case "delete" : {
                Command delete = new ReviewDelete();
                delete.execute(request, response);
                pageLink = "common_alert_page";
                break;
            }


        }

            return pageLink;
    }
    // MultipartRequest 가져오기
    private MultipartRequest getMpr(HttpServletRequest request) throws IOException {
        return new MultipartRequest(request, CommonUtil.getFile_dir("review"), (1024 * 1024 * 10), "UTF-8", new DefaultFileRenamePolicy());
    }
}
