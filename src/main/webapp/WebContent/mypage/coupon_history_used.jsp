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

        <%@ include file="breadcrumbs_mypage.jsp"%>
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
                        <li class="width50">
                            <a href="javascript:goView('list')">사용가능쿠폰</a>
                        </li>
                        <li class="active width50">
                            <a href="javascript:goView('used')">사용한쿠폰</a>
                        </li>
                    </ul>
                </div>
                <!-- search-con -->
                <form action="" name="frmSearch" method="post">
                    <div class="search-con">
                        <div class="search-con-inner2">
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
                                <!-- board-listing -->
                                <div class="board-listing width-adjustment">
                                    <!-- board-listing-details -->
                                    <div class="board-listing-details">
                                        <!-- Details -->
                                        <div class="board-listing-description">
                                            <h3 class="board-listing-title">배송비 쿠폰</h3>
                                            <!-- board-listing-footer -->
                                            <div class="board-listing-footer">
                                                <ul class="fl">
                                                    <li>
                                                        <i class="fas fa-tag"></i>26661
                                                    </li>
                                                    <li>
                                                        <i class="fas fa-gift"></i>
                                                        <strong class="num fc_red">￦6,500</strong>
                                                    </li>
                                                    <li>
                                                        <i class="far fa-calendar"></i><span class="num s_txt">2021-10-09~2021-12-08</span>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Task Details -->
                                <ul class="dashboard-task-info">
                                    <li>
                                        <span>발급일</span>
                                        <span>2021.10.09</span>
                                    </li>
                                    <li>
                                        <span>사용일</span>
                                        <span class="fc_red">2021.10.12</span>
                                    </li>
                                    <li>
                                        <span>상태</span>
                                        <span>사용완료</span>
                                    </li>
                                </ul>
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