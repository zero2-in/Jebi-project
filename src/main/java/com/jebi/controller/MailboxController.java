package com.jebi.controller;

import com.jebi.command.mailbox.MailboxList;
import com.jebi.command.mailbox.MailboxView;
import com.jebi.common.Command;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class MailboxController {
    @RequestMapping(value = "Mailbox")
    public String mailBox(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String separate = request.getParameter("separate");
        String pageLink = "";
        if(separate == null || separate.equals("")) separate = "list";

        switch(separate) {
            case "list" : {
                Command list = new MailboxList();
                list.execute(request, response);
                pageLink = "mypage/mailbox";
                break;
            }
            case "content" : {
                Command view = new MailboxView();
                view.execute(request, response);
                pageLink = "mypage/mailbox_popup";
                break;
            }
        }

        return pageLink;
    }
}
