<%@ page pageEncoding="UTF-8" %>
<!-- nav Script -->
<script>
    $(document).ready(function () {
        $(".menu-main #myPage").addClass("active");
        $("#breadcrumbs .dropbtn").click(function () {
            $("#breadcrumbs .dropdown-content").toggle(200);
            $("#breadcrumbs .select-area .caret").toggleClass("active");
        });
    });
</script>

<!-- 사이트 이동경로를 만들어라! -->
<nav id="breadcrumbs" class="dark">
    <ul class="nav-list">
        <li><a href="/jebi">Home</a></li>
        <li>마이페이지</li>
        <li class="select-area">
            <button class="dropbtn"><span id="pageTitle"></span> <span class="bs-caret"><span class="caret"></span></span></button>
            <div class="dropdown-content">
                <a href="javascript:goSite('mypage')"class="order_status">주문신청 현황<span class="check"></span></a>
                <a href="javascript:goSite('purchase_manage')"class="purchase_manage">결제 관리              <span class="check"></span> </a>
                <a href="javascript:goSite('deposit_history')"class="deposit_history">예치금 내역             <span class="check"></span> </a>
                <a href="javascript:goSite('point_history')"class="point_history">포인트 내역             <span class="check"></span> </a>
                <a href="javascript:goSite('coupon_history')"class="coupon_history">쿠폰 내역              <span class="check"></span> </a>
                <a href="javascript:goSite('mailbox')"class="mailbox">받은 쪽지함             <span class="check"></span> </a>
                <a href="javascript:goSite('myinfo')"class="myinfo">회원정보 수정            <span class="check"></span>     </a>
            </div>
        </li>
        <div class="clearfix"></div>
    </ul>
</nav>