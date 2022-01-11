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
        case "faq" : {
            urldirect.action = "Faq";
            urldirect.submit();
            break;
        }
        case "qna" : {
            urldirect.action = "Qna";
            urldirect.submit();
            break;
        }
        // 이용안내
        case "infouse" : {
            urldirect.action = "InformationUse";
            urldirect.submit();
            break;
        }
        // 마이페이지
        case "mypage" : {
            urldirect.action = "Mypage";
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
    }
}