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
        $("#breadcrumbs #pageTitle").html("예치금 내역");
        $("#breadcrumbs .deposit_history").addClass("selected");
        $("#breadcrumbs .deposit_history").attr("href", "javascript:void(0)");
    });
</script>

<div class="container-agent">
    <div class="bar-title">
        <h2 class="title">예치금 내역</h2>

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
                    <ul>
                        <li class="active">
                            <a href="javascript:goView('req')">적립신청</a>
                        </li>
                        <li>
                            <a href="javascript:goView('ret')">환불신청</a>
                        </li>
                        <li>
                            <a href="javascript:goView('use')">사용내역</a>
                        </li>
                    </ul>
                </div>
                <form action="" name="frmDpst" method="post">
                    <div class="content">
                        <ul class="dashboard-box-list">
                            <li>
                                <div class="row">
                                    <div class="col-xl-4 col-common">
                                        <div class="submit-field">
                                            <input type="text" name="MNY" class="with-border" placeholder="예치금액(￦)">
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-common">
                                        <div class="submit-field">
                                            <input type="text" name="PAYIN_NM" maxlength="40" class="with-border" placeholder="입금자명">
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-common">
                                        <div class="input-with-icon-left">
                                            <i class="far fa-calendar"></i>
                                            <input type="date" name="PAYIN_DT" class="input-text with-border" aria-required="true" required data-placeholder="입금일">
                                        </div>
                                    </div>
                                    <div class="col-xl-12 col-common">
                                        <div class="notification warning">
                                            <select name="PAYIN_ACC" class="btn-group bootstrap-select with-border">
                                                <option value="">우리은행268-069109-02-001 (주식회사 제이에스에이치)</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </form>
            </div>
            <div class="tip-text margin-top-10">
                <span>*</span>
                예치금의 경우 무통장입금을 통해서만 가능하오며, 신청 후 1일 이내에 확인 후 예치금 반영해 드립니다.
            </div>
            <div class="tc margin-top-30">
                <a href="javascript:void(0)" data-animation="ripple" class="button ripple-effect big">
                    예치금 신청
                </a>
            </div>
        </div>
        <div class="col-xl-12 col-common">
            <div class="dashboard-box margin-top-40 margin-bottom-20">
                <form action="" name="frmDpstL" method="post">
                    <div class="content">
                        <ul class="dashboard-box-list">
                            <li>
                                <div class="board-listing width-adjustment">
                                    <div class="board-listing-details">
                                        <div class="board-listing-description">
                                            <h3 class="board-listing-title">예치금 신청 내역이 없습니다.</h3>
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
        urldirect.action = "DepositHistory";
        urldirect.separate.value = arg;
        urldirect.submit();
    }
</script>
</body>
</html>