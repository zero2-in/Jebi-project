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
        $("#breadcrumbs #pageTitle").html("결제 관리");
        $("#breadcrumbs .purchase_manage").addClass("selected");
        $("#breadcrumbs .purchase_manage").attr("href", "javascript:void(0)");
    });
</script>

<div class="container-agent">
    <div class="bar-title">
        <h2 class="title">결제 관리</h2>

        <%@include file="breadcrumbs_mypage.jsp"%>
    </div>

    <div class="margin-top-50"></div>

    <!-- 마이페이지 컨테이너 -->
    <%@ include file="mypage_container.jsp" %>
    <!-- 마이페이지 컨테이너 / 끝 -->
    <!-- Row -->
    <div class="row">
        <div class="col-xl-12 col-common">
            <div class="dashboard-box margin-top-0 margin-bottom-20">
                <!-- headline -->
                <div class="headline">
                    <h3 class="fl">
                        <i class="fas fa-angle-double-right"></i> 결제 내역
                    </h3>
                    <div class="headline-btn">
                        <a href="javascript:void(0)" onclick="goBack()" data-animation="ripple" class="button blue-line ripple-effect">
                            결제하기
                        </a>
                    </div>
                </div>
                <!-- search-con -->
                <div class="search-con">
                    <form method="post" name="frmSearch">
                        <div class="search-con-inner2">
                            <div class="submit-field">
                                <select name="sPaymentWayCd" class="btn-group bootstrap-select with-border">
                                    <option value="">전체</option>
                                    <option value="1">무통장입금</option>
                                    <option value="2">신용카드</option>
                                    <option value="3">예치금 결제</option>
                                </select>
                            </div>
                            <div class="submit-field">
                                <div class="input-with-icon-left">
                                    <i class="far fa-calendar"></i>
                                    <input type="date" name="sBeginDt" maxlength="10" class="input-text with-border dtPic" data-placeholder="시작일" required>
                                </div>
                            </div>
                            <div class="submit-field">
                                <div class="input-with-icon-left">
                                    <i class="far fa-calendar"></i>
                                    <input type="date" name="sEndDt" maxlength="10" class="input-text with-border dtPic" data-placeholder="종료일" required>
                                </div>
                            </div>
                            <div class="search-btn2">
                                <a href="javascript:void(0)" onclick="" data-animation="ripple" class="button ripple-effect">
                                    검색 <i class="fas fa-search"></i>
                                </a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </form>
                </div>
                <!-- search-con / End -->
                <div class="content">
                    <ul class="dashboard-box-list">
                        <!-- 내역이 없을 때 -->
                        <!--li>
                            <div class="board-listing width-adjustment">
                                <div class="board-listing-details">
                                    <div class="board-listing-description">
                                        <h3 class="board-listing-title">
                                            결제 내역이 존재하기 않습니다.
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </li-->

                        <li>
                            <!-- board-listing -->
                            <div class="board-listing width-adjustment">
                                <!-- board-listing-details -->
                                <div class="board-listing-details">
                                    <!-- Details -->
                                    <div class="board-listing-description">
                                        <!-- 입금계좌 -->
                                        <span class="discounted-price-tag pay-account">우리은행&nbsp;&nbsp;268-069109-02-001&nbsp;주식회사 제이에스에이치</span>
                                        <h3 class="board-listing-title">
                                            <a href="">
                                                주문번호: <span class="bold">211001040</span> (국제 배송비용 : ￦3,000)
                                            </a>
                                        </h3>
                                        <div class="board-listing-footer">
                                            <ul class="fl">
                                                <li>
                                                    <i class="fas fa-credit-card"></i> 무통장입금
                                                </li>
                                                <li>
                                                    <i class="fas fa-check"></i> 결제완료
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Task Details -->
                            <ul class="dashboard-task-info">
                                <li>
                                    <span>처리일자</span>
                                    <span>2021.10.12</span>
                                </li>
                                <li>
                                    <span>결제비용</span>
                                    <strong class="fc_red">￦9,500</strong>
                                </li>
                                <li>
                                    <span>사용예치금</span>
                                    <strong>￦0</strong>
                                </li>
                                <li>
                                    <span>사용포인트</span>
                                    <strong>0&nbsp;P</strong>
                                </li>
                                <li>
                                    <span>결제금액</span>
                                    <strong class="fc_red">￦3,000</strong>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- Row/End -->
    <!-- Pagination -->
    <div class="row">
        <div class="col-xl-12 col-common">
            <div class="pagination-container margin-top-10 margin-bottom-20">
                <nav class="pagination">
                    <ul>
                        <li class="pagination-arrow">
                            <a href="javascript:void(0)" title="이전 10페이지 없음" data-animation="ripple" class="ripple-effect">
                                <i class="fas fa-chevron-left"></i>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0)" data-animation="ripple" class="current-page ripple-effect">1</a>
                        </li>
                        <li class="pagination-arrow">
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
    function goBack() {
        urldirect.action = "PurchaseManagement";
        urldirect.separate.value = "purchase";
        urldirect.submit();
    }
</script>
</body>
</html>