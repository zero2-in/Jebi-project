<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>

<link rel="stylesheet" href="css/airlines_list.css">

<!-- nav Script -->
<script>
    $(document).ready(function () {
        $("#breadcrumbs .dropbtn").click(function () {
            $("#breadcrumbs .dropdown-content").toggle(200);
            $("#breadcrumbs .select-area").toggleClass("active");
        });
    });
</script>
<%@ include file="common_cost_guide.jsp" %>

<!-- Container Start -->
<div id="container">
    <!-- cost-guide Start -->
    <div class="cost-guide">
        <!-- Title / nav-list  Start -->
        <div class="cost-guide-title"><p>배송비</p>
            <nav id="breadcrumbs" class="dark">
                <ul class="nav-list">
                    <li><a href="../index.html">Home</a></li>
                    <li>비용안내</li>
                    <li class="select-area">
                        <button class="dropbtn">배송비<span class="bs-caret"><span class="caret"></span></span></button>
                        <div class="dropdown-content">
                            <a href="shipping_list.html">배송비&nbsp;&nbsp;&nbsp;<i class="fas fa-check"></i></span></a>
                            <a href="add_ons_list.html">부가서비스</a>
                            <a href="purchasing_agency_fee_list.html">구매대행 수수료</a>
                        </div>
                    </li>
                </ul>
            </nav>
        </div>
        <!-- Title / nav-list  End -->

        <!-- Sub title  Start -->
        <div class="cost-guide-sub-title">
            <div class="btn-shipping">
                <a href="javascript:goSite('shipping_list')"><div class="shipping">배송비</div></a>
                <a href="javascript:goSite('add_ons_list')"><div class="add-ons">부가서비스</div></a>
                <a href="javascript:goSite('purchasing_agency_fee_list')"><div class="purchasing-agency-fee">구매대행 수수료</div></a>
            </div>
        </div>
        <!-- Sub title  End -->

        <!-- Content  Start -->
        <div class="shipping-content">
            <div class="shipping-box01">
                <ul class="shipping-charges-list">
                    <li><i class="fas fa-arrow-right"></i>&nbsp;&nbsp;배송요금은 1Kg부터 0.5Kg 단위로 절상하여 비용을 산정합니다. (예 : 1.36Kg = 1.5Kg)</li><br>
                    <li><i class="fas fa-arrow-right"></i>&nbsp;&nbsp;CJ택배에서 지정한 기준 무게, 부피 초과시 추가 운임 비용 착불 부과됩니다.</li><br>
                    <li><i class="fas fa-arrow-right"></i>&nbsp;&nbsp;국내배송은 CJ택배로 진행되며 택배사의 규정상 포장 부피가 가로+세로+높이의 합이 130cm 를 초과하는 경우, 변의 길이가 100cm 를 초과하는 경우, 중량이 20kg을 초과하는 경우에는 추가요금이 발생됩니다.</li><br>
                    <li><i class="fas fa-arrow-right"></i>&nbsp;&nbsp;무게에 비해 부피가 과도하게 큰 제품은 부피/무게가 적용될 수 있습니다.</li><br>
                    <li><i class="fas fa-arrow-right"></i>&nbsp;&nbsp;세관 지정 개인 자가사용 물품으로 볼 수 없거나, 목록통관 배제 물품, 목록통관 금액 초과(USD 150)로 과세대상인 경우 일반통관으로 진행되며 별도의 수입세를 납부하셔야 합니다.</li><br>
                    <li><i class="fas fa-arrow-right"></i>&nbsp;&nbsp;관련 법령 근거 운송불가 물품 및 검역 등이 필요한 물품을 운송지시 하여 발생한 모든 불이익은 직박구리가 책임지지 않으며 폐기, 반송, 검역 등에 따른 비용이 청구될 수 있습니다.</li><br>
                    <li><i class="fas fa-arrow-right"></i>&nbsp;&nbsp;통관관련 세관 요청시 성실한 대응 부탁드리며, 관세 납부지연 등으로 발생되는 부대비용(창고료 등)은 고객님께서 납부하셔야 합니다.</li>
                </ul>
            </div>
            <div class="shipping-box02">
                <div class="china-shipping-airlines">
                    <a href="javascript:goSite('shipping_list')"><div class="china-shipping">중국(해운)</div></a>
                    <a href="javascript:goSite('airlines_list')"><div class="china-airlines">중국(항공)</div></a>
                </div>
            </div>
            <div class="china-airlines-table-box">
                <table class="china-airlines-table">
                    <thead>
                    <tr>
                        <th>무게</th>
                        <th>일반</th>
                        <th>사업자</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr><td class="title">1Kg</td><td data-label="일반">￦6,500</td><td data-label="사업자">￦6,500</td></tr>
                    <tr><td class="title">1.5Kg</td><td data-label="일반">￦7,300</td><td data-label="사업자">￦7,300</td></tr>
                    <tr><td class="title">2Kg</td><td data-label="일반">￦8,100</td><td data-label="사업자">￦8,100</td></tr>
                    <tr><td class="title">2.5Kg</td><td data-label="일반">￦8,900</td><td data-label="사업자">￦8,900</td></tr>
                    <tr><td class="title">3Kg</td><td data-label="일반">￦9,700</td><td data-label="사업자">￦9,700</td></tr>
                    <tr><td class="title">3.5Kg</td><td data-label="일반">￦10,500</td><td data-label="사업자">￦10,500</td></tr>
                    <tr><td class="title">4Kg</td><td data-label="일반">￦11,300</td><td data-label="사업자">￦11,300</td></tr>
                    <tr><td class="title">4.5Kg</td><td data-label="일반">￦12,100</td><td data-label="사업자">￦12,100</td></tr>
                    <tr><td class="title">5Kg</td><td data-label="일반">￦12,900</td><td data-label="사업자">￦12,900</td></tr>
                    <tr><td class="title">5.5Kg</td><td data-label="일반">￦13,700</td><td data-label="사업자">￦13,700</td></tr>
                    <tr><td class="title">6Kg</td><td data-label="일반">￦14,500</td><td data-label="사업자">￦14,500</td></tr>
                    <tr><td class="title">6.5Kg</td><td data-label="일반">￦15,300</td><td data-label="사업자">￦15,300</td></tr>
                    <tr><td class="title">7Kg</td><td data-label="일반">￦16,100</td><td data-label="사업자">￦16,100</td></tr>
                    <tr><td class="title">7.5Kg</td><td data-label="일반">￦16,900</td><td data-label="사업자">￦16,900</td></tr>
                    <tr><td class="title">8Kg</td><td data-label="일반">￦17,700</td><td data-label="사업자">￦17,700</td></tr>
                    <tr><td class="title">8.5Kg</td><td data-label="일반">￦18,500</td><td data-label="사업자">￦18,500</td></tr>
                    <tr><td class="title">9Kg</td><td data-label="일반">￦19,300</td><td data-label="사업자">￦19,300</td></tr>
                    <tr><td class="title">9.5Kg</td><td data-label="일반">￦20,100</td><td data-label="사업자">￦20,100</td></tr>
                    <tr><td class="title">10Kg</td><td data-label="일반">￦20,900</td><td data-label="사업자">￦20,900</td></tr>
                    <tr><td class="title">10.5Kg</td><td data-label="일반">￦21,700</td><td data-label="사업자">￦21,700</td></tr>
                    <tr><td class="title">11Kg</td><td data-label="일반">￦22,500</td><td data-label="사업자">￦22,500</td></tr>
                    <tr><td class="title">11.5Kg</td><td data-label="일반">￦23,300</td><td data-label="사업자">￦23,300</td></tr>
                    <tr><td class="title">12Kg</td><td data-label="일반">￦24,100</td><td data-label="사업자">￦24,100</td></tr>
                    <tr><td class="title">12.5Kg</td><td data-label="일반">￦24,900</td><td data-label="사업자">￦24,900</td></tr>
                    <tr><td class="title">13Kg</td><td data-label="일반">￦25,700</td><td data-label="사업자">￦25,700</td></tr>
                    <tr><td class="title">13.5Kg</td><td data-label="일반">￦26,500</td><td data-label="사업자">￦26,500</td></tr>
                    <tr><td class="title">14Kg</td><td data-label="일반">￦27,300</td><td data-label="사업자">￦27,300</td></tr>
                    <tr><td class="title">14.5Kg</td><td data-label="일반">￦28,100</td><td data-label="사업자">￦28,100</td></tr>
                    <tr><td class="title">15Kg</td><td data-label="일반">￦28,900</td><td data-label="사업자">￦28,900</td></tr>
                    <tr><td class="title">15.5Kg</td><td data-label="일반">￦29,700</td><td data-label="사업자">￦29,700</td></tr>
                    <tr><td class="title">16Kg</td><td data-label="일반">￦30,500</td><td data-label="사업자">￦30,500</td></tr>
                    <tr><td class="title">16.5Kg</td><td data-label="일반">￦31,300</td><td data-label="사업자">￦31,300</td></tr>
                    <tr><td class="title">17Kg</td><td data-label="일반">￦32,100</td><td data-label="사업자">￦32,100</td></tr>
                    <tr><td class="title">17.5Kg</td><td data-label="일반">￦32,900</td><td data-label="사업자">￦32,900</td></tr>
                    <tr><td class="title">18Kg</td><td data-label="일반">￦33,700</td><td data-label="사업자">￦33,700</td></tr>
                    <tr><td class="title">18.5Kg</td><td data-label="일반">￦34,500</td><td data-label="사업자">￦34,500</td></tr>
                    <tr><td class="title">19Kg</td><td data-label="일반">￦35,300</td><td data-label="사업자">￦35,300</td></tr>
                    <tr><td class="title">19.5Kg</td><td data-label="일반">￦36,100</td><td data-label="사업자">￦36,100</td></tr>
                    <tr><td class="title">20Kg</td><td data-label="일반">￦36,900</td><td data-label="사업자">￦36,900</td></tr>
                    <tr><td class="title">20.5Kg</td><td data-label="일반">￦37,700</td><td data-label="사업자">￦37,700</td></tr>
                    <tr><td class="title">21Kg</td><td data-label="일반">￦38,500</td><td data-label="사업자">￦38,500</td></tr>
                    <tr><td class="title">21.5Kg</td><td data-label="일반">￦39,300</td><td data-label="사업자">￦39,300</td></tr>
                    <tr><td class="title">22Kg</td><td data-label="일반">￦40,100</td><td data-label="사업자">￦40,100</td></tr>
                    <tr><td class="title">22.5Kg</td><td data-label="일반">￦40,900</td><td data-label="사업자">￦40,900</td></tr>
                    <tr><td class="title">23Kg</td><td data-label="일반">￦41,700</td><td data-label="사업자">￦41,700</td></tr>
                    <tr><td class="title">23.5Kg</td><td data-label="일반">￦42,500</td><td data-label="사업자">￦42,500</td></tr>
                    <tr><td class="title">24Kg</td><td data-label="일반">￦43,300</td><td data-label="사업자">￦43,300</td></tr>
                    <tr><td class="title">24.5Kg</td><td data-label="일반">￦44,100</td><td data-label="사업자">￦44,100</td></tr>
                    <tr><td class="title">25Kg</td><td data-label="일반">￦44,900</td><td data-label="사업자">￦44,900</td></tr>
                    <tr><td class="title">25.5Kg</td><td data-label="일반">￦45,700</td><td data-label="사업자">￦45,700</td></tr>
                    <tr><td class="title">26Kg</td><td data-label="일반">￦46,500</td><td data-label="사업자">￦46,500</td></tr>
                    <tr><td class="title">26.5Kg</td><td data-label="일반">￦47,300</td><td data-label="사업자">￦47,300</td></tr>
                    <tr><td class="title">27Kg</td><td data-label="일반">￦48,100</td><td data-label="사업자">￦48,100</td></tr>
                    <tr><td class="title">27.5Kg</td><td data-label="일반">￦48,900</td><td data-label="사업자">￦48,900</td></tr>
                    <tr><td class="title">28Kg</td><td data-label="일반">￦49,700</td><td data-label="사업자">￦49,700</td></tr>
                    <tr><td class="title">28.5Kg</td><td data-label="일반">￦50,500</td><td data-label="사업자">￦50,500</td></tr>
                    <tr><td class="title">29Kg</td><td data-label="일반">￦51,300</td><td data-label="사업자">￦51,300</td></tr>
                    <tr><td class="title">29.5Kg</td><td data-label="일반">￦52,100</td><td data-label="사업자">￦52,100</td></tr>
                    <tr><td class="title">30Kg</td><td data-label="일반">￦52,900</td><td data-label="사업자">￦52,900</td></tr>
                    <tr><td class="title">30.5Kg</td><td data-label="일반">￦53,700</td><td data-label="사업자">￦53,700</td></tr>
                    <tr><td class="title">31Kg</td><td data-label="일반">￦54,500</td><td data-label="사업자">￦54,500</td></tr>
                    <tr><td class="title">31.5Kg</td><td data-label="일반">￦55,300</td><td data-label="사업자">￦55,300</td></tr>
                    <tr><td class="title">32Kg</td><td data-label="일반">￦56,100</td><td data-label="사업자">￦56,100</td></tr>
                    <tr><td class="title">32.5Kg</td><td data-label="일반">￦56,900</td><td data-label="사업자">￦56,900</td></tr>
                    <tr><td class="title">33Kg</td><td data-label="일반">￦57,700</td><td data-label="사업자">￦57,700</td></tr>
                    <tr><td class="title">33.5Kg</td><td data-label="일반">￦58,500</td><td data-label="사업자">￦58,500</td></tr>
                    <tr><td class="title">34Kg</td><td data-label="일반">￦59,300</td><td data-label="사업자">￦59,300</td></tr>
                    <tr><td class="title">34.5Kg</td><td data-label="일반">￦60,100</td><td data-label="사업자">￦60,100</td></tr>
                    <tr><td class="title">35Kg</td><td data-label="일반">￦60,900</td><td data-label="사업자">￦60,900</td></tr>
                    <tr><td class="title">35.5Kg</td><td data-label="일반">￦61,700</td><td data-label="사업자">￦61,700</td></tr>
                    <tr><td class="title">36Kg</td><td data-label="일반">￦62,500</td><td data-label="사업자">￦62,500</td></tr>
                    <tr><td class="title">36.5Kg</td><td data-label="일반">￦63,300</td><td data-label="사업자">￦63,300</td></tr>
                    <tr><td class="title">37Kg</td><td data-label="일반">￦64,100</td><td data-label="사업자">￦64,100</td></tr>
                    <tr><td class="title">37.5Kg</td><td data-label="일반">￦64,900</td><td data-label="사업자">￦64,900</td></tr>
                    <tr><td class="title">38Kg</td><td data-label="일반">￦65,700</td><td data-label="사업자">￦65,700</td></tr>
                    <tr><td class="title">38.5Kg</td><td data-label="일반">￦66,500</td><td data-label="사업자">￦66,500</td></tr>
                    <tr><td class="title">39Kg</td><td data-label="일반">￦67,300</td><td data-label="사업자">￦67,300</td></tr>
                    <tr><td class="title">39.5Kg</td><td data-label="일반">￦68,100</td><td data-label="사업자">￦68,100</td></tr>
                    <tr><td class="title">40Kg</td><td data-label="일반">￦68,900</td><td data-label="사업자">￦68,900</td></tr>
                    <tr><td class="title">40.5Kg</td><td data-label="일반">￦69,700</td><td data-label="사업자">￦69,700</td></tr>
                    <tr><td class="title">41Kg</td><td data-label="일반">￦70,500</td><td data-label="사업자">￦70,500</td></tr>
                    <tr><td class="title">41.5Kg</td><td data-label="일반">￦71,300</td><td data-label="사업자">￦71,300</td></tr>
                    <tr><td class="title">42Kg</td><td data-label="일반">￦72,100</td><td data-label="사업자">￦72,100</td></tr>
                    <tr><td class="title">42.5Kg</td><td data-label="일반">￦72,900</td><td data-label="사업자">￦72,900</td></tr>
                    <tr><td class="title">43Kg</td><td data-label="일반">￦73,700</td><td data-label="사업자">￦73,700</td></tr>
                    <tr><td class="title">43.5Kg</td><td data-label="일반">￦74,500</td><td data-label="사업자">￦74,500</td></tr>
                    <tr><td class="title">44Kg</td><td data-label="일반">￦75,300</td><td data-label="사업자">￦75,300</td></tr>
                    <tr><td class="title">44.5Kg</td><td data-label="일반">￦76,100</td><td data-label="사업자">￦76,100</td></tr>
                    <tr><td class="title">45Kg</td><td data-label="일반">￦76,900</td><td data-label="사업자">￦76,900</td></tr>
                    <tr><td class="title">45.5Kg</td><td data-label="일반">￦77,700</td><td data-label="사업자">￦77,700</td></tr>
                    <tr><td class="title">46Kg</td><td data-label="일반">￦78,500</td><td data-label="사업자">￦78,500</td></tr>
                    <tr><td class="title">46.5Kg</td><td data-label="일반">￦79,300</td><td data-label="사업자">￦79,300</td></tr>
                    <tr><td class="title">47Kg</td><td data-label="일반">￦80,100</td><td data-label="사업자">￦80,100</td></tr>
                    <tr><td class="title">47.5Kg</td><td data-label="일반">￦80,900</td><td data-label="사업자">￦80,900</td></tr>
                    <tr><td class="title">48Kg</td><td data-label="일반">￦81,700</td><td data-label="사업자">￦81,700</td></tr>
                    <tr><td class="title">48.5Kg</td><td data-label="일반">￦82,500</td><td data-label="사업자">￦82,500</td></tr>
                    <tr><td class="title">49Kg</td><td data-label="일반">￦83,300</td><td data-label="사업자">￦83,300</td></tr>
                    <tr><td class="title">49.5Kg</td><td data-label="일반">￦84,100</td><td data-label="사업자">￦84,100</td></tr>
                    <tr><td class="title">50Kg</td><td data-label="일반">￦84,900</td><td data-label="사업자">￦84,900</td></tr>
                    <tr><td class="title">50.5Kg</td><td data-label="일반">￦85,700</td><td data-label="사업자">￦85,700</td></tr>
                    <tr><td class="title">51Kg</td><td data-label="일반">￦86,500</td><td data-label="사업자">￦86,500</td></tr>
                    <tr><td class="title">51.5Kg</td><td data-label="일반">￦87,300</td><td data-label="사업자">￦87,300</td></tr>
                    <tr><td class="title">52Kg</td><td data-label="일반">￦88,100</td><td data-label="사업자">￦88,100</td></tr>
                    <tr><td class="title">52.5Kg</td><td data-label="일반">￦88,900</td><td data-label="사업자">￦88,900</td></tr>
                    <tr><td class="title">53Kg</td><td data-label="일반">￦89,700</td><td data-label="사업자">￦89,700</td></tr>
                    <tr><td class="title">53.5Kg</td><td data-label="일반">￦90,500</td><td data-label="사업자">￦90,500</td></tr>
                    <tr><td class="title">54Kg</td><td data-label="일반">￦91,300</td><td data-label="사업자">91,300</td></tr>
                    <tr><td class="title">54.5Kg</td><td data-label="일반">￦92,100</td><td data-label="사업자">￦92,100</td></tr>
                    <tr><td class="title">55Kg</td><td data-label="일반">￦92,900</td><td data-label="사업자">￦92,500</td></tr>
                    <tr><td class="title">55.5Kg</td><td data-label="일반">￦93,700</td><td data-label="사업자">￦93,700</td></tr>
                    <tr><td class="title">56Kg</td><td data-label="일반">￦94,500</td><td data-label="사업자">￦94,500</td></tr>
                    <tr><td class="title">56.5Kg</td><td data-label="일반">￦95,300</td><td data-label="사업자">￦95,300</td></tr>
                    <tr><td class="title">57Kg</td><td data-label="일반">￦96,100</td><td data-label="사업자">￦96,100</td></tr>
                    <tr><td class="title">57.5Kg</td><td data-label="일반">￦96,900</td><td data-label="사업자">￦96,500</td></tr>
                    <tr><td class="title">58Kg</td><td data-label="일반">￦97,700</td><td data-label="사업자">￦97,700</td></tr>
                    <tr><td class="title">58.5Kg</td><td data-label="일반">￦98,500</td><td data-label="사업자">￦98,500</td></tr>
                    <tr><td class="title">59Kg</td><td data-label="일반">￦99,300</td><td data-label="사업자">￦99,300</td></tr>
                    <tr><td class="title">59.5Kg</td><td data-label="일반">￦100,100</td><td data-label="사업자">￦100,100</td></tr>
                    <tr><td class="title">60Kg</td><td data-label="일반">￦100,900</td><td data-label="사업자">￦100,9,00</td></tr>
                    <tr><td class="title">60.5Kg</td><td data-label="일반">￦101,700</td><td data-label="사업자">￦101,700</td></tr>
                    <tr><td class="title">61Kg</td><td data-label="일반">￦102,500</td><td data-label="사업자">￦102,500</td></tr>
                    <tr><td class="title">61.5Kg</td><td data-label="일반">￦103,300</td><td data-label="사업자">￦103,300</td></tr>
                    <tr><td class="title">62Kg</td><td data-label="일반">￦104,100</td><td data-label="사업자">￦104,100</td></tr>
                    <tr><td class="title">62.5Kg</td><td data-label="일반">￦104,900</td><td data-label="사업자">￦104,900</td></tr>
                    <tr><td class="title">63Kg</td><td data-label="일반">￦105,700</td><td data-label="사업자">￦105,700</td></tr>
                    <tr><td class="title">63.5Kg</td><td data-label="일반">￦106,500</td><td data-label="사업자">￦106,500</td></tr>
                    <tr><td class="title">64Kg</td><td data-label="일반">￦107,300</td><td data-label="사업자">￦107,300</td></tr>
                    <tr><td class="title">64.5Kg</td><td data-label="일반">￦108,100</td><td data-label="사업자">￦108,100</td></tr>
                    <tr><td class="title">65Kg</td><td data-label="일반">￦108,900</td><td data-label="사업자">￦108,900</td></tr>
                    <tr><td class="title">65.5Kg</td><td data-label="일반">￦109,700</td><td data-label="사업자">￦109,700</td></tr>
                    <tr><td class="title">66Kg</td><td data-label="일반">￦110,500</td><td data-label="사업자">￦110,500</td></tr>
                    <tr><td class="title">66.5Kg</td><td data-label="일반">￦111,300</td><td data-label="사업자">￦111,300</td></tr>
                    <tr><td class="title">67Kg</td><td data-label="일반">￦112,100</td><td data-label="사업자">￦112,100</td></tr>
                    <tr><td class="title">67.5Kg</td><td data-label="일반">￦112,900</td><td data-label="사업자">￦112,900</td></tr>
                    <tr><td class="title">68Kg</td><td data-label="일반">￦113,700</td><td data-label="사업자">￦113,700</td></tr>
                    <tr><td class="title">68.5Kg</td><td data-label="일반">￦114,500</td><td data-label="사업자">￦114,500</td></tr>
                    <tr><td class="title">69Kg</td><td data-label="일반">￦115,300</td><td data-label="사업자">￦115,300</td></tr>
                    <tr><td class="title">69.5Kg</td><td data-label="일반">￦116,100</td><td data-label="사업자">￦116,100</td></tr>
                    <tr><td class="title">70Kg</td><td data-label="일반">￦116,900</td><td data-label="사업자">￦116,900</td></tr>
                    <tr><td class="title">70.5Kg</td><td data-label="일반">￦117,700</td><td data-label="사업자">￦117,700</td></tr>
                    <tr><td class="title">71Kg</td><td data-label="일반">￦118,500</td><td data-label="사업자">￦118,500</td></tr>
                    <tr><td class="title">71.5Kg</td><td data-label="일반">￦119,300</td><td data-label="사업자">￦119,300</td></tr>
                    <tr><td class="title">72Kg</td><td data-label="일반">￦120,100</td><td data-label="사업자">￦120,100</td></tr>
                    <tr><td class="title">72.5Kg</td><td data-label="일반">￦120,900</td><td data-label="사업자">￦120,900</td></tr>
                    <tr><td class="title">73Kg</td><td data-label="일반">￦121,700</td><td data-label="사업자">￦121,700</td></tr>
                    <tr><td class="title">73.5Kg</td><td data-label="일반">￦122,500</td><td data-label="사업자">￦122,500</td></tr>
                    <tr><td class="title">74Kg</td><td data-label="일반">￦123,300</td><td data-label="사업자">￦123,300</td></tr>
                    <tr><td class="title">74.5Kg</td><td data-label="일반">￦124,100</td><td data-label="사업자">￦124,100</td></tr>
                    <tr><td class="title">75Kg</td><td data-label="일반">￦124,900</td><td data-label="사업자">￦124,900</td></tr>
                    <tr><td class="title">75.5Kg</td><td data-label="일반">￦125,700</td><td data-label="사업자">￦125,700</td></tr>
                    <tr><td class="title">76Kg</td><td data-label="일반">￦126,500</td><td data-label="사업자">￦126,500</td></tr>
                    <tr><td class="title">76.5Kg</td><td data-label="일반">￦127,300</td><td data-label="사업자">￦127,300</td></tr>
                    <tr><td class="title">77Kg</td><td data-label="일반">￦128,100</td><td data-label="사업자">￦128,100</td></tr>
                    <tr><td class="title">77.5Kg</td><td data-label="일반">￦128,900</td><td data-label="사업자">￦128,900</td></tr>
                    <tr><td class="title">78Kg</td><td data-label="일반">￦129,700</td><td data-label="사업자">￦129,700</td></tr>
                    <tr><td class="title">78.5Kg</td><td data-label="일반">￦130,500</td><td data-label="사업자">￦130,500</td></tr>
                    <tr><td class="title">79Kg</td><td data-label="일반">￦131,300</td><td data-label="사업자">￦131,300</td></tr>
                    <tr><td class="title">79.5Kg</td><td data-label="일반">￦132,100</td><td data-label="사업자">￦132,100</td></tr>
                    <tr><td class="title">80Kg</td><td data-label="일반">￦132,900</td><td data-label="사업자">￦132,900</td></tr>
                    <tr><td class="title">80.5Kg</td><td data-label="일반">￦133,700</td><td data-label="사업자">￦133,700</td></tr>
                    <tr><td class="title">81Kg</td><td data-label="일반">￦134,500</td><td data-label="사업자">￦134,500</td></tr>
                    <tr><td class="title">81.5Kg</td><td data-label="일반">￦135,300</td><td data-label="사업자">￦135,300</td></tr>
                    <tr><td class="title">82Kg</td><td data-label="일반">￦136,100</td><td data-label="사업자">￦136,100</td></tr>
                    <tr><td class="title">82.5Kg</td><td data-label="일반">￦136,900</td><td data-label="사업자">￦136,900</td></tr>
                    <tr><td class="title">83Kg</td><td data-label="일반">￦137,700</td><td data-label="사업자">￦137,700</td></tr>
                    <tr><td class="title">83.5Kg</td><td data-label="일반">￦138,500</td><td data-label="사업자">￦138,500</td></tr>
                    <tr><td class="title">84Kg</td><td data-label="일반">￦139,300</td><td data-label="사업자">￦139,300</td></tr>
                    <tr><td class="title">84.5Kg</td><td data-label="일반">￦140,100</td><td data-label="사업자">￦140,100</td></tr>
                    <tr><td class="title">85Kg</td><td data-label="일반">￦140,900</td><td data-label="사업자">￦140,900</td></tr>
                    <tr><td class="title">85.5Kg</td><td data-label="일반">￦141,700</td><td data-label="사업자">￦141,700</td></tr>
                    <tr><td class="title">86Kg</td><td data-label="일반">￦142,500</td><td data-label="사업자">￦142,500</td></tr>
                    <tr><td class="title">86.5Kg</td><td data-label="일반">￦143,300</td><td data-label="사업자">￦143,300</td></tr>
                    <tr><td class="title">87Kg</td><td data-label="일반">￦144,100</td><td data-label="사업자">￦144,100</td></tr>
                    <tr><td class="title">87.5Kg</td><td data-label="일반">￦144,900</td><td data-label="사업자">￦144,900</td></tr>
                    <tr><td class="title">88Kg</td><td data-label="일반">￦145,700</td><td data-label="사업자">￦145,700</td></tr>
                    <tr><td class="title">88.5Kg</td><td data-label="일반">￦146,500</td><td data-label="사업자">￦146,500</td></tr>
                    <tr><td class="title">89Kg</td><td data-label="일반">￦147,300</td><td data-label="사업자">￦147,300</td></tr>
                    <tr><td class="title">89.5Kg</td><td data-label="일반">￦148,100</td><td data-label="사업자">￦148,100</td></tr>
                    <tr><td class="title">90Kg</td><td data-label="일반">￦148,900</td><td data-label="사업자">￦148,900</td></tr>
                    <tr><td class="title">90.5Kg</td><td data-label="일반">￦149,700</td><td data-label="사업자">￦149,700</td></tr>
                    <tr><td class="title">91Kg</td><td data-label="일반">￦150,500</td><td data-label="사업자">￦150,500</td></tr>
                    <tr><td class="title">91.5Kg</td><td data-label="일반">￦151,300</td><td data-label="사업자">￦151,300</td></tr>
                    <tr><td class="title">92Kg</td><td data-label="일반">￦152,100</td><td data-label="사업자">￦152,100</td></tr>
                    <tr><td class="title">92.5Kg</td><td data-label="일반">￦152,900</td><td data-label="사업자">￦152,900</td></tr>
                    <tr><td class="title">93Kg</td><td data-label="일반">￦153,700</td><td data-label="사업자">￦153,700</td></tr>
                    <tr><td class="title">93.5Kg</td><td data-label="일반">￦154,500</td><td data-label="사업자">￦154,500</td></tr>
                    <tr><td class="title">94Kg</td><td data-label="일반">￦155,300</td><td data-label="사업자">￦155,300</td></tr>
                    <tr><td class="title">94.5Kg</td><td data-label="일반">￦156,100</td><td data-label="사업자">￦156,100</td></tr>
                    <tr><td class="title">95Kg</td><td data-label="일반">￦156,900</td><td data-label="사업자">￦156,900</td></tr>
                    <tr><td class="title">95.5Kg</td><td data-label="일반">￦157,700</td><td data-label="사업자">￦157,700</td></tr>
                    <tr><td class="title">96Kg</td><td data-label="일반">￦158,500</td><td data-label="사업자">￦158,500</td></tr>
                    <tr><td class="title">96.5Kg</td><td data-label="일반">￦159,300</td><td data-label="사업자">￦159,300</td></tr>
                    <tr><td class="title">97Kg</td><td data-label="일반">￦160,100</td><td data-label="사업자">￦160,100</td></tr>
                    <tr><td class="title">97.5Kg</td><td data-label="일반">￦160,900</td><td data-label="사업자">￦160,900</td></tr>
                    <tr><td class="title">98Kg</td><td data-label="일반">￦161,700</td><td data-label="사업자">￦161,700</td></tr>
                    <tr><td class="title">98.5Kg</td><td data-label="일반">￦162,500</td><td data-label="사업자">￦162,500</td></tr>
                    <tr><td class="title">99Kg</td><td data-label="일반">￦163,300</td><td data-label="사업자">￦163,300</td></tr>
                    <tr><td class="title">99.5Kg</td><td data-label="일반">￦164,100</td><td data-label="사업자">￦164,100</td></tr>
                    <tr><td class="title">100Kg</td><td data-label="일반">￦164,900</td><td data-label="사업자">￦164,900</td></tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Content  End -->

    </div>
    <!-- cost-guide End-->
</div>
<!-- Container End -->

<!-- Footer -->
<%@ include file="../common_footer.jsp" %>
</body>

</html>