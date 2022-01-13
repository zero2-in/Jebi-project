<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../common_header.jsp" %>

<link rel="stylesheet" href="css/return_refund_manual_list.css">

<!-- nav Script -->
<script>
    $(document).ready(function () {
        $("#breadcrumbs .dropbtn").click(function () {
            $("#breadcrumbs .dropdown-content").toggle(200);
            $("#breadcrumbs .select-area").toggleClass("active");
        });
    });
</script>

<!-- Container Start -->
<div id="container">
    <!-- Informatio Use Start -->
    <div class="informationuse">
        <!-- Title / nav-list  Start -->
        <div class="informationuse-title"><p>반품/환불방법</p>
            <nav id="breadcrumbs" class="dark">
                <ul class="nav-list">
                    <li><a href="../index.html">Home</a></li>
                    <li>이용안내</li>
                    <li class="select-area">
                        <button class="dropbtn">타오바오 이용방법<span class="bs-caret"><span class="caret"></span></span></button>
                        <div class="dropdown-content">
                            <a href="javascript:goSite('delivery_agent_service_list')">배송대행 이용방법</a>
                            <a href="javascript:goSite('purchasing_agent_service_list')">구매대행 이용방법</a>
                            <a href="javascript:goSite('business_user_guide_list')">사업자 이용안내</a>
                            <a href="javascript:goSite('joni_manual_list')">타오바오 이용방법&nbsp;&nbsp;&nbsp;<i class="fas fa-check"></i></a>
                            <a href="javascript:goSite('chinese_size_condition_table_list')">이용팁</a>
                            <a href="javascript:goSite('nodata_processing_manual_list')">노데이터 처리방법</a>
                        </div>
                    </li>
                </ul>
            </nav>
        </div>
        <!-- Title / nav-list  End -->

        <!-- Sub title  Start -->
        <div class="informationuse-sub-title">
            <div class="delivery-agent">
                <div class="delivery-agent-manual">배송대행 이용방법</div>
                <a href="javascript:goSite('delivery_agent_service_list')"><div class="delivery-agent-service">배송대행 서비스 안내</div></a>
                <a href="javascript:goSite('delivery_agent_application_manual_list')"><div class="delivery-agent-application-manual">배송대행 신청서 작성법</div></a>
            </div>
            <div class="purchasingagent-agent">
                <div class="purchasingagent-agent-manual">구매대행 이용방법</div>
                <a href="javascript:goSite('purchasing_agent_service_list')"><div class="purchasingagent-agent-service">구매대행 서비스 안내</div></a>
                <a href="javascript:goSite('purchasingagent_agent_application_manual_list')"><div class="purchasingagent-agent-application-manual">구매대행 신청서 작성법</div></a>
            </div>
            <a href="javascript:goSite('business_user_guide_list')"><div class="business-user-guide">사업자 이용안내</div></a>
            <div class="taobao-agent">
                <div class="taobao-manual">타오바오 이용방법</div>
                <a href="javascript:goSite('joni_manual_list')"><div class="join-manual">가입방법</div></a>
                <a href="javascript:goSite('address_manual_list')"><div class="address-manual">주소 설정하기</div></a>
                <a href="javascript:goSite('purchase_payment_list')"><div class="purchase-payment">구매결제하기</div></a>
                <a href="javascript:goSite('return_refund_manual_list')"><div class="return-refund-manual">반품/환불방법</div></a>
                <a href="javascript:goSite('invoice_number_list')"><div class="invoice-number">송장번호 확인하기</div></a>
                <a href="javascript:goSite('automatic_order_registration_list')"><div class="automatic-order-registration">주문자동등록방법</div></a>
            </div>
            <div class="use-tip-agent">
                <div class="use-tip">이용팁</div>
                <a href="javascript:goSite('chinese_size_condition_table_list')"><div class="chinese-size-condition-table">중국사이즈 조건표</div></a>
                <a href="javascript:goSite('chinese_delivery_tracking_list')"><div class="chinese-delivery-tracking">중국내 배송조회</div></a>
                <a href="javascript:goSite('issuance_of_unique_number_list')"><div class="issuance-of-unique-number">개인통관고유부호발급 방법</div></a>
                <a href="javascript:goSite('customs_duty_list')"><div class="customs-duty">관/부가세 안내</div></a>
                <a href="javascript:goSite('import_prohibited_items_list')"><div class="import-prohibited-items">수입금지품목</div></a>
            </div>
            <a href="javascript:goSite('nodata_processing_manual_list')"><div class="nodata-processing-manual">노데이터 처리방법</div></a>
        </div>
        <!-- Sub title  End -->

        <!-- Content  Start -->
        <div class="return-refund-manual-content">
            <div class="return-refund-title01">1.로그인 후 오른쪽 상단 【我的淘宝】클릭</div>
            <div class="return-refund-manual01"><img src="images/return_refund_manual_img.jpg" height="440px"></div>
            <div class="return-refund-title02">2.【我的淘宝】 -》 【已买到的宝贝】클릭</div>
            <div class="return-refund-manual02"><img src="images/return_refund_manual01_img.jpg" height="423px"></div>
            <div class="return-refund-title03">3.【所有订单】모든 구매내역 보기 클릭<br><br>반품/환불할 제품 주문서에서 退款/退货 클릭</div>
            <div class="return-refund-manual03"><img src="images/return_refund_manual02_img.jpg" height="384"></div>
            <div class="return-refund-title04">4. 退款原因 반품사유 선택 후 提交 클릭<br><br><span>발송전 구매 취소를 하는 경우<br><br><span>첫번째 拍错/多拍/不想要 선택해 주세요</spa></span></div>
            <div class="return-refund-manual04"><img src="images/return_refund_manual03_img.jpg" height="751px"></div>
        </div>
        <!-- Content  End -->

    </div>
    <!-- Informatio Use End-->
</div>
<!-- Container End -->

<!-- Footer -->
<%@ include file="../common_footer.jsp" %>

<script src="js/btn_ripple_effect.js"></script>
</body>

</html>