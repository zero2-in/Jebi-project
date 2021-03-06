<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="../common_header.jsp" %>

<c:if test="${empty session_name}">
    <script>
        alert("로그인 후 이용가능합니다.");
        location.href="Member";
    </script>
</c:if>

<%@ include file="common_order_status.jsp"%>
<div class="container-agent">
    <div class="bar-title">
        <h2 class="title">주문신청 현황</h2>

        <!-- 사이트 이동경로를 만들어라! -->
        <%@include file="breadcrumbs_mypage.jsp"%>
    </div>

    <div class="margin-top-50"></div>

    <!-- 마이페이지 컨테이너 -->
    <%@ include file="mypage_container.jsp" %>
    <!-- 마이페이지 컨테이너 / 끝 -->
    <div class="stamp_area">
        <div class="stamp_box">
            <div class="stamp_title">My Stamp</div>
            <div class="stamp_txt">5번의 주문건이 출고되면 쿠폰이 발급됩니다.</div>
        </div>
        <div class="stamp_img">
            <ul>        <!-- 01: 꺼짐, 02: 켜짐 -->
                <li class="cp coupon0<c:if test='${order_count >= 1}'>2</c:if><c:if test='${order_count < 1}'>1</c:if>">back</li>
                <li class="cp coupon0<c:if test='${order_count >= 2}'>2</c:if><c:if test='${order_count < 2}'>1</c:if>">back</li>
                <li class="cp coupon0<c:if test='${order_count >= 3}'>2</c:if><c:if test='${order_count < 3}'>1</c:if>">back</li>
                <li class="cp coupon0<c:if test='${order_count >= 4}'>2</c:if><c:if test='${order_count < 4}'>1</c:if>">back</li>
                <li class="cp coupon0<c:if test='${order_count >= 5}'>2</c:if><c:if test='${order_count < 5}'>1</c:if>">back</li>
                <li class="equals">=</li>
                <c:if test="${order_count >= 5}">
                    <li class="cp02 coupon04">back</li>
                </c:if>
                <c:if test="${order_count < 5}">
                    <li class="cp02 coupon03">back</li>
                </c:if>
            </ul>
        </div>
    </div>
    <!-- my-steps Container -->
    <div class="my-steps-box">
        <!-- 주문현황 탭 -->
        <div class="my-steps-container">

            <c:forEach items="${status_list}" var="list">
                <div class="my-step">
                    <h3>
                        <!-- Icon -->
                        <c:if test="${list.getCategory() eq '배송대행'}"><i class="fas fa-truck"></i></c:if>
                        <c:if test="${list.getCategory() eq '구매대행'}"><i class="fas fa-shopping-cart"></i></c:if>
                        <c:if test="${list.getCategory() eq '리턴관리'}"><i class="fas fa-sync"></i></c:if>
                        <c:if test="${list.getCategory() eq '입/출고'}"><i class="fas fa-sign-out-alt"></i></c:if>
                        <c:if test="${list.getCategory() eq '오류'}"><i class="far fa-times-circle"></i></c:if>
                        <c:if test="${list.getCategory() eq '재고관리'}"><i class="fas fa-box-open"></i></c:if>

                        ${list.getCategory()}
                    </h3>
                    <div class="my-step-label">
                        <ul>
                            <c:forEach items="${list.getStatus_list()}" var="map">
                                <li>
                                    <a href="">
                                        <c:set var="my_id" value="${session_id}" /> <c:set var="list_key" value="${map.key}" />
                                        <span>${map.value}</span><strong><span class="fr num"> ${dao.getCategoryCount(my_id, list_key)} </span></strong>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
    <!-- my-steps Container / End -->

</div>

