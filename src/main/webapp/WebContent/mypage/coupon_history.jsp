<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="../common_header.jsp" %>

<c:if test="${empty session_name}">
    <script>
        alert("로그인 후 이용가능합니다.");
        location.href = "Member";
    </script>
</c:if>

<script>
    $(document).ready(function () {
        $("#breadcrumbs #pageTitle").html("쿠폰 내역");
        $("#breadcrumbs .coupon_history").addClass("selected");
        $("#breadcrumbs .coupon_history").attr("href", "javascript:void(0)");
    });
</script>

<div class="container-agent">
    <div class="bar-title">
        <h2 class="title">쿠폰 내역</h2>

        <%@ include file="breadcrumbs_mypage.jsp" %>
    </div>

    <div class="margin-top-50"></div>

    <!-- 마이페이지 컨테이너 -->
    <%@ include file="mypage_container.jsp" %>
    <!-- 마이페이지 컨테이너 / 끝 -->
    <!-- Row -->
    <div class="row">
        <div class="col-xl-12 col-common">
            <div class="dashboard-box margin-top-0 margin-bottom-20">
                <!-- Headline -->
                <div class="headline-tab-menu">
                    <ul class="row-2">
                        <li class="active width50">
                            <a href="javascript:goView('list')">사용가능쿠폰</a>
                        </li>
                        <li class="width50">
                            <a href="javascript:goView('used')">사용불가쿠폰</a>
                        </li>
                    </ul>
                </div>
                <!-- search-con -->
                <form action="" name="frmSearch" method="post">
                    <div class="search-con">
                        <div class="search-con-inner2">
                            <div class="submit-field">
                                <select name="" class="btn-group bootstrap-select with-border">
                                    <option value=""> = 발행구분 </option>
                                    <option value="1"> 회원가입 이벤트 </option>
                                    <option value="2"> 회원가입 추천인 </option>
                                    <option value="3"> 관리자 발급 </option>
                                    <option value="4"> 회원등업 쿠폰 발급 </option>
                                    <option value="5"> 출고 이벤트 </option>
                                </select>
                            </div>
                            <div class="submit-field">
                                <select name="" class="btn-group bootstrap-select with-border">
                                    <option value=""> = 발행종류 </option>
                                    <option value="1"> 배송비 </option>
                                </select>
                            </div>
                            <div class="search-btn2">
                                <a href="javascript:void(0)" data-animation="ripple" class="button ripple-effect">
                                    검색 <i class="fas fa-search"></i>
                                </a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </form>
                <!-- search-con / End -->
                <form action="" name="frmDpstUseL" method="post">
                    <div class="content">
                        <ul class="dashboard-box-list">
                            <li>
                                <div class="board-listing width-adjustment">
                                    <div class="board-listing-details">
                                        <div class="board-listing-description">
                                            <h3 class="board-listing-title">사용가능한 쿠폰이 없습니다.</h3>
                                            <div class="board-listing-footer"></div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Row / End -->
    <!-- Pagination -->
    <div class="row">
        <div class="col-xl-12 col-common">
            <div class="pagination-container margin-top-10 margin-bottom-20">
                <nav class="pagination">
                    <ul>
                        <li class="pagination-arrow">
                            <a href="javascript:void(0)" data-animation="ripple" title="이전 10페이지 없음" class="ripple-effect">
                                <i class="fas fa-chevron-left"></i>
                            </a>
                        </li
                        ><li>
                        <a href="javascript:void(0)" data-animation="ripple" class="current-page ripple-effect">
                            1
                        </a>
                    </li
                    ><li class="pagination-arrow">
                        <a href="javascript:void(0)" title="다음 없음" data-animation="ripple" class="ripple-effect">
                            <i class="fas fa-chevron-right"></i>
                        </a>
                    </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    <!-- Pagination / End -->
</div>

<%@ include file="../common_footer.jsp" %>

<script src="js/btn_ripple_effect.js"></script>
<script>
    function goView(arg) {
        urldirect.action = "CouponHistory";
        urldirect.separate.value = arg;
        urldirect.submit();
    }
</script>
</body>
</html>