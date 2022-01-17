package com.jebi.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class TermsofuseController {
    @RequestMapping("Termsofuse")
    public String termsofuse(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String separate = request.getParameter("separate");
        String pageLink = "";

        if (separate == null || separate == "") separate = "terms_of_use_list";

        switch (separate) {
            // 이용약관
            case "terms_of_use_list": {
                pageLink = "terms_of_use/terms_of_use_list";
                break;
            }
            // 개인정보수집방침
            case "privacy_statement_list": {
                pageLink = "terms_of_use/privacy_statement_list";
                break;
            }
        }
        return pageLink;
    }
}