<!-- Section -->
<div class="section gray">
    <div class="container-agent">
        <div class="row">
            <div class="col-xl-12 col-common">
                <form action="OrderStatus" name="search" method="POST">
                    <!-- search-con -->
                    <div class="search-con">
                        <div class="search-con-inner">
                            <div class="submit-field">
                                <div class="btn-group bootstrap-select with-border">
                                    <select name="AGENT_TYPE" class="btn bs-placeholder btn-default">
                                        <option value=""> = 신청구분</option>
                                        <option value="배송대행" <c:if test="${s_dto.getAgentType() eq '배송대행'}">selected</c:if>>배송대행</option>
                                        <option value="구매대행" <c:if test="${s_dto.getAgentType() eq '구매대행'}">selected</c:if>>구매대행</option>
                                        <option value="반품대행" <c:if test="${s_dto.getAgentType() eq '반품대행'}">selected</c:if>>반품대행</option>
                                        <option value="쇼핑몰" <c:if test="${s_dto.getAgentType() eq '쇼핑몰'}">selected</c:if>>쇼핑몰</option>
                                    </select>
                                </div>
                            </div>
                            <div class="submit-field">
                                <div class="btn-group bootstrap-select with-border">
                                    <select name="STATUS_CODE" class="btn bs-placeholder btn-default">
                                        <option value=""> = 주문상태</option>

                                        <c:forEach items="${status_list}" var="list">
                                            <optgroup label="[${list.getCategory()}]">
                                                <c:forEach items="${list.getStatus_list()}" var="map">
                                                    <option value="${map.key}" <c:if test="${s_dto.getStatusCode() eq map.key}">selected</c:if>>${map.value}</option>
                                                </c:forEach>
                                            </optgroup>
                                        </c:forEach>

                                    </select>
                                </div>
                            </div>
                            <div class="submit-field">
                                <div class="btn-group bootstrap-select with-border">
                                    <select name="SVC_DVS" class="btn bs-placeholder btn-default">
                                        <option value=""> = 출고구분</option>
                                        <option value="auto" <c:if test="${s_dto.getSvc_dvs() eq 'auto'}">selected</c:if>>자동결제</option>
                                        <option value="manual" <c:if test="${s_dto.getSvc_dvs() eq 'manual'}">selected</c:if>>수동결제</option>
                                    </select>
                                </div>
                            </div>
                            <div class="submit-field">
                                <div class="input-with-icon-left">
                                    <i class="far fa-calendar"></i>
                                    <input type="date" name="" data-placeholder="시작일" class="input-text with-border" required aria-required="true">
                                </div>
                            </div>
                            <div class="submit-field">
                                <div class="input-with-icon-left">
                                    <i class="far fa-calendar"></i>
                                    <input type="date" name="" data-placeholder="종료일" class="input-text with-border" required aria-required="true">
                                </div>
                            </div>
                            <div class="submit-field">
                                <input type="text" class="with-border" maxlength="20" placeholder="주문번호" name="ORDER_NO" value="${s_dto.getOrderNo()}">
                            </div>
                            <div class="submit-field">
                                <input type="text" maxlength="40" placeholder="트래킹번호" class="with-border" name="TRACKING_NO" value="${s_dto.getTrackingNo()}">
                            </div>
                            <div class="submit-field">
                                <input type="text" maxlength="40" placeholder="수취인명" class="with-border" name="REG_KOR_NAME" value="${s_dto.getReg_kor_name()}">
                            </div>
                            <div class="submit-field">
                                <input type="text" maxlength="40" placeholder="상품명" class="with-border" name="ITEM_ENG_NAME" value="${s_dto.getItem_eng_name()}">
                            </div>
                            <div class="submit-field">
                                <input type="text" name="DLVR_NO" maxlength="40" placeholder="운송장번호" class="with-border">
                            </div>
                            <div class="search-btn">
                                <a href="javascript:void(0)" data-animation="ripple" class="button green ripple-effect">
                                    다운로드
                                    <i></i>
                                </a>
                                <a href="javascript:void(0)" onclick="setTimeout(function(){goSearch()}, 150)" data-animation="ripple" class="button ripple-effect">
                                    검색
                                    <i class="fas fa-search"></i>
                                </a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <!-- search-con / End -->
                </form>
                <!-- projects List Container -->
                <div class="list-container pro-list-layout compact-list">

                    <c:forEach items="${agent_list}" var="list">
                        <div class="project-con">
                            <!-- project -->
                            <div class="project">
                                <!-- Overview -->
                                <div class="project-overview">
                                    <div class="project-overview-inner">
                                        <!-- Avatar -->
                                        <div class="project-avatar">
                                            <a href="javascript:void(0)">
                                                <div class="verified-badge">
                                                    <i class="fas fa-ellipsis-v"></i>
                                                </div>
                                                <img src="${list.getItem_img_url()}" onerror="this.src='images/img-upload.png'">
                                            </a>
                                        </div>
                                        <!-- Name -->
                                        <div class="project-name">
                                            <h4>
                                                ${list.getAgent_type()}
                                                <a href="javascript:goView('${list.getTable_no()}', '${list.getOrder_no()}')" title="주문정보 보기" class="num">${list.getOrder_no()}</a>
                                                <img src="images/CN_flag.png" class="flag">
                                            </h4>
                                            <span class="company-not-rated margin-bottom-5">
                                                ${list.getDlvr_method()} / ${list.getSvc_dvs()} / ${list.getReg_kor_name()} / 개인(일치)
                                            </span>
                                            <br>
                                            <p>
                                                <strong>${list.getQuantity()} 개 / ￥${list.getMoney_yuan()}</strong>
                                                <br>
                                                <a href="Clearance" target="_blank" title="통관조회">
                                                    <i class="fas fa-map-marker-alt"></i>
                                                    <strong class="num">${list.getTracking_no()}</strong>
                                                </a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <!-- Details -->
                                <div class="project-details">
                                    <div class="project-details-list">
                                        <ul>
                                            <li>
                                                입고상태
                                                <span>입고대기</span>
                                            </li>
                                            <li>
                                                주문상태
                                                <span>
                                                     <strong>
                                                         <!-- 오류입고인 경우 오류확인하기 -->
                                                          ${list.getStatus_name()}
                                                     </strong>
                                                 </span>
                                            </li>
                                            <li>
                                                처리일
                                                <span>${list.getProcessing_date()}</span>
                                            </li>
                                            <li>
                                                등록일
                                                <span>${list.getReg_date()}</span>
                                            </li>
                                        </ul>
                                        <div class="project-btn">
                                            <!-- 오류입고인 경우 오류확인하기 -->
                                            <a href="Clearance" target="_blank" data-animation="ripple" title="통관조회 하기" class="button gray ripple-effect">
                                                <i class="fas fa-box-open"></i>
                                            </a>
                                            <a href="javascript:goView('${list.getTable_no()}', '${list.getOrder_no()}')" data-animation="ripple" title="주문정보 보기" class="button gray ripple-effect">
                                                <i class="far fa-eye"></i>
                                            </a>
                                            <a href="#small-dialog" title="실사 전체보기" data-animation="ripple" class="popup-with-zoom-anim button ripple-effect">
                                                <i class="fas fa-camera"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
                <!-- projects Container / End -->
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
    <!-- Spacer -->
    <div class="padding-top-70"></div>
    <!-- Spacer / End -->
</div>

<%@ include file="../common_footer.jsp" %>

<script src="js/btn_ripple_effect.js"></script>
<script>
    function goView(table_no, order_no) {
        urldirect.action = "OrderStatus";
        urldirect.table_no.value = table_no;
        urldirect.order_no.value = order_no;
        urldirect.separate.value = "view";
        urldirect.submit();
    }

    function goSearch() {
        search.submit();
    }
</script>

</body>
</html>