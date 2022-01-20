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
                <li><a href="javascript:goSite('infouse')"      id="infoUse">이용안내</a>
                    <ul class="menu-sub-main">
                        <li><a href="#">배송대행 이용방법 <i class="far fa-caret-square-right"></i></a>
                            <dl>
                                <dt><a href="#">배송대행 서비스 안내 </a></dt>
                                <dt><a href="#">배송대행 신청서 작성법 </a></dt>
                            </dl>
                        </li>
                        <li><a href="#">구매대행 이용방법 <i class="far fa-caret-square-right"></i></a>
                            <dl>
                                <dt><a href="#">구매대행 서비스 안내 </a></dt>
                                <dt><a href="#">구매대행 신청서 작성법 </a></dt>
                            </dl>
                        </li>
                        <li><a href="#">사업자 이용안내</a></li>
                        <li><a href="#">타오바오 이용방법 <i class="far fa-caret-square-right"></i></a>
                            <dl>
                                <dt><a href="#">가입방법</a></dt>
                                <dt><a href="#">주소 설정하기</a></dt>
                                <dt><a href="#">구매결제하기</a></dt>
                                <dt><a href="#">반품/환불방법</a></dt>
                                <dt><a href="#">송장번호 확인하기</a></dt>
                                <dt><a href="#">주문자동등록방법</a></dt>
                            </dl>
                        </li>
                        <li><a href="#">이용팁 <i class="far fa-caret-square-right"></i></a>
                            <dl>
                                <dt><a href="#">중국사이즈 조건표</a></dt>
                                <dt><a href="#">중국내 배송조회</a></dt>
                                <dt><a href="#">개인통관고유번호발급 방법</a></dt>
                                <dt><a href="#">관/부가세 안내</a></dt>
                                <dt><a href="#">수입금지품목</a></dt>
                            </dl>
                        </li>
                        <li><a href="#">노데이터 처리방법</a></li>
                    </ul>
                </li>
                <li><a href="javascript:goSite('shipping')"     id="shipList">비용안내</a>
                    <ul>
                        <li><a href="#">배송비</a></li>
                        <li><a href="#">부가서비스</a></li>
                        <li><a href="#">구매대행 수수료</a></li>
                    </ul>
                </li>
                <li><a href="javascript:goSite('delivery')"     id="deliveryAgent">배송대행</a>
                    <ul>
                        <li><a href="#">배송대행신청</a></li>
                        <li><a href="#">엑셀대량등록</a></li>
                        <li><a href="#">재고 신청</a></li>
                    </ul>
                </li>
                <li><a href="javascript:goSite('purchase')"     id="purchaseAgent">구매대행</a>
                    <ul>
                        <li><a href="#">구매대행신청</a></li>
                        <li><a href="#">엑셀대량등록</a></li>
                    </ul>
                </li>
                <li><a href="javascript:goSite('cs')"           id="csCenter">고객센터</a>
                    <ul>
                        <li><a href="#">공지사항</a></li>
                        <li><a href="#">자주하는 질문</a></li>
                        <li><a href="#">1:1문의</a></li>
                        <li><a href="#">이용후기</a></li>
                        <li><a href="#">노데이터</a></li>
                        <li><a href="#">통관조회</a></li>
                    </ul>
                </li>
                <li><a href="javascript:goSite('mypage')"       id="myPage">마이페이지</a>
                    <ul>
                        <li><a href="#">주문신청현황</a></li>
                        <li><a href="#">결제관리</a></li>
                        <li><a href="#">예치금 내역</a></li>
                        <li><a href="#">포인트 내역</a></li>
                        <li><a href="#">쿠폰 내역</a></li>
                        <li><a href="#">받은 쪽지함</a></li>
                        <li><a href="#">회원정보수정</a></li>
                    </ul>
                </li>
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