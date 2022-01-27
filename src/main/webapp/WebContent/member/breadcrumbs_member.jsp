<%@ page pageEncoding="UTF-8" %>
<!-- nav Script -->
<script>
    $(document).ready(function () {
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
        <li>회원관리</li>
        <li class="select-area">
            <button class="dropbtn"><span id="pageTitle"></span>&nbsp;<span class="bs-caret"><span class="caret"></span></span></button>
            <div class="dropdown-content">
                <a href="javascript:goSite('join')" class="join">회원가입<span class="check"></span></a>
                <a href="javascript:goSite('login')" class="login">로그인<span class="check"></span></a>
                <a href="javascript:goSite('findidpw')" class="findidpw">아이디/비번찾기<span class="check"></span></a>
            </div>
        </li>
        <div class="clearfix"></div>
    </ul>
</nav>