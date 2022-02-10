<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="../common_header.jsp" %>

<c:if test="${empty session_name}">
    <script>
        alert("로그인 후 이용가능합니다.");
        location.href = "Member";
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
        $("#breadcrumbs #pageTitle").html("회원정보 수정");
        $("#breadcrumbs .myinfo").addClass("selected");
        $("#breadcrumbs .myinfo").attr("href", "javascript:void(0)");
    });
</script>
<div class="container-agent">
    <div class="bar-title">
        <h2 class="title">회원정보 수정</h2>

        <%@ include file="breadcrumbs_mypage.jsp" %>
    </div>

    <div class="margin-top-50"></div>

    <!-- 마이페이지 컨테이너 -->
    <%@ include file="mypage_container.jsp" %>
    <!-- 마이페이지 컨테이너 / 끝 -->
    <!-- Row -->
    <div class="row">
        <div class="col-xl-12 col-common">
            <div class="dashboard-box margin-top-0 margin-bottom-20">
                <form action="Myinfo" name="board" method="post">
                    <input type="hidden" name="separate" value="edit">
                    <div class="content with-padding">
                        <table class="basic-table">
                            <colgroup>
                                <col width="20%">
                                <col width="30%">
                                <col width="20%">
                                <col width="30%">
                            </colgroup>
                            <tbody>
                            <tr>
                                <td class="title">아이디</td>
                                <td>${dto.getId()}</td>
                                <td class="title">사서함 번호</td>
                                <td>${dto.getLocker()}</td>
                            </tr>
                            <tr>
                                <td class="title">이름</td>
                                <td> ${dto.getKor_name()} </td>
                                <td class="title">영문이름</td>
                                <td>
                                    <input type="text" name="t_eng_name" maxlength="40" value="${dto.getEng_name()}" class="input-text with-border">
                                </td>
                            </tr>
                            <tr>
                                <td class="title">비밀번호</td>
                                <td>
                                    <a href="#small-dialog" onclick="fnPopup('PasswordChanger')" data-animation="ripple" class="popup-with-zoom-anim button ripple-effect charcoal">
                                        비밀번호 변경
                                    </a>
                                </td>
                                <td class="title">휴대폰</td>
                                <c:choose>
                                    <c:when test="${dto.getPhone() eq 'required'}">
                                        <td>
                                            <div class="submit-field">
                                                <div class="input-with-icon-left">
                                                    <i class="fas fa-phone"></i>
                                                    <input type="text" name="t_mobile" maxlength="20" class="input-text with-border" placeholder="휴대전화" title="-빼고 입력하세요.">
                                                </div>
                                            </div>
                                        </td>
                                    </c:when>
                                    <c:otherwise>
                                        <td> ${dto.getPhone()} </td>
                                    </c:otherwise>
                                </c:choose>
                            </tr>
                            <tr>
                                <td class="title">이메일</td>
                                <td>
                                    <div class="submit-field">
                                        <div class="input-with-icon-left">
                                            <i class="far fa-user-circle"></i>
                                            <input type="text" name="t_email" maxlength="120" class="input-text with-border" placeholder="이메일주소" value="${dto.getEmail()}">
                                        </div>
                                    </div>
                                </td>
                                <td class="title">마지막 로그인</td>
                                <td>${dto.getLast_login_date()}</td>
                            </tr>
                            <tr>
                                <td class="title">가입경로</td>
                                <td colspan="3"><c:if test="${dto.getSocial_login() eq 'NAVER'}">네이버</c:if><c:if test="${dto.getSocial_login() eq 'KAKAO'}">카카오</c:if></td>
                            </tr>
                            <tr>
                                <td class="title">수신 및 이용동의</td>
                                <td colspan="3">
                                    <div class="checkbox">
                                        <input type="checkbox" name="sms_rcv_yn" id="SMS_RCV_YN" value="Y" <c:if test="${dto.getSms_rcv_yn() eq 'Y'}">checked</c:if>>
                                        <label for="SMS_RCV_YN">
                                            <span class="checkbox-icon"></span>
                                            SMS 수신동의
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <input type="checkbox" name="email_rcv_yn" id="EMAIL_RCV_YN" value="Y" <c:if test="${dto.getEmail_rcv_yn() eq 'Y'}">checked</c:if>>
                                        <label for="EMAIL_RCV_YN">
                                            <span class="checkbox-icon"></span>
                                            이메일 수신동의
                                        </label>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-xl-12 col-common tc margin-top-30">
            <a href="javascript:void(0)" onclick="setTimeout(function(){goEdit()}, 150)" data-animation="ripple" class="button ripple-effect big">
                정보수정
            </a>
            <a href="javascript:void(0)" onclick="setTimeout(function(){goUnreg()}, 150)" data-animation="ripple" class="button ripple-effect dark big">
                탈퇴하기
            </a>
        </div>
    </div>
    <!-- Row / End -->
</div>

<%@ include file="../common_footer.jsp" %>

<script src="js/btn_ripple_effect.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script>
    function fnPopup(siteSrc) {
        $.ajax({
            type: "post",
            url: siteSrc,
            success: function (data) {
                $("#small-dialog #dialog-cont").html(data);
            }
        });
    }

    function fnMemPw_M() {
        if(checkValue(frmPw.PRE_MEM_PW, "기존 비밀번호를 입력하세요.")) return;
        if(checkValue(frmPw.MEM_PW, "설정하실 비밀번호를 입력하세요.")) return;
        if(frmPw.MEM_PW_RE.value != frmPw.MEM_PW.value) {
            alert("일치하지 않습니다. 비밀번호를 재확인 해주세요.");
            frmPw.MEM_PW_RE.focus();
            return;
        }
        $.ajax({
           type: "post",
           async: false,
           url: "DoPasswordChange",
           data: "PRE_MEM_PW="+frmPw.PRE_MEM_PW.value+"&MEM_PW="+frmPw.MEM_PW.value,
           success: function(data) {
               if(data.trim() == 'success') {
                   alert("비밀번호가 변경되었습니다.");
                    $.magnificPopup.close();
               }
               else if(data.trim() == 'notequal') {
                   alert("기존 비밀번호가 일치하지 않습니다.");
                   frmPw.PRE_MEM_PW.focus();
               }
               else {
                   console.log(data);
               }
           }
        });
    }

    function goEdit() {
        if(checkValue(board.t_eng_name, "영문 이름을 기입하세요")) return;
        if(checkValue(board.t_email, "이메일 주소를 기입하세요")) return;
        if(confirm("회원 정보를 위와 같이 수정합니까?")) {
            board.submit();
        }
    }

    function goUnreg() {
        if(confirm("정말로 탈퇴하시겠습니까? \n탈퇴하시면 로그인 하실 수 없습니다.")) {
            board.action = "Member";
            board.separate.value = "unreg";
            board.submit();
        }
    }
</script>
<script>
    $(document).ready(function() {
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