package com.jebi.controller;

import com.jebi.command.qna.QnaList;
import com.jebi.common.Command;
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
        }

        return pageLink;
    }
}
