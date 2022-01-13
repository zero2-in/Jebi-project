package com.jebi.controller;

import com.jebi.command.qna.*;
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
public class QnaController {
    @RequestMapping("Qna")
    public String qna(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String separate = request.getParameter("separate");
        if(separate == null || separate.equals("")) separate = "list";
        String pageLink = "";

        switch(separate) {
            case "list" : {
                Command list = new QnaList();
                list.execute(request, response);
                pageLink = "qna/qna_list";
                break;
            }
            // 1:1문의 글쓰기
            case "write" : {
                Command write = new QnaWrite();
                write.execute(request, response);
                pageLink = "qna/qna_write";
                break;
            }
            // 1:1문의 저장
            case "save" : {
                MultipartRequest mpr = getMpr(request);
                MultipartCommand save = new QnaSave();
                save.execute(mpr, request, response);
                pageLink = "common_alert_page";
                break;
            }
            // 1:1문의 뷰
            case "view" : {
                Command view = new QnaView();
                view.execute(request, response);
                pageLink = "qna/qna_view";
                break;
            }
            // 1:1문의 수정폼
            case "modify" : {
                Command modify = new QnaModify();
                modify.execute(request, response);
                pageLink = "qna/qna_modify";
                break;
            }
            // 1:1문의 수정
            case "update" : {
                MultipartRequest mpr = getMpr(request);
                MultipartCommand update = new QnaUpdate();
                update.execute(mpr, request, response);
                pageLink = "common_alert_page";
                break;
            }
            // 1:1문의 삭제
            case "delete" : {
                Command delete = new QnaDelete();
                delete.execute(request, response);
                pageLink = "common_alert_page";
                break;
            }
        }

        return pageLink;
    }

    @RequestMapping("QnaReply")
    public void qnaReply(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Command reply = new QnaReply();
        reply.execute(request, response);
    }

    @RequestMapping("QnaDeleteReply")
    public void deleteReply(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Command delete = new QnaDeleteReply();
        delete.execute(request, response);
    }

    private MultipartRequest getMpr(HttpServletRequest request) throws IOException {
        return new MultipartRequest(request, CommonUtil.getFile_dir("qna"), (1024 * 1024 * 10), "UTF-8", new DefaultFileRenamePolicy());
    }
}
