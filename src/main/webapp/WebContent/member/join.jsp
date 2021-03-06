<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file="../common_header.jsp" %>
<c:if test="${not empty session_name}">
    <script>
        alert("이미 로그인하셨습니다!");
        location.href="/jebi";
    </script>
</c:if>

<div id="small-dialog" class="zoom-anim-dialog dialog-with-tabs mfp-hide">
    <div class="sign-in-form" id="dialog-cont">

    </div>
</div>

<!-- Magnific popup css -->
<link rel="stylesheet" href="css/magnific-popup.css">
<script>
    $(document).ready(function () {
        $("#breadcrumbs #pageTitle").html("회원가입");
        $("#breadcrumbs .join").addClass("selected");
        $("#breadcrumbs .join").attr("href", "javascript:void(0)");
    });
</script>

<!-- 회원가입 -->
<div class="container-join">
    <div class="bar-title">
        <h2 class="title">회원가입</h2>
        <%@ include file="breadcrumbs_member.jsp" %>
    </div>
        <form action="Member" method="post" onsubmit="return check();" name="board">
            <input type="hidden" name="separate" value="register">
            <div class="board-join">
                <div class="text-welcome">
                    <h3 class="title">회원가입을 해주세요!</h3>
                    <span class="info">이미 회원이세요? <a href="javascript:goSite('login')">로그인을 해주세요!</a></span>
                </div>

                <div class="form-join">
                    <span class="info">* 기본정보</span> <span class="indicator-check">사용불가</span>
                    <input type="hidden" name="chk_id">
                    <p class="box-text">
                        <i class="fas fa-user-circle"></i>
                        <input class="input" type="text" name="id" placeholder="아이디">
                        <p class="arrow-box">영문, 숫자조합만 가능합니다.</p>
                    </p>

                    <p class="box-text">
                        <i class="fas fa-lock"></i>
                        <input class="input" type="password" name="password" placeholder="비밀번호">
                        <p class="arrow-box">6자 이상이어야 합니다.</p>
                    </p>

                    <p class="box-text">
                        <i class="fas fa-lock"></i>
                        <input class="input" type="password" name="re_password" placeholder="비밀번호 확인">
                        <p class="arrow-box">일치하지 않습니다!</p>
                    </p>

                    <p class="box-text">
                        <i class="fas fa-user-circle"></i>
                        <input class="input" type="text" name="kor_name" placeholder="한글이름">
                    </p>

                    <p class="box-text">
                        <i class="fas fa-user-circle"></i>
                        <input class="input" type="text" name="eng_name" placeholder="영문이름(필수)">
                    </p>

                    <p class="box-text">
                        <i class="fas fa-phone"></i>
                        <input class="input" type="text" name="mobile" placeholder="휴대전화">
                        <p class="arrow-box">- 빼고 입력하십시오.</p>
                    </p>

                    <p class="box-text">
                        <i class="fas fa-user-circle"></i>
                        <input class="input" type="email" name="email" placeholder="이메일주소">
                        <p class="arrow-box">아이디, 비밀번호 찾기에 사용됩니다.</p>
                    </p>

                </div>

                <div class="field-submit">

                    <div class="checkbox">
                        <input type="checkbox" id="SMS_RCV_YN" name="SMS_RCV_YN" value="Y">
                        <label for="SMS_RCV_YN">
                            <span class="icon-checkbox"></span> SMS 수신동의
                        </label>
                    </div>

                    <div class="checkbox">
                        <input type="checkbox" name="EMAIL_RCV_YN" id="EMAIL_RCV_YN" value="Y">
                        <label for="EMAIL_RCV_YN">
                            <span class="icon-checkbox"></span> 이메일 수신동의
                        </label>
                    </div>

                </div>

                <div class="field-agree">
                    <div class="checkbox">
                        <input type="checkbox" name="AGREE_1" id="AGREE_1" value="Y">
                        <label for="AGREE_1">
                            <span class="icon-checkbox"></span> * 서비스 이용약관 <span class="require">(필수)</span>
                        </label>
                    </div>
                    <div class="terms">
                        <a href="#small-dialog" onclick="fnPopup('ServiceTerms')" class="popup-with-zoom-anim">
                            <%@ include file="service_terms.jsp" %>
                        </a>
                    </div>
                </div>
                <div class="field-agree">
                    <div class="checkbox">
                        <input type="checkbox" name="AGREE_2" id="AGREE_2" value="Y">
                        <label for="AGREE_2">
                            <span class="icon-checkbox"></span> * 개인정보 수집 및 이용에 대한 안내 <span class="require">(필수)</span>
                        </label>
                    </div>
                    <div class="terms">
                        <a href="#small-dialog" onclick="fnPopup('PersonalTerms')" class="popup-with-zoom-anim">
                            <%@ include file="personal_terms.jsp" %>
                        </a>
                    </div>
                </div>

                <div class="btn-wrap">
                    <button type="submit" class="btn-submit" data-animation="ripple">
                        <span class="text">가입하기</span>
                        <span class="arrow-animate"><i class="fas fa-long-arrow-alt-right"></i></span>
                    </button>
                </div>
            </div>

        </form>
    </div>

    <!-- Footer -->
    <%@ include file="../common_footer.jsp" %>

    <!-- Scripts -->
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/btn_ripple_effect.js"></script>
    <script src="js/aromanize.js"></script>
    <script>
        function check() {
            if(checkValue(board.id, "아이디를 입력하세요")) return false;
            if(onOnlyAlphaNumber(board.id.value)) {
                alert("아이디는 영문, 숫자 조합만 가능합니다.");
                return false;
            }
            if(board.id.value.length < 4) {
                alert("아이디는 4자리 이상이어야 합니다.");
                board.id.focus();
                return false;
            }
            if(board.chk_id.value != board.id.value) {
                alert("사용불가한 아이디입니다.");
                board.id.focus();
                return false;
            }
            if(checkValue(board.password, "비밀번호를 입력하세요")) return false;
            if(board.password.value.length < 6) {
                alert("비밀번호는 6자리 이상이어야 합니다.");
                board.password.focus();
                return false;
            }
            if(checkValue(board.re_password, "비밀번호를 재입력해주세요")) return false;
            if(board.password.value != board.re_password.value) {
                alert("비밀번호를 확인해주세요");
                board.re_password.focus();
                return false;
            }
            if(checkValue(board.kor_name, "한글 이름을 입력해주세요")) return false;
            if(onOnlyHan(board.kor_name.value)) {
                alert("한글만 입력해주세요");
                board.kor_name.focus();
                return false;
            }
            if(checkValue(board.eng_name, "영문 이름을 입력해주세요")) return false;
            if(onOnlyEng(board.eng_name.value)) {
                alert("영어만 입력해주세요.");
                board.eng_name.focus();
                return false;
            }
            if(checkValue(board.mobile, "휴대전화를 입력해주세요")) return false;
            if(onOnlyNum(board.mobile.value)) {
                alert("-빼고 입력해주세요");
                board.mobile.focus();
                return false;
            }
            if(board.mobile.value.length > 11) {
                alert("전화번호는 11자리 입니다.");
                board.mobile.focus();
                return false;
            }
            if(checkValue(board.email, "이메일을 입력해주세요")) return false;
            if(isEmail(board.email.value)) {
                alert("이메일을 올바르게 입력해주세요");
                board.email.focus();
                return false;
            }
            var agree1 = document.board.AGREE_1.checked;
            var agree2 = document.board.AGREE_2.checked;
            if(!agree1) {
                alert("서비스 이용약관에 동의해주세요.");
                board.AGREE_1.focus();
                return false;
            }
            if(!agree2) {
                alert("개인정보 수집 및 이용에 동의해주세요");
                board.AGREE_2.focus();
                return false;
            }

            return true;
        }

        function fnPopup(siteSrc) {
            $.ajax({
                type: "post",
                url: siteSrc,
                success: function (data) {
                    $("#small-dialog #dialog-cont").html(data);
                }
            });
        }
    </script>
    <script>
        $(document).ready(function () {
            // 포커스 되었을때 나타나라!
            $(".input").focus(function () { 
                $(this).parent(".box-text").next("p.arrow-box").css("display", "inline-block");
                $(this).parent(".box-text").css("height", "50px");
            });
            $(".input").blur(function () { 
                $(".box-text + p.arrow-box").css("display", "none");
                $(".box-text").css("height", "40px");
            });

            // 비밀번호 확인 말풍선 실시간 처리되라!
            $("input[name=re_password]").on("propertychange change keyup paste input", function () {
                if(board.password.value == board.re_password.value) {
                    $(this).parent(".box-text").next("p.arrow-box").html("일치합니다.");
                } else {
                    $(this).parent(".box-text").next("p.arrow-box").html("비밀번호를 똑같이 입력해주세요!");
                }
            });

            // 비밀번호 6자 이상인치 실시간 체크하라!
            $("input[name=password]").on("propertychange change keyup paste input", function () {
                if(board.password.value.length < 6) {
                    $(this).parent(".box-text").next("p.arrow-box").html("6자 이상이어야 합니다.");
                } else {
                    $(this).parent(".box-text").next("p.arrow-box").html("사용 가능합니다.");
                }
            });

            // 한글이름을 영문이름으로 즉각 변환하라!
            $("input[name=kor_name]").on("propertychange change keyup paste input", function () {
                $("input[name=eng_name]").val($(this).val().romanize().toUpperCase());
            });

            // 아이디 검사
            $("input[name=id]").blur(function() {
                if(board.id.value.length > 3) {
                    $.ajax({
                        type: "post",
                        async: false,
                        url: "Checkid",
                        data: "id="+$(this).val(),
                        success: function (data) {
                            if(data.trim() == "valid") {
                                if(onOnlyAlphaNumber(board.id.value)) {
                                    $(".form-join .indicator-check").css("color", "red");
                                    $(".form-join .indicator-check").html("사용불가");
                                }
                                else {
                                    board.chk_id.value = board.id.value;
                                    $(".form-join .indicator-check").css("color", "#2a41e8");
                                    $(".form-join .indicator-check").html("사용가능");
                                }
                            } 
                            else {
                                $(".form-join .indicator-check").css("color", "red");
                                $(".form-join .indicator-check").html("사용불가");
                            }
                        }
                    });
                }
                else {
                    $(".form-join .indicator-check").css("color", "red");
                    $(".form-join .indicator-check").html("사용불가");
                }
            });

            // 팝업
            $(".popup-with-zoom-anim").magnificPopup({
                type: 'inline', 

                fixedContentPos: false, 
                fixedBgPos: true, 

                overflowY: 'auto',

                closeBtnInside: true, 
                preloader: false, 

                midClick: true, 
                removalDelay: 300,
                mainClass: 'my-mfp-zoom-in'
            });
        });
    </script>
</body>
</html>