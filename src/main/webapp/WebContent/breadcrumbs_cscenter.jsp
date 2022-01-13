<%@ page pageEncoding="UTF-8" %>
<!-- nav Script -->
<script>
    $(document).ready(function () {
        $(".menu-main #csCenter").addClass("active");
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
        <li>고객센터</li>
        <li class="select-area">
            <button class="dropbtn"><span id="pageTitle"></span> <span class="bs-caret"><span class="caret"></span></span></button>
            <div class="dropdown-content">
                <a href="javascript:goSite('notice')"    class="notice">공지사항<span class="check"></span></a>
                <a href="javascript:goSite('faq')"       class="faq">자주하는질문   <span class="check"></span></a>
                <a href="javascript:goSite('qna')"       class="qna">1:1문의        <span class="check"></span></a>
                <a href="javascript:goSite('review')"    class="review">이용후기    <span class="check"></span></a>
                <a href="javascript:goSite('event')"     class="event">이벤트       <span class="check"></span></a>
                <a href="javascript:goSite('nodata')"    class="nodata">노데이터    <span class="check"></span></a>
                <a href="javascript:goSite('clearance')" class="clearance">통관조회 <span class="check"></span></a>
            </div>
        </li>
        <div class="clearfix"></div>
    </ul>
</nav>