<%@ page pageEncoding="UTF-8" %>

<!-- nav Script -->
<script>
    $(document).ready(function () {
        $(".menu-main #zeus").addClass("active");
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
        <li>관리자</li>
        <li class="select-area">
            <button class="dropbtn"><span id="pageTitle"></span> <span class="bs-caret"><span class="caret"></span></span></button>
            <div class="dropdown-content">
                <a href="Zeus" class="order_status">주문현황 관리<span class="check"></span></a>
                <a href="Zeus?separate=member" class="member_manage">회원관리<span class="check"></span></a>
            </div>
        </li>
        <div class="clearfix"></div>
    </ul>
</nav>