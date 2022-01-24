<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../common_header.jsp" %>

<!-- 사이트 네비게이션 이름, 주소 표시 -->
<%@ include file="common_clearance.jsp" %>

<div class="container-notice">
    <div class="bar-title">
        <h2 class="title">통관조회</h2>

        <%@ include file="../breadcrumbs_cscenter.jsp" %>
    </div>

    <div class="dashboard margin-bottom-20">
        <div class="search-con">
            <div class="row">
                <!-- 검색 폼! -->
                <form action="notice_list.html" method="post" name="search">
                    <div class="search">
                        <input type="text" name="s" class="search-text" placeholder="운송장번호">
                        <button type="button" class="search-btn ripple-effect" data-animation="ripple">
                            검색 <i class="fas fa-search"></i>
                        </button>
                    </div>
                </form>

            </div>
        </div>
    </div>


    <!--div class="clearance-content">
        데이터가 없다면 이렇게 처리하라!

        <div class="clearance-col">
            <div class="accordion">
                <div class="accordion-body">
                    <div class="accordion-content">
                        <div class="order-info">
                            <div class="tc">검색된 운송장번호가 없습니다.</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div-->

    <div class="clearance-content">
        <div class="clearance-col">
            <div class="accordion">
                <!-- Accordion Head -->
                <div class="accordion-header">
                    주문정보
                </div>

                <!-- Accordion Body -->
                <div class="accordion-body">
                    <div class="accordion-content">
                        <!-- 상품의 이미지 -->
                        <div class="order-img">
                            <a href="#" target="_blank">
                                <img src="images/test_img.jpg" alt="주문정보 상세보기">
                            </a>
                        </div>
                        <!-- 상품의 정보 -->
                        <div class="order-info">
                            <div class="order-name">
                                배송대행
                                <a href="#" target="_blank" class="num">211001040</a>
                            </div>

                            <div class="order-condition">
                                <span class="company-not-rated margin-bottom-5">항공 / 수동결제 / 김영인</span>
                            </div>

                            <div class="order-price">
                                <strong>1 개 / ￥89.00 / $12.90</strong>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- Accordion Body End -->
            </div>
        </div>
    </div>

    <div class="margin-top-20"></div>

    <div class="clearance-content">
        <div class="clearance-col">
            <div class="accordion">
                <div class="accordion-header">
                    통관정보
                </div>
            </div>
        </div>

        <!-- 절차 한 블록! -->
        <div class="col-xl-4">
            <div class="accordion_02">

                <div class="accordion-header js_accordion_item">
                    <div class="step-num">1</div>

                    <div class="step-txt">
                        <p class="step-title">
                            입항보고 제출
                        </p>
                        <p class="step-time">
                            2021.10.14 PM 1:02
                        </p>
                    </div>
                </div>

                <div class="accordion-body">
                    <div class="accordion-content">
                        <table>
                            <!--tr>

                            <th>포장개수</th>

                            <td data-label="포장개수" class="td-50">1</td>

                            <th>중 량</th>

                            <td data-label="중량" class="td-50">3</td>

                            </tr-->
                            <tbody>
                            <tr>
                                <th>반출입(처리)일시</th>
                            </tr>
                            <tr>
                                <td data-label="반출입(처리)일시" class>2021.10.14 PM 1:02</td>
                            </tr>
                            <tr>
                                <th>반출입(처리)내용</th>
                            </tr>
                            <tr>
                                <td data-label="반출입(처리)내용" class> &nbsp; </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- Accordion body End -->
            </div>
        </div>

        <div class="col-xl-4">
            <div class="accordion_02">

                <div class="accordion-header js_accordion_item">
                    <div class="step-num">2</div>

                    <div class="step-txt">
                        <p class="step-title">
                            입항적하목록 제출
                        </p>
                        <p class="step-time">
                            2021.10.14 PM 3:10
                        </p>
                    </div>
                </div>

                <div class="accordion-body">
                    <div class="accordion-content">
                        <table>
                            <!--tr>

                            <th>포장개수</th>

                            <td data-label="포장개수" class="td-50">1</td>

                            <th>중 량</th>

                            <td data-label="중량" class="td-50">3</td>

                            </tr-->
                            <tbody>
                            <tr>
                                <th>반출입(처리)일시</th>
                            </tr>
                            <tr>
                                <td data-label="반출입(처리)일시" class>2021.10.14 PM 3:10</td>
                            </tr>
                            <tr>
                                <th>반출입(처리)내용</th>
                            </tr>
                            <tr>
                                <td data-label="반출입(처리)내용" class>스위스포트코리아(주)</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- Accordion body End -->
            </div>
        </div>

        <div class="col-xl-4">
            <div class="accordion_02">

                <div class="accordion-header js_accordion_item">
                    <div class="step-num">3</div>

                    <div class="step-txt">
                        <p class="step-title">
                            입항적하목록 심사완료
                        </p>
                        <p class="step-time">
                            2021.10.14 PM 3:23
                        </p>
                    </div>
                </div>

                <div class="accordion-body">
                    <div class="accordion-content">
                        <table>
                            <!--tr>

                            <th>포장개수</th>

                            <td data-label="포장개수" class="td-50">1</td>

                            <th>중 량</th>

                            <td data-label="중량" class="td-50">3</td>

                            </tr-->
                            <tbody>
                            <tr>
                                <th>반출입(처리)일시</th>
                            </tr>
                            <tr>
                                <td data-label="반출입(처리)일시" class>2021.10.14 PM 3:23</td>
                            </tr>
                            <tr>
                                <th>반출입(처리)내용</th>
                            </tr>
                            <tr>
                                <td data-label="반출입(처리)내용" class>스위스포트코리아(주)</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- Accordion body End -->
            </div>
        </div>

        <div class="col-xl-4">
            <div class="accordion_02">

                <div class="accordion-header js_accordion_item">
                    <div class="step-num">4</div>

                    <div class="step-txt">
                        <p class="step-title">
                            입항보고 수리
                        </p>
                        <p class="step-time">
                            2021.10.14 PM 3:52
                        </p>
                    </div>
                </div>

                <div class="accordion-body">
                    <div class="accordion-content">
                        <table>
                            <!--tr>

                            <th>포장개수</th>

                            <td data-label="포장개수" class="td-50">1</td>

                            <th>중 량</th>

                            <td data-label="중량" class="td-50">3</td>

                            </tr-->
                            <tbody>
                            <tr>
                                <th>반출입(처리)일시</th>
                            </tr>
                            <tr>
                                <td data-label="반출입(처리)일시" class>2021.10.14 PM 3:52</td>
                            </tr>
                            <tr>
                                <th>반출입(처리)내용</th>
                            </tr>
                            <tr>
                                <td data-label="반출입(처리)내용" class> &nbsp; </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- Accordion body End -->
            </div>
        </div>

        <div class="col-xl-4">
            <div class="accordion_02">

                <div class="accordion-header js_accordion_item">
                    <div class="step-num">5</div>

                    <div class="step-txt">
                        <p class="step-title">
                            입항적하목록 운항정보 정정
                        </p>
                        <p class="step-time">
                            2021.10.14 PM 3:52
                        </p>
                    </div>
                </div>

                <div class="accordion-body">
                    <div class="accordion-content">
                        <table>
                            <!--tr>

                            <th>포장개수</th>

                            <td data-label="포장개수" class="td-50">1</td>

                            <th>중 량</th>

                            <td data-label="중량" class="td-50">3</td>

                            </tr-->
                            <tbody>
                            <tr>
                                <th>반출입(처리)일시</th>
                            </tr>
                            <tr>
                                <td data-label="반출입(처리)일시" class>2021.10.14 PM 3:52</td>
                            </tr>
                            <tr>
                                <th>반출입(처리)내용</th>
                            </tr>
                            <tr>
                                <td data-label="반출입(처리)내용" class>스위스포트코리아(주)</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- Accordion body End -->
            </div>
        </div>

        <div class="col-xl-4">
            <div class="accordion_02">

                <div class="accordion-header js_accordion_item">
                    <div class="step-num">6</div>

                    <div class="step-txt">
                        <p class="step-title">
                            하기신고 수리
                        </p>
                        <p class="step-time">
                            2021.10.14 PM 4:01
                        </p>
                    </div>
                </div>

                <div class="accordion-body">
                    <div class="accordion-content">
                        <table>
                            <!--tr>

                            <th>포장개수</th>

                            <td data-label="포장개수" class="td-50">1</td>

                            <th>중 량</th>

                            <td data-label="중량" class="td-50">3</td>

                            </tr-->
                            <tbody>
                            <tr>
                                <th>반출입(처리)일시</th>
                            </tr>
                            <tr>
                                <td data-label="반출입(처리)일시" class>2021.10.14 PM 4:01</td>
                            </tr>
                            <tr>
                                <th>반출입(처리)내용</th>
                            </tr>
                            <tr>
                                <td data-label="반출입(처리)내용" class>지정장치장(특송물류센터)_(주)레드프로그</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- Accordion body End -->
            </div>
        </div>

        <div class="col-xl-4">
            <div class="accordion_02">

                <div class="accordion-header js_accordion_item">
                    <div class="step-num">7</div>

                    <div class="step-txt">
                        <p class="step-title">
                            통관목록접수
                        </p>
                        <p class="step-time">
                            2021.10.14 PM 4:26
                        </p>
                    </div>
                </div>

                <div class="accordion-body">
                    <div class="accordion-content">
                        <table>
                            <!--tr>

                            <th>포장개수</th>

                            <td data-label="포장개수" class="td-50">1</td>

                            <th>중 량</th>

                            <td data-label="중량" class="td-50">3</td>

                            </tr-->
                            <tbody>
                            <tr>
                                <th>반출입(처리)일시</th>
                            </tr>
                            <tr>
                                <td data-label="반출입(처리)일시" class>2021.10.14 PM 4:26</td>
                            </tr>
                            <tr>
                                <th>반출입(처리)내용</th>
                            </tr>
                            <tr>
                                <td data-label="반출입(처리)내용" class>지정장치장(특송물류센터)_(주)레드프로그</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- Accordion body End -->
            </div>
        </div>

        <div class="col-xl-4">
            <div class="accordion_02">

                <div class="accordion-header js_accordion_item">
                    <div class="step-num">8</div>

                    <div class="step-txt">
                        <p class="step-title">
                            반입신고
                        </p>
                        <p class="step-time">
                            2021.10.15 AM 11:36
                        </p>
                    </div>
                </div>

                <div class="accordion-body">
                    <div class="accordion-content">
                        <table>
                            <!--tr>

                            <th>포장개수</th>

                            <td data-label="포장개수" class="td-50">1</td>

                            <th>중 량</th>

                            <td data-label="중량" class="td-50">3</td>

                            </tr-->
                            <tbody>
                            <tr>
                                <th>반출입(처리)일시</th>
                            </tr>
                            <tr>
                                <td data-label="반출입(처리)일시" class>2021.10.15 AM 11:36</td>
                            </tr>
                            <tr>
                                <th>반출입(처리)내용</th>
                            </tr>
                            <tr>
                                <td data-label="반출입(처리)내용" class>[부가사항] 지정장치장(특송물류센터)의 장치기간은 최대 2 개월 입니다.<br>
                                    입항 반입<br>
                                    지정장치장(특송물류센터)_(주)레드프로그</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- Accordion body End -->
            </div>
        </div>

        <div class="col-xl-4">
            <div class="accordion_02">

                <div class="accordion-header js_accordion_item">
                    <div class="step-num">9</div>

                    <div class="step-txt">
                        <p class="step-title">
                            반출신고
                        </p>
                        <p class="step-time">
                            2021.10.15 AM 11:36
                        </p>
                    </div>
                </div>

                <div class="accordion-body">
                    <div class="accordion-content">
                        <table>
                            <!--tr>

                            <th>포장개수</th>

                            <td data-label="포장개수" class="td-50">1</td>

                            <th>중 량</th>

                            <td data-label="중량" class="td-50">3</td>

                            </tr-->
                            <tbody>
                            <tr>
                                <th>반출입(처리)일시</th>
                            </tr>
                            <tr>
                                <td data-label="반출입(처리)일시" class>2021.10.15 AM 11:36</td>
                            </tr>
                            <tr>
                                <th>반출입(처리)내용</th>
                            </tr>
                            <tr>
                                <td data-label="반출입(처리)내용" class>&nbsp;목록통관특송물품 반출<br>
                                    지정장치장(특송물류센터)_(주)레드프로그</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- Accordion body End -->
            </div>
        </div>

        <div class="col-xl-4">
            <div class="accordion_02">

                <div class="accordion-header js_accordion_item">
                    <div class="step-num">10</div>

                    <div class="step-txt">
                        <p class="step-title">
                            통관목록심사완료
                        </p>
                        <p class="step-time">
                            2021.10.15 AM 11:36
                        </p>
                    </div>
                </div>

                <div class="accordion-body">
                    <div class="accordion-content">
                        <table>
                            <!--tr>

                            <th>포장개수</th>

                            <td data-label="포장개수" class="td-50">1</td>

                            <th>중 량</th>

                            <td data-label="중량" class="td-50">3</td>

                            </tr-->
                            <tbody>
                            <tr>
                                <th>반출입(처리)일시</th>
                            </tr>
                            <tr>
                                <td data-label="반출입(처리)일시" class>2021.10.15 AM 11:36</td>
                            </tr>
                            <tr>
                                <th>반출입(처리)내용</th>
                            </tr>
                            <tr>
                                <td data-label="반출입(처리)내용" class>
                                    지정장치장(특송물류센터)_(주)레드프로그
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- Accordion body End -->
            </div>
        </div>

    </div>

    <div class="margin-top-20"></div>

</div>
<%@ include file="../common_footer.jsp" %>

<script src="js/btn_ripple_effect.js"></script>
<script>
    $(document).ready(function () {
        $(".accordion_02 .js_accordion_item").click(function () {
            $(this).next(".accordion-body").slideToggle(200);
            $(this).toggleClass("active");
        });
    });
</script>

</body>
</html>