<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!-- StyleSheets -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/common.css">
    <script src="js/tabcontent.js"></script>
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
        $(document).scrollTop('${scroll}');
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
        }
    </script>
    <title>제비 - 배송대행</title>
</head>
<body>
    <!-- 페이지 이동 -->
    <form method="post" name="urldirect">
        <input type="hidden" name="separate">
        <input type="hidden" name="no">
        <input type="hidden" name="attach">
        <input type="hidden" name="scroll">
        <input type="hidden" name="table_no">
        <input type="hidden" name="order_no">
    </form>
    <!-- Header Start -->
    <header id="header-container">
        <div id="header">
            <div class="btn-login">
                <ul class="menu-login">
                    <c:if test="${not empty session_name}">
                        <!-- Messages -->
                        <div class="header-notifications">
                            <div class="header-notifications-trigger">
                                <a href="javascript:void(0)">
                                    <i class="far fa-envelope"></i>
                                    <span>${session_mail.size()}</span>
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
                                            <div class="simplebar-scrollbar" style="visibility: visible; left: 0px; wilih: 25px;"></div>
                                        </div>
                                        <div class="simplebar-scroll-content" style="padding-right: 17px; margin-bottom: -34px;">
                                            <div class="simplebar-content" style="padding-bottom: 17px; margin-right: -17px;">
                                                <ul>
                                                    <c:if test="${empty session_mail}">
                                                        <!-- Notification -->
                                                        <li class="notifications-not-read">
                                                            <div class="notification-text">
                                                                <strong>쪽지가 없습니다.</strong>
                                                                <p class="notification-msg-text"></p>
                                                                <span class="color"></span>
                                                            </div>
                                                        </li>
                                                    </c:if>
                                                    <c:if test="${not empty session_mail}">
                                                        <c:forEach items="${session_mail}" begin="0" end="4" var="list">
                                                            <!-- Notification -->
                                                            <li class="notifications-not-read">
                                                                <div class="notification-text">
                                                                    <p class="notification-msg-text">${list.getTitle()}</p>
                                                                    <span class="color">${list.getReg_name()}</span>
                                                                </div>
                                                            </li>
                                                        </c:forEach>
                                                    </c:if>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <a href="javascript:void(0)" onclick="setTimeout(function(){goSite('mailbox')}, 150)" data-animation="ripple" class="header-notifications-button ripple-effect button-sliding-icon">
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
                <nav id="gnbMenu">
                    <ul class="menu-main">
                        <li><a href="javascript:goSite('infouse')"      id="infoUse">이용안내</a>
                            <ul class="dropdown-nav">
                                <li><a href="javascript:goSite('delivery_agent_service_list')">배송대행 이용방법 <i class="far fa-caret-square-right"></i></a>
                                    <ul class="dropdown-nav">
                                        <li><a href="javascript:goSite('delivery_agent_service_list')">배송대행 서비스 안내 </a></li>
                                        <li><a href="javascript:goSite('delivery_agent_application_manual_list')">배송대행 신청서 작성법 </a></li>
                                    </ul>
                                </li>
                                <li><a href="javascript:goSite('purchasing_agent_service_list')">구매대행 이용방법 <i class="far fa-caret-square-right"></i></a>
                                    <ul class="dropdown-nav">
                                        <li><a href="javascript:goSite('purchasing_agent_service_list')">구매대행 서비스 안내 </a></li>
                                        <li><a href="javascript:goSite('purchasingagent_agent_application_manual_list')">구매대행 신청서 작성법 </a></li>
                                    </ul>
                                </li>
                                <li><a href="javascript:goSite('business_user_guide_list')">사업자 이용안내</a></li>
                                <li><a href="javascript:goSite('joni_manual_list')">타오바오 이용방법 <i class="far fa-caret-square-right"></i></a>
                                    <ul class="dropdown-nav">
                                        <li><a href="javascript:goSite('joni_manual_list')">가입방법</a></li>
                                        <li><a href="javascript:goSite('address_manual_list')">주소 설정하기</a></li>
                                        <li><a href="javascript:goSite('purchase_payment_list')">구매결제하기</a></li>
                                        <li><a href="javascript:goSite('return_refund_manual_list')">반품/환불방법</a></li>
                                        <li><a href="javascript:goSite('invoice_number_list')">송장번호 확인하기</a></li>
                                        <li><a href="javascript:goSite('automatic_order_registration_list')">주문자동등록방법</a></li>
                                    </ul>
                                </li>
                                <li><a href="javascript:goSite('chinese_size_condition_table_list')">이용팁 <i class="far fa-caret-square-right"></i></a>
                                    <ul class="dropdown-nav">
                                        <li><a href="javascript:goSite('chinese_size_condition_table_list')">중국사이즈 조건표</a></li>
                                        <li><a href="javascript:goSite('chinese_delivery_tracking_list')">중국내 배송조회</a></li>
                                        <li><a href="javascript:goSite('issuance_of_unique_number_list')">개인통관고유번호발급 방법</a></li>
                                        <li><a href="javascript:goSite('customs_duty_list')">관/부가세 안내</a></li>
                                        <li><a href="javascript:goSite('import_prohibited_items_list')">수입금지품목</a></li>
                                    </ul>
                                </li>
                                <li><a href="javascript:goSite('nodata_processing_manual_list')">노데이터 처리방법</a></li>
                            </ul>
                        </li>
                        <li><a href="javascript:goSite('shipping')"     id="shipList">비용안내</a>
                            <ul class="dropdown-nav">
                                <li><a href="javascript:goSite('shipping_list')">배송비</a></li>
                                <li><a href="javascript:goSite('add_ons_list')">부가서비스</a></li>
                                <li><a href="javascript:goSite('purchasing_agency_fee_list')">구매대행 수수료</a></li>
                            </ul>
                        </li>
                        <li><a href="javascript:goSite('delivery')"     id="deliveryAgent">배송대행</a></li>
                        <li><a href="javascript:goSite('purchase')"     id="purchaseAgent">구매대행</a></li>
                        <li><a href="javascript:goSite('cs')"           id="csCenter">고객센터</a>
                            <ul class="dropdown-nav">
                                <li><a href="javascript:goSite('notice')">공지사항</a></li>
                                <li><a href="javascript:goSite('faq')">자주하는 질문</a></li>
                                <li><a href="javascript:goSite('qna')">1:1문의</a></li>
                                <li><a href="javascript:goSite('review')">이용후기</a></li>
                                <li><a href="javascript:goSite('event')">이벤트</a></li>
                                <li><a href="javascript:goSite('nodata')">노데이터</a></li>
                                <li><a href="javascript:goSite('clearance')">통관조회</a></li>
                            </ul>
                        </li>
                        <li><a href="javascript:goSite('mypage')"       id="myPage">마이페이지</a>
                            <ul class="dropdown-nav">
                                <li><a href="javascript:goSite('mypage')">주문신청현황</a></li>
                                <li><a href="javascript:goSite('')">결제관리</a></li>
                                <li><a href="javascript:goSite('')">예치금 내역</a></li>
                                <li><a href="javascript:goSite('')">포인트 내역</a></li>
                                <li><a href="javascript:goSite('')">쿠폰 내역</a></li>
                                <li><a href="javascript:goSite('')">받은 쪽지함</a></li>
                                <li><a href="javascript:goSite('myinfo')">회원정보수정</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>   
        </div>
    </header>
    <div class="clearfix"></div>
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