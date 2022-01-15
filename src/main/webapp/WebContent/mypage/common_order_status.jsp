<%@ page pageEncoding="UTF-8" %>
<script>
    $(document).ready(function () {
        $("#breadcrumbs #pageTitle").html("주문신청 현황");
        $("#breadcrumbs .order_status").addClass("selected");
        $("#breadcrumbs .order_status").attr("href", "javascript:void(0)");
        $("#footer .informationuse").addClass("mypage");
    });
</script>