<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../common_header.jsp" %>

<link rel="stylesheet" href="css/add_ons_list.css">

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
        <div class="cost-guide-title"><p>부가서비스</p>
            <nav id="breadcrumbs" class="dark">
                <ul class="nav-list">
                    <li><a href="/jebi">Home</a></li>
                    <li>비용안내</li>
                    <li class="select-area">
                        <button class="dropbtn">부가서비스<span class="bs-caret"><span class="caret"></span></span></button>
                        <div class="dropdown-content">
                            <a href="javascript:goSite('shipping_list')">배송비</a>
                            <a href="javascript:goSite('add_ons_list')">부가서비스&nbsp;&nbsp;&nbsp;<i class="fas fa-check"></i></a>
                            <a href="javascript:goSite('purchasing_agency_fee_list')">구매대행 수수료</a>
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
        <div class="add-ons-content">
            <div class="add-ons-cost"><img src="images/add_ons_cost_img.jpg" height="120px"></div>
            <div class="inspection-option"><img src="images/inspection_option_img.jpg" height="241px"></div>
            <div class="photo-shoot"><img src="images/photo_shoot_img.jpg" height="314px"></div>
            <div class="packaging-options"><img src="images/packaging_options_img.jpg" height="306px"></div>
            <div class="customs-options"><img src="images/customs_optionsimg.jpg" height="251px"></div>
            <div class="customs-duty"><img src="images/customs_duty_img.jpg" height="347px"></div>
            <div class="return"><img src="images/return_img.png" height="470"></div>
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