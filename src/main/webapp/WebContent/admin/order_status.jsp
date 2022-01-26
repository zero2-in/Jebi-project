<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="../common_header.jsp" %>

<c:if test="${session_level ne 'top'}">
    <script>
        location.href = "Error";
    </script>
</c:if>

<script>
    $(document).ready(function () {
        $("#breadcrumbs #pageTitle").html("주문현황 관리");
        $("#breadcrumbs .order_status").addClass("selected");
        $("#breadcrumbs .order_status").attr("href", "javascript:void(0)");
    });
</script>

<div class="container-agent">
    <div class="bar-title">
        <h2 class="title">주문현황 관리</h2>

        <%@ include file="breadcrumbs_admin.jsp" %>
    </div>

    <div class="margin-top-50"></div>

    <div class="row">
        <div class="col-xl-12 col-common">
            <form action="" name="search" method="get">
                <!-- search-con -->
                <div class="search-con">
                    <div class="search-con-inner">
                        <div class="submit-field">
                            <div class="btn-group bootstrap-select with-border">
                                <select name="" class="btn bs-placeholder btn-default">
                                    <option value=""> = 신청구분</option>
                                    <option value="1">배송대행</option>
                                    <option value="2">구매대행</option>
                                    <option value="3">반품대행</option>
                                    <option value="4">쇼핑몰</option>
                                </select>
                            </div>
                        </div>
                        <div class="submit-field">
                            <div class="btn-group bootstrap-select with-border">
                                <select name="" class="btn bs-placeholder btn-default">
                                    <option value=""> = 주문상태</option>
                                    <optgroup label="[배송대행]">
                                        <option value="1">접수대기</option>
                                        <option value="2">접수신청</option>
                                    </optgroup>
                                    <optgroup label="[구매대행]">
                                        <option value="14">구매견적</option>
                                        <option value="15">결제대기</option>
                                        <option value="16">결제완료</option>
                                        <option value="17">구매완료</option>
                                    </optgroup>
                                    <optgroup label="[리턴관리]">
                                        <option value="18">반품신청</option>
                                        <option value="19">결제대기</option>
                                        <option value="20">결제완료</option>
                                        <option value="21">반품완료</option>
                                    </optgroup>
                                    <optgroup label="[입/출고]">
                                        <option value="3">입고대기</option>
                                        <option value="4">입고완료</option>
                                        <option value="5">결제대기</option>
                                        <option value="6">결제완료</option>
                                        <option value="7">출고대기</option>
                                        <option value="8">출고완료</option>
                                    </optgroup>
                                    <optgroup label="[오류]">
                                        <option value="9">오류입고</option>
                                        <option value="10">오류무시</option>
                                        <option value="11">출고보류</option>
                                        <option value="12">미도착건</option>
                                        <option value="13">신청취소</option>
                                    </optgroup>
                                </select>
                            </div>
                        </div>
                        <div class="submit-field">
                            <div class="btn-group bootstrap-select with-border">
                                <select name="" class="btn bs-placeholder btn-default">
                                    <option value=""> = 출고구분</option>
                                    <option value="1">자동결제</option>
                                    <option value="2">수동결제</option>
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
                            <input type="text" class="with-border" maxlength="8" placeholder="주문번호">
                        </div>
                        <div class="submit-field">
                            <input type="text" maxlength="40" placeholder="트래킹번호" class="with-border">
                        </div>
                        <div class="submit-field">
                            <input type="text" maxlength="40" placeholder="수취인명" class="with-border">
                        </div>
                        <div class="submit-field">
                            <input type="text" name="" maxlength="40" placeholder="상품명" class="with-border">
                        </div>
                        <div class="submit-field">
                            <input type="text" name="" maxlength="40" placeholder="운송장번호" class="with-border">
                        </div>
                        <div class="search-btn">
                            <a href="javascript:void(0)" data-animation="ripple" class="button ripple-effect">
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
                                        <img src="https://img.alicdn.com/imgextra/i4/3249253975/O1CN01GajNX91fEb3O8mCqG_!!3249253975.jpg_400x400.jpg" onerror="this.src='../images/img-upload.png'">
                                    </a>
                                </div>
                                <!-- Name -->
                                <div class="project-name">
                                    <h4>
                                        배송대행 
                                        <a href="order_status_view.html" title="주문정보 보기" target="_blank" class="num">211001040</a>
                                        <img src="../images/CN_flag.png" class="flag">
                                    </h4>
                                    <span class="company-not-rated margin-bottom-5">
                                        항공 / 수동결제 / 김영인 / 개인(일치)
                                    </span>
                                    <br>
                                    <p>
                                        <strong>1 개 / ￥89.00</strong>
                                        <br>
                                        <a href="../clearance/clearance.html" target="_blank" title="통관조회">
                                            <i class="fas fa-map-marker-alt"></i>
                                            <strong class="num">557282591525</strong>
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
                                        <span>입고완료</span>
                                    </li>
                                    <li>
                                         주문상태 
                                         <span>
                                             <strong>
                                                 <!-- 오류입고인 경우 오류확인하기 -->
                                                  출고완료 
                                             </strong>
                                         </span>
                                    </li>
                                    <li>
                                        처리일 
                                        <span>2022-01-02 03:48</span>
                                    </li>
                                    <li>
                                        등록일 
                                        <span>2022-10-10 17:31</span>
                                    </li>
                                </ul>
                                <div class="project-btn">
                                    <!-- 오류입고인 경우 오류확인하기 -->
                                    <a href="../clearance/clearance.html" target="_blank" data-animation="ripple" title="통관조회 하기" class="button gray ripple-effect">
                                        <i class="fas fa-box-open"></i>
                                    </a>
                                    <a href="order_status_view.html" target="_blank" data-animation="ripple" title="주문정보 보기" class="button gray ripple-effect">
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

<%@ include file="../common_footer.jsp" %>

<script src="js/btn_ripple_effect.js"></script>
</body>
</html>
