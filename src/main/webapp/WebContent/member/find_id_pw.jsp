<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ include file="../common_header.jsp" %>

<c:if test="${not empty session_name}">
    <script>
        alert("이미 로그인 하셨습니다!");
        location.href="OrderStatus";
    </script>
</c:if>

<script>
    $(document).ready(function () {
       $("#breadcrumbs #pageTitle").html("아이디/비번찾기");
       $("#breadcrumbs .findidpw").addClass("selected");
       $("#breadcrumbs .findidpw").attr("href", "javascript:void(0)");
   });
</script>

<div class="container-agent">
    <div class="bar-title">
        <h2 class="title">아이디/비번찾기</h2>

        <%@ include file="breadcrumbs_member.jsp" %>
    </div>

    <div class="margin-top-50"></div>

    <div class="row">
        <div class="col-xl-5 col-common offset-xl-3">
            <!-- Tabs Container -->
            <div class="tabs">
                <div class="tabs-header menuTab">
                    <ul>
                        <li class="active">
                            <a href="#tab-1" data-tab-id="1">아이디 찾기</a>
                        </li>
                        <li class="">
                            <a href="#tab-2" data-tab-id="2">비밀번호 재발급</a>
                        </li>
                    </ul>
                    <div class="tab-hover"></div>
                    <nav class="tabs-nav">
                        <span class="tab-prev"><i class="fas fa-chevron-left"></i></span>
                        <span class="tab-next"><i class="fas fa-chevron-right"></i></span>
                    </nav>
                </div>
                <!-- Tab Content -->
                <div class="tabs-content" style="height: 180px;">
                    <form method="post" name="frmMemIdReg" id="frmMemIdReg">
                        <div class="tab active" data-tab-id="1">
                            <!-- 아이디찾기 -->
                            <div class="submit-field">
                                <div class="input-with-icon-left">
                                    <i class="far fa-user-circle"></i>
                                    <input type="text" name="MEM_NM" id="MEM_NM" maxlength="40" placeholder="성명" required class="input-text with-border">
                                </div>
                            </div>
                            <div class="submit-field">
                                <div class="input-with-icon-left">
                                    <i class="fas fa-phone"></i>
                                    <input type="text" name="MOB_NO" id="MOB_NO" maxlength="20" placeholder="전화번호" required class="input-text with-border">
                                </div>
                            </div>
                            <div class="margin-top-20" id="dvRstMemId"></div>
                            <!-- Button -->
                            <button class="button full-width button-sliding-icon ripple-effect margin-top-10" type="button" data-animation="ripple" onclick="setTimeout(function(){fnFindAccIdChk()}, 150)">
                                아이디 찾기 <i class="fas fa-arrow-right"></i>
                            </button>
                        </div>
                    </form>
                    <form method="post" name="frmMemPwReg" id="frmMemPwReg">
                        <div class="tab" data-tab-id="2">
                            <!-- 비밀번호찾기 -->
                            <div class="submit-field">
                                <div class="input-with-icon-left">
                                    <i class="far fa-user-circle"></i>
                                    <input type="text" name="MEM_ID" id="MEM_ID" maxlength="100" placeholder="아이디" required class="input-text with-border">
                                </div>
                            </div>
                            <div class="submit-field">
                                <div class="input-with-icon-left">
                                    <i class="far fa-user-circle"></i>
                                    <input type="text" name="MEM_NM" id="MEM_NM" maxlength="40" placeholder="성명" required class="input-text with-border">
                                </div>
                            </div>
                            <div class="submit-field">
                                <div class="input-with-icon-left">
                                    <i class="fas fa-phone"></i>
                                    <input type="text" name="MOB_NO" id="MOB_NO" maxlength="20" placeholder="전화번호" required class="input-text with-border">
                                </div>
                            </div>
                            <div class="margin-top-20" id="dvRstMemPw"></div>
                            <!-- Button -->
                            <button class="button full-width button-sliding-icon ripple-effect margin-top-10" data-animation="ripple" type="button" onclick="setTimeout(function(){fnFindAccPwChk()}, 150);">
                                비밀번호 재발급 <i class="fas fa-arrow-right"></i>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../common_footer.jsp" %>
