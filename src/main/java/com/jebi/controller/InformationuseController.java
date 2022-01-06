package com.jebi.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InformationuseController {
    @RequestMapping("InformationUse")
    public String informationUse(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String separate = request.getParameter("separate");
        String pageLink = "";

        if(separate == null || separate == "") separate = "informationuse_list";

        switch(separate) {
            // 이용안내 페이지
            case "informationuse_list" : {
                pageLink = "informationuse/informationuse_list";
                break;
            }
            // 배송대행 서비스 안내 페이지
            case "delivery_agent_service_list" : {
                pageLink = "informationuse/delivery_agent_service_list";
                break;
            }
            // 배송대행 신청서 작성법 페이지
            case "delivery_agent_application_manual_list" : {
                pageLink = "informationuse/delivery_agent_application_manual_list";
                break;
            }
            // 구매대행 서비스 안내 페이지
            case "purchasing_agent_service_list" : {
                pageLink = "informationuse/purchasing_agent_service_list";
                break;
            }
            // 구매대행 신청서 작성법 페이지
            case "purchasingagent_agent_application_manual_list" : {
                pageLink = "informationuse/purchasingagent_agent_application_manual_list";
                break;
            }
            // 사업자 이용안내 페이지
            case "business_user_guide_list" : {
                pageLink = "informationuse/business_user_guide_list";
                break;
            }
            // 가입방법 페이지
            case "joni_manual_list" : {
                pageLink = "informationuse/joni_manual_list";
                break;
            }
            // 주소 설정하기 페이지
            case "address_manual_list" : {
                pageLink = "informationuse/address_manual_list";
                break;
            }
            // 구매결제하기 페이지
            case "purchase_payment_list" : {
                pageLink = "informationuse/purchase_payment_list";
                break;
            }
            // 반품환불 방법 페이지
            case "return_refund_manual_list" : {
                pageLink = "informationuse/return_refund_manual_list";
                break;
            }
            // 송장번호 확인하기 페이지
            case "invoice_number_list" : {
                pageLink = "informationuse/invoice_number_list";
                break;
            }
            // 주문자동등록방법 페이지
            case "automatic_order_registration_list" : {
                pageLink = "informationuse/automatic_order_registration_list";
                break;
            }
            // 중국사이즈 조건표 페이지
            case "chinese_size_condition_table_list" : {
                pageLink = "informationuse/chinese_size_condition_table_list";
                break;
            }
            // 중국내 배송조회 페이지
            case "chinese_delivery_tracking_list" : {
                pageLink = "informationuse/chinese_delivery_tracking_list";
                break;
            }
            // 개인통관고유번호발급 방법 페이지
            case "issuance_of_unique_number_list" : {
                pageLink = "informationuse/issuance_of_unique_number_list";
                break;
            }
            // 관부가세 안내 페이지
            case "customs_duty_list" : {
                pageLink = "informationuse/customs_duty_list";
                break;
            }
            // 수입금지품목 페이지
            case "import_prohibited_items_list" : {
                pageLink = "informationuse/import_prohibited_items_list";
                break;
            }
            // 노데이터 처리방법 페이지
            case "nodata_processing_manual_list" : {
                pageLink = "informationuse/nodata_processing_manual_list";
                break;
            }

        } 

        return pageLink;
    }
}