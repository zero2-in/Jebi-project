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
        <script>
            $(function() {
                
                fnInit();
                
            });

            function fnInit(){
                var cookieid = getCookie("saveid");
                console.log(cookieid);
                if(cookieid !=""){
                    $("input:checkbox[id='saveId']").prop("checked", true);
                    login.id.value = cookieid;
                }
                
            }    

            function setCookie(name, value, expiredays) {
                var todayDate = new Date();
                todayDate.setTime(todayDate.getTime() + 0);
                if(todayDate > expiredays){
                    document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expiredays + ";";
                }else if(todayDate < expiredays){
                    todayDate.setDate(todayDate.getDate() + expiredays);
                    document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
                }
                
                
                console.log(document.cookie);
            }

            function getCookie(Name) {
                var search = Name + "=";
                console.log("search : " + search);
                
                if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
                    offset = document.cookie.indexOf(search);
                    console.log("offset : " + offset);
                    if (offset != -1) { // 쿠키가 존재하면 
                        offset += search.length;
                        // set index of beginning of value
                        end = document.cookie.indexOf(";", offset);
                        console.log("end : " + end);
                        // 쿠키 값의 마지막 위치 인덱스 번호 설정 
                        if (end == -1)
                            end = document.cookie.length;
                        console.log("end위치  : " + end);
                        
                        return unescape(document.cookie.substring(offset, end));
                    }
                }
                return "";
            }

            function saveid() {
                var expdate = new Date();
                if ($("#saveId").is(":checked")){
                    expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
                    setCookie("saveid", login.id.value, expdate);
                    }else{
                    expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
                    setCookie("saveid", login.id.value, expdate);
                    
                }
            }
            function check() {
                if(checkValue(login.id, "아이디를 입력하세요")) return;
                if(checkValue(login.password, "비밀번호를 입력하세요")) return;

                saveid();

                login.submit();
            }
        </script>
        <!-- Naver Login -->
        <script>
            var naverLogin = new naver.LoginWithNaverId(
                {
                    clientId: "h7lrKULKMeSh_QPm3QPL", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
                    callbackUrl: "http://183.107.30.124:8080/jebi/NaverLogin", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
                    isPopup: true,
                    callbackHandle: true
                }
            );	

            naverLogin.init();

            window.addEventListener('load', function () {
                naverLogin.getLoginStatus(function (status) {
                    if (status) {
                        var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
                        
                        console.log(naverLogin.user); 
                        
                        if( email == undefined || email == null) {
                            alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
                            naverLogin.reprompt();
                            return;
                        }
                    } else {
                        console.log("callback 처리에 실패하였습니다.");
                    }
                });
            });
        </script>
        <!-- Kakao Login -->
        <script>
            window.Kakao.init('ea9b16978914214066b5b86cbe93e844');

            function kakaoLogin() {
                window.Kakao.Auth.login({
                    scope: 'profile_nickname, account_email', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                    success: function(response) {
                        console.log(response) // 로그인 성공하면 받아오는 데이터
                        window.Kakao.API.request({ // 사용자 정보 가져오기 
                            url: '/v2/user/me',
                            success: (res) => {
                                //const kakao_account = res.kakao_account;
                                //console.log(kakao_account);

                                kakaologin.k_id.value = res.id;
                                kakaologin.k_nickname.value = res.properties.nickname;
                                kakaologin.k_email.value = res.kakao_account.email;
                                kakaologin.submit();
                            }
                        });
                        // window.location.href='/ex/kakao_login.html' //리다이렉트 되는 코드
                    },
                    fail: function(error) {
                        console.log(error);
                    }
                });
            }
        </script>
    </div>

    <!-- Footer -->
    <%@ include file="../common_footer.jsp" %>
</body>
</html>