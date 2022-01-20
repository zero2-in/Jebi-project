function goSite(arg) {
    switch(arg) {
        // 로그인
        case "login" : {
            urldirect.action = "Member";
            urldirect.submit();
            break;
        }
        // 회원가입
        case "join" : {
            urldirect.separate.value = "join";
            urldirect.action = "Member";
            urldirect.submit();
            break;
        }
        // 로그아웃
        case "logout" : {
            urldirect.action = "Member";
            urldirect.separate.value = "logout";
            urldirect.submit();
            break;
        }
        // 고객센터
        case "cs" : {
            urldirect.action = "Notice";
            urldirect.submit();
            break;
        }
        // 공지사항
        case "notice" : {
            urldirect.action = "Notice";
            urldirect.submit();
            break;
        }
        //자주하는질문
        case "faq" : {
            urldirect.action = "Faq";
            urldirect.submit();
            break;
        }
        // 1:1문의
        case "qna" : {
            urldirect.action = "Qna";
            urldirect.submit();
            break;
        }
        // 이용후기
        case "review" : {
            urldirect.action = "Review";
            urldirect.submit();
            break;
        }
        // 이벤트
        case "event" : {
            urldirect.action = "Event";
            urldirect.submit();
            break;
        }
        // 노데이터
        case "nodata" : {
            urldirect.action = "Nodata";
            urldirect.submit();
            break;
        }
        // 통관조회
         case "clearance" : {
            urldirect.action = "Clearance";
            urldirect.submit();
            break;
        }
        // 이용안내
        case "infouse" : {
            urldirect.action = "InformationUse";
            urldirect.submit();
            break;
        }
        // 배송대행서비스안내
        case "delivery_agent_service_list" : {
            urldirect.action = "InformationUse";
            urldirect.separate.value = "delivery_agent_service_list";
            urldirect.submit();
            break;
        }
        // 배송대행신청서 작성법
        case "delivery_agent_application_manual_list" : {
            urldirect.action = "InformationUse";
            urldirect.separate.value = "delivery_agent_application_manual_list";
            urldirect.submit();
            break;
        }
        // 구매대행서비스안내
        case "purchasing_agent_service_list" : {
            urldirect.action = "InformationUse";
            urldirect.separate.value = "purchasing_agent_service_list";
            urldirect.submit();
            break;
        }
        // 구매대행신청서작성법
        case "purchasingagent_agent_application_manual_list": {
            urldirect.action = "InformationUse";
            urldirect.separate.value = "purchasingagent_agent_application_manual_list";
            urldirect.submit();
            break;
        }
        //사업자이용안내
        case "business_user_guide_list" : {
            urldirect.action = "InformationUse";
            urldirect.separate.value = "business_user_guide_list";
            urldirect.submit();
            break;
        }
        //가입방법
        case "joni_manual_list" : {
            urldirect.action = "InformationUse";
            urldirect.separate.value = "joni_manual_list";
            urldirect.submit();
            break;
        }
        //주소설정하기
        case "address_manual_list" : {
            urldirect.action = "InformationUse";
            urldirect.separate.value = "address_manual_list";
            urldirect.submit();
            break;
        }
        //구매결제하기
        case "purchase_payment_list" : {
            urldirect.action = "InformationUse";
            urldirect.separate.value = "purchase_payment_list";
            urldirect.submit();
            break;
        }
        //반품환불방법
        case "return_refund_manual_list" : {
            urldirect.action = "InformationUse";
            urldirect.separate.value = "return_refund_manual_list";
            urldirect.submit();
            break;
        }
        //송장번호확인하기
        case "invoice_number_list" : {
            urldirect.action = "InformationUse";
            urldirect.separate.value = "invoice_number_list";
            urldirect.submit();
            break;
        }
        //주문자동등록방법
        case "automatic_order_registration_list" : {
            urldirect.action = "InformationUse";
            urldirect.separate.value = "automatic_order_registration_list";
            urldirect.submit();
            break;
        }
        //중국사이즈 조건표
        case "chinese_size_condition_table_list" : {
            urldirect.action = "InformationUse";
            urldirect.separate.value = "chinese_size_condition_table_list";
            urldirect.submit();
            break;
        }
        //중국내배송조회
        case "chinese_delivery_tracking_list" : {
            urldirect.action = "InformationUse";
            urldirect.separate.value = "chinese_delivery_tracking_list";
            urldirect.submit();
            break;
        }
        //개인통관고유부호발급방법
        case "issuance_of_unique_number_list" : {
            urldirect.action = "InformationUse";
            urldirect.separate.value = "issuance_of_unique_number_list";
            urldirect.submit();
            break;
        }
        //관부가세안내
        case "customs_duty_list" : {
            urldirect.action = "InformationUse";
            urldirect.separate.value = "customs_duty_list";
            urldirect.submit();
            break;
        }
        // 수입금지품목
        case "import_prohibited_items_list" : {
            urldirect.action = "InformationUse";
            urldirect.separate.value = "import_prohibited_items_list";
            urldirect.submit();
            break;
        }
        // 노데이터처리방법
        case "nodata_processing_manual_list" : {
            urldirect.action = "InformationUse";
            urldirect.separate.value = "nodata_processing_manual_list";
            urldirect.submit();
            break;
        }

        // 비용안내
        case "shipping" : {
            urldirect.action = "Shipping";
            urldirect.submit();
            break;
        }
        // 배송비(해운)
        case "shipping_list" : {
            urldirect.action = "Shipping";
            urldirect.separate.value = "shipping_list";
            urldirect.submit();
            break;
        }
        // 배송비(항공)
        case "airlines_list" : {
            urldirect.action = "Shipping";
            urldirect.separate.value = "airlines_list";
            urldirect.submit();
            break;
        }
        // 부가서비스
        case "add_ons_list" : {
            urldirect.action = "Shipping";
            urldirect.separate.value = "add_ons_list";
            urldirect.submit();
            break;
        }
        // 구매대행수수료
        case "purchasing_agency_fee_list" : {
            urldirect.action = "Shipping";
            urldirect.separate.value = "purchasing_agency_fee_list";
            urldirect.submit();
            break;
        }

        // 마이페이지
        case "mypage" : {
            urldirect.action = "OrderStatus";
            urldirect.submit();
            break;
        }
        // 쪽지, 메일함
        case "mail" : {
            urldirect.action = "Mypage";
            urldirect.separate.value = "mail";
            urldirect.submit();
            break;
        }
        
        // 배송대행 신청서 작성 페이지
        case "delivery" : {
            urldirect.action = "DeliveryAgent";
            urldirect.submit();
            break;
        }
        // 구매대행 신청서 작성 페이지
        case "purchase" : {
            urldirect.action = "PurchaseAgent";
            urldirect.submit();
            break;
        }

        // 이용약관
        case "termsofuse" : {
            urldirect.action = "Termsofuse";
            urldirect.submit();
            break;
        }
        //  이용약관
        case "terms_of_use_list" : {
            urldirect.action = "Termsofuse";
            urldirect.separate.value = "terms_of_use_list";
            urldirect.submit();
            break;
        }

        // 개인정보 수집방침
        case "privacystatement" : {
            urldirect.action = "Privacystatement";
            urldirect.submit();
            break;
        }
        // 개인정보 수집방침
        case "privacy_statement_list" : {
            urldirect.action = "Privacystatement";
            urldirect.separate.value = "privacy_statement_list";
            urldirect.submit();
            break;
        }
    }
}