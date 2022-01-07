<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>
<%@ include file="../common_header.jsp" %>
<c:if test="${not empty session_name}">
    <script>
        alert("이미 로그인하셨습니다!");
        location.href="/jebi"; //TODO 마이페이지로
    </script>
</c:if>

<script>
     $(document).ready(function () {
        $("#breadcrumbs #pageTitle").html("로그인");
        $("#breadcrumbs .login").addClass("selected");
        $("#breadcrumbs .login").attr("href", "javascript:void(0)");
    });
</script>

    <div class="container-login">
        <div class="bar-title">
            <h2 class="title">로그인</h2>
            <%@ include file="breadcrumbs_member.jsp" %>
        </div>

        <form action="Member" method="post" onsubmit="return check();" name="login">
            <input type="hidden" name="separate" value="dologin">
            <div class="board-login">
                <div class="text-welcome">
                    <h3 class="title">Login is welcome.</h3>
                    <span class="info">서비스를 이용하기 위해서 로그인을 해주세요.</span>
                </div>

                <div class="form-login">
                    <!-- 로그인 텍스트 상자 -->
                    <p class="box-text">
                        <i class="fas fa-user-circle"></i>
                        <input type="text" class="input" name="id" placeholder="ID" autofocus onkeypress="if(event.keyCode == '13') login.password.focus();">
                    </p>
                    <p class="box-text">
                        <i class="fas fa-lock"></i>
                        <input type="password" name="password" placeholder="Password" class="input" onkeypress="if(event.keyCode == '13') check();">
                    </p>

                    <div class="checkbox">
                        <input type="checkbox" name="saveId" id="saveId" value="y">
                        <label for="saveId">
                            <span class="icon-checkbox"></span> 아이디 저장
                        </label>
                    </div>
                    
                    <!-- 로그인 버튼 -->
                    <button type="button" class="btn-submit ripple-effect" data-animation="ripple" onclick="setTimeout(function() {check();}, 100);">
                        <span class="text">로그인</span>
                        <span class="arrow-animate"><i class="fas fa-long-arrow-alt-right"></i></span>
                    </button>

                    <!-- 버튼 회원가입, 찾기 그룹! -->
                    <div class="btn-group-login">

                        <button type="button" class="join-login ripple-effect" data-animation="ripple" onclick="setTimeout(function() {goSite('join');}, 150);">
                            <i class="fas fa-user-plus"></i>&nbsp;&nbsp;회원가입
                        </button>

                        <button type="button" class="idpw-find ripple-effect" data-animation="ripple">
                            <i class="fas fa-search"></i>&nbsp;&nbsp;ID/PW 찾기
                        </button>

                    </div>
                    <!-- 소셜 로그인 -->
                    <div class="social-login-separator">
                        <span>or</span>
                    </div>
                    
                    <div class="social-login-btn">

                        <button type="button" id="naverIdLogin_loginButton" class="naver-login ripple-effect" data-animation="ripple">
                            네이버
                        </button>
                        <button type="button" onclick="kakaoLogin()" class="kakao-login ripple-effect" data-animation="ripple">
                            카카오
                        </button>

                    </div>
                </div>
            </div>
        </form>
        <form action="Member" method="post" name="kakaologin">
            <input type="hidden" name="separate" value="kakaoSave">
            <input type="hidden" name="k_id">
            <input type="hidden" name="k_nickname">
            <input type="hidden" name="k_email">
        </form>

        <!-- Scripts -->
        <script src="js/btn_ripple_effect.js"></script>
        <script src="js/use_cookie_save_id.js"></script>
        <script>
            function check() {
                if(checkValue(login.id, "아이디를 입력하세요")) return;
                if(checkValue(login.password, "비밀번호를 입력하세요")) return;

                saveid();

                login.submit();
            }
        </script>
        <script src="js/naver_login.js"></script>
        <script src="js/kakao_login.js"></script>
    </div>

    <!-- Footer -->
    <%@ include file="../common_footer.jsp" %>
</body>
</html>