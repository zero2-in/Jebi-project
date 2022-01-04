<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!-- StyleSheets -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/summernote-lite.css">

    <!-- Scripts -->
    <script src="js/slick.min.js"></script>
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/summernote-lite.js"></script>
    <script src="js/common.js"></script>
    <script src="lang/summernote-ko-KR.min.js"></script>
    <title>제비 - 배송대행</title>
</head>
<body>
    <form method="post" name="urldirect">
        <input type="hidden" name="separate">
    </form>
    <!-- Header Start -->
    <div id="header">
        <div class="btn-login">
            <ul class="menu-login">
                <li><a href="javascript:goSite('login')">로그인</a></li>
                <li><a href="javascript:goSite('join')">회원가입</a></li>
                <li><a href="javascript:goSite('cs')">고객센터</a></li>
            </ul>
        </div>

        <div class="img-logo">
            <a href="/jebi">
                <img src="images/logo.png" height="100px">
            </a>
        </div>

        <div class="btn-menu">
            <ul class="menu-main">
                <li><a href="informationuse/informationuse_list.html">이용안내</a></li>
                <li><a href="cost_guide/shipping_list.html">비용안내</a></li>
                <li><a href="company_agent/delivery_agent.html">배송대행</a></li>
                <li><a href="company_agent/purchase_agent.html">구매대행</a></li>
                <li><a href="notice/notice_list.html">고객센터</a></li>
                <li><a href="mypage/order_status.html">마이페이지</a></li>
            </ul>
        </div>   
    </div>
    <!-- Header End -->

    <script>
        function goSite(arg) {
            switch(arg) {
                case "login" : {
                    urldirect.action = "Member";
                    urldirect.submit();
                    break;
                }
                case "join" : {
                    urldirect.separate.value = "join";
                    urldirect.action = "Member";
                    urldirect.submit();
                    break;
                }
                case "cs" : {
                    urldirect.action = "CSCenter";
                    urldirect.submit();
                    break;
                }
            }
        }
    </script>