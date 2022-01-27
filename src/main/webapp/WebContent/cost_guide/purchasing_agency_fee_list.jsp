<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../common_header.jsp" %>

<link rel="stylesheet" href="css/purchasing_agency_fee_list.css">

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
        <div class="cost-guide-title"><p>구매대행 수수료</p>
            <nav id="breadcrumbs" class="dark">
                <ul class="nav-list">
                    <li><a href="/jebi">Home</a></li>
                    <li>비용안내</li>
                    <li class="select-area">
                        <button class="dropbtn">구매대행 수수료<span class="bs-caret"><span class="caret"></span></span></button>
                        <div class="dropdown-content">
                            <a href="javascript:goSite('shipping_list')">배송비</a>
                            <a href="javascript:goSite('add_ons_list')">부가서비스</a>
                            <a href="javascript:goSite('purchasing_agency_fee_list')">구매대행 수수료&nbsp;&nbsp;&nbsp;<i class="fas fa-check"></i></a>
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
        <div class="purchasing-agency-fee-content">
            <div class="purchasing-agency-fee-img"><img src="images/purchasing_agency_fee_img.jpg" height="120px"></div>
            <div class="product-price"><img src="images/product_price_img.jpg" height="198px"></div>
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