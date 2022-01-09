<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        function naverLogout() {
            naverLogin.logout();
        }
        window.Kakao.init('ea9b16978914214066b5b86cbe93e844');
        function kakaoLogout() {
            if (!Kakao.Auth.getAccessToken()) {
                console.log('Not logged in.');
                return;
            }
            Kakao.Auth.logout(function(response) {
                alert(response +' logout');
                window.location.href='/'
            });
        };
    </script>
    <title>제비 - 배송대행</title>
</head>
<body>
    <form method="post" name="urldirect">
        <input type="hidden" name="separate">
        <input type="hidden" name="no">
    </form>
    <!-- Header Start -->
    <div id="header">
        <div class="btn-login">
            <ul class="menu-login">
                <c:if test="${not empty session_name}">
                    <!-- Messages -->
                    <div class="header-notifications">
                        <div class="header-notifications-trigger">
                            <a href="javascript:void(0)">
                                <i class="far fa-envelope"></i>
                                <span>0</span>
                            </a>
                        </div>
                        <!-- Dropdown -->
                        <div class="header-notifications-dropdown">
                            <div class="header-notifications-headline">
                                <h4>읽지 않은 쪽지</h4>
                            </div>
                            <div class="header-notifications-content">
                                <div class="header-notifications-scroll" data-simplebar="init" style="height: auto;">
                                    <div class="simplebar-track vertical" style="visibility: visible; display: none;">
                                        <div class="simplebar-scrollbar" style="visibility: visible; top: 0px; height: 25px;"></div>
                                    </div>
                                    <div class="simplebar-track horizontal" style="visibility: visible; display: none;">
                                        <div class="simplebar-scrollbar" style="visibility: visible; left: 0px; width: 25px;"></div>
                                    </div>
                                    <div class="simplebar-scroll-content" style="padding-right: 17px; margin-bottom: -34px;">
                                        <div class="simplebar-content" style="padding-bottom: 17px; margin-right: -17px;">
                                            <ul>
                                                <!-- Notification -->
                                                <li class="notifications-not-read">
                                                    <div class="notification-text">
                                                        <strong>쪽지가 없습니다.</strong>
                                                        <p class="notification-msg-text"></p>
                                                        <span class="color"></span>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a href="javascript:void(0)" onclick="setTimeout(function(){goSite('mail')}, 150)" data-animation="ripple" class="header-notifications-button ripple-effect button-sliding-icon">
                                쪽지 전체 보기
                                <i class="fas fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>

                    <li><a href="">${session_name} <c:if test="${session_level eq 'top'}"><span>(관리자)</span></c:if><c:if test="${session_level ne 'top'}"><span>(일반)</span></c:if></a></li>
                    <li><a href="">예치금 <span>(0)</span></a></li>
                    <li><a href="">결제대기 <span>(0)</span></a></li>
                    <li><a href="javascript:goSite('cs')">고객센터</a></li>
                    <li><a href="javascript:goSite('logout')" <c:if test="${session_social eq 'naver'}">onclick="naverLogout()"</c:if> <c:if test="${session_social eq 'kakao'}">onclick="kakaoLogout()"</c:if> class="logout">Logout</a></li>
                </c:if>
                <c:if test="${empty session_name}">
                    <li><a href="javascript:goSite('login')">로그인</a></li>
                    <li><a href="javascript:goSite('join')">회원가입</a></li>
                    <li><a href="javascript:goSite('cs')">고객센터</a></li>
                </c:if>
            </ul>
        </div>

        <div class="img-logo">
            <a href="/jebi">
                <img src="images/logo.png" height="100px">
            </a>
        </div>

        <div class="btn-menu">
            <ul class="menu-main">
                <li><a href="javascript:goSite('infouse')"      id="infoUse">이용안내</a></li>
                <li><a href="cost_guide/shipping_list.html"     id="shipList">비용안내</a></li>
                <li><a href="company_agent/delivery_agent.html" id="deliveryAgent">배송대행</a></li>
                <li><a href="company_agent/purchase_agent.html" id="purchaseAgent">구매대행</a></li>
                <li><a href="javascript:goSite('cs')"           id="csCenter">고객센터</a></li>
                <li><a href="javascript:goSite('mypage')"       id="myPage">마이페이지</a></li>
            </ul>
        </div>   
    </div>
    <!-- Header End -->

    <!-- url 연결 스크립트 -->
    <script src="js/gosite.js"></script>

    <script>
        $(document).ready(function () {
            $("#header .header-notifications .header-notifications-trigger a").click(function () { 
                $("#header .header-notifications").toggleClass("active");
            });
        });
    </script>