<script src="js/btn_ripple_effect.js"></script>
<script>
    $(document).ready(function () {
        $(".menuTab .tab-hover").css({"left":"0px", "width":$(".menuTab ul li.active").width()+1});

        $(".menuTab ul li a").click(function () { 
            var activeTab = $(this).data('tab-id');
            $(".tabs-content .tab").removeClass("active");
            $(".tabs-content .tab").hide();
            $(".tabs-content .tab[data-tab-id='"+activeTab+"']").fadeIn();
            $(".tabs-content .tab[data-tab-id='"+activeTab+"']").addClass("active");
            $(".menuTab ul li").removeClass("active");
            $(this).parent("li").addClass("active");

            if(activeTab == 1) {
                $(".menuTab .tab-hover").css({"left":"0px", "width":$(".menuTab ul li.active").width()+1});
                setTimeout(function(){$(".tabs-content").css("height", "180px");}, 300);
            } else {
                $(".menuTab .tab-hover").css({"left":$(".menuTab ul li.active").width(), "width":$(".menuTab ul li.active").width()+1})
                setTimeout(function(){$(".tabs-content").css("height", "230px");}, 300);
            }
        });

        $(".menuTab .tab-prev i").click(function () { 
            var currentTab = $(".menuTab ul").find("li.active").children("a").data('tab-id');
            if(currentTab == 1) {
                $(".tabs-content .tab").removeClass("active");
                $(".tabs-content .tab").hide();
                $(".tabs-content .tab[data-tab-id=2]").fadeIn();
                $(".tabs-content .tab[data-tab-id=2]").addClass("active");
                $(".menuTab ul li").removeClass("active");
                $(".menuTab ul li a[data-tab-id=2]").parent("li").addClass("active");

                $(".menuTab .tab-hover").css({"left":$(".menuTab ul li.active").width(), "width":$(".menuTab ul li.active").width()+1})
                setTimeout(function(){$(".tabs-content").css("height", "230px");}, 300);
            } else {
                $(".tabs-content .tab").removeClass("active");
                $(".tabs-content .tab").hide();
                $(".tabs-content .tab[data-tab-id=1]").fadeIn();
                $(".tabs-content .tab[data-tab-id=1]").addClass("active");
                $(".menuTab ul li").removeClass("active");
                $(".menuTab ul li a[data-tab-id=1]").parent("li").addClass("active");

                $(".menuTab .tab-hover").css({"left":"0px", "width":$(".menuTab ul li.active").width()+1});
                setTimeout(function(){$(".tabs-content").css("height", "180px");}, 300);
            }
        });
        $(".menuTab .tab-next i").click(function () { 
            var currentTab = $(".menuTab ul").find("li.active").children("a").data('tab-id');
            if(currentTab == 2) {
                $(".tabs-content .tab").removeClass("active");
                $(".tabs-content .tab").hide();
                $(".tabs-content .tab[data-tab-id=1]").fadeIn();
                $(".tabs-content .tab[data-tab-id=1]").addClass("active");
                $(".menuTab ul li").removeClass("active");
                $(".menuTab ul li a[data-tab-id=1]").parent("li").addClass("active");

                $(".menuTab .tab-hover").css({"left":"0px", "width":$(".menuTab ul li.active").width()+1});
                setTimeout(function(){$(".tabs-content").css("height", "180px");}, 300);
            } else {
                $(".tabs-content .tab").removeClass("active");
                $(".tabs-content .tab").hide();
                $(".tabs-content .tab[data-tab-id=2]").fadeIn();
                $(".tabs-content .tab[data-tab-id=2]").addClass("active");
                $(".menuTab ul li").removeClass("active");
                $(".menuTab ul li a[data-tab-id=2]").parent("li").addClass("active");

                $(".menuTab .tab-hover").css({"left":$(".menuTab ul li.active").width(), "width":$(".menuTab ul li.active").width()+1})
                setTimeout(function(){$(".tabs-content").css("height", "230px");}, 300);
            }
        });
    });
</script>
<script>
    // 아이디 찾기
    function fnFindAccIdChk() {
        if(checkValue(frmMemIdReg.MEM_NM, "성명을 입력해주세요.")) return;
        if(checkValue(frmMemIdReg.MOB_NO, "전화번호를 입력해주세요.")) return;
        if(onOnlyNum(frmMemIdReg.MOB_NO.value)) {
            alert("-빼고 입력해주세요.");
            frmMemIdReg.MOB_NO.focus();
            return;
        }
        
        $.ajax({
            type: "post",
            async: false,
            url: "MemberFindId",
            data: "kor_name="+frmMemIdReg.MEM_NM.value+"&mobile="+frmMemIdReg.MOB_NO.value,
            success: function (data) {
                if(data.trim() == 'success') {
                    alert("가입하신 이메일로 아이디가 발송되었습니다.");
                    location.reload();
                } else {
                    alert("가입되지 않은 정보입니다.");
                }
            },
            error: function(e) {
                alert(e.responseText);
            }
        });
    }

    // 비밀번호 찾기
    function fnFindAccPwChk() {
        if(checkValue(frmMemPwReg.MEM_ID, "아이디를 입력해주세요.")) return;
        if(checkValue(frmMemPwReg.MEM_NM, "성명을 입력해주세요.")) return;
        if(checkValue(frmMemPwReg.MOB_NO, "전화번호를 입력해주세요")) return;
        if(onOnlyNum(frmMemIdReg.MOB_NO.value)) {
            alert("-빼고 입력해주세요.");
            frmMemIdReg.MOB_NO.focus();
            return;
        }
        frmMemPwReg.submit();
    }
</script>
</body>
</html>