<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%@ include file="../common_header.jsp" %>

<c:if test="${empty session_name}">
    <script>
        alert("로그인 후 이용가능합니다.");
        location.href = "Member";
    </script>
</c:if>

<!-- nav Script -->
<script>
    $(document).ready(function () {
        $(".menu-main #purchaseAgent").addClass("active");
        $("#breadcrumbs .dropbtn").click(function () {
            $("#breadcrumbs .dropdown-content").toggle(200);
            $("#breadcrumbs .select-area .caret").toggleClass("active");
        });
    });
</script>

<div class="container-agent">
    <div class="bar-title">
        <h2 class="title">구매대행 신청</h2>

        <!-- 사이트 이동경로를 만들어라! -->
        <nav id="breadcrumbs" class="dark">
            <ul class="nav-list">
                <li><a href="/jebi">Home</a></li>
                <li>구매대행</li>
                <li class="select-area">
                    <button class="dropbtn">구매대행 신청 <span class="bs-caret"><span class="caret"></span></span></button>
                    <div class="dropdown-content">
                        <a href="javascript:void(0)">구매대행 신청<span class="check"><i class="fas fa-check"></i></span></a>
                    </div>
                </li>
                <div class="clearfix"></div>
            </ul>
        </nav>
    </div>

    <div class="margin-top-50"></div>
    <form action="PurchaseAgent" method="post" name="board">
        <input type="hidden" name="separate" value="write">
        <div class="row">
            <!-- Dashboard Box 서비스 신청 유의사항 -->
            <div class="col-xl-12 col-common">
                <div class="dashboard-box height-fixed_02 margin-top-0 margin-bottom-20">
                    <!-- 헤드라인 -->
                    <div class="headline">
                        <h3>
                            <i class="fas fa-angle-double-right"></i>
                            서비스 신청 유의사항
                        </h3>
                    </div>
                    <div class="content">
                        <ul class="dashboard-box-list">
                            <li>
                                <div class="with-border agree_02">
                                    <ul>
                                        <!-- 약관 내용 -->
                                        <%@ include file="purchase_terms.jsp" %>
                                        <!-- 약관 내용 끝 -->
                                    </ul>
                                </div>
                                <div class="checkbox">
                                    <input type="checkbox" name="t_agree" id="ServerAgree" value="y">
                                    <label for="ServerAgree">
                                        <span class="checkbox-icon"></span>
                                        주의사항을 모두 숙지하였으며, 위 약관에 동의합니다.
                                        <span class="s_txt fc_red">(필수)</span>
                                    </label>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Dashboard Box 물류센터와 배송방식을 선택 -->
            <div class="col-xl-12 col-common">
                <div class="dashboard-box margin-top-0 margin-bottom-20">
                    <!-- 헤드라인 -->
                    <div class="headline">
                        <h3>
                            <i class="fas fa-angle-double-right"></i>
                            물류센터 및 운송방식
                        </h3>
                    </div>
                    <div class="content">
                        <ul class="dashboard-box-list">
                            <li>
                                <div class="submit-field margin-bottom-0">
                                    <h5>물류센터 선택</h5>
                                    <div class="radio-area">
                                        <div class="radio">
                                            <input type="radio" name="t_center" id="LOGI_CENTER" value="CN" checked>
                                            <label for="LOGI_CENTER">
                                                <span class="radio-label"></span>
                                                위해
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </li>

                            <li>
                                <div class="submit-field margin-bottom-0">
                                    <h5>운송방식 선택</h5>
                                    <div class="radio-area">
                                        <div class="radio">
                                            <input type="radio" name="dlvr_way" id="DLVR_AIR" value="1">
                                            <label for="DLVR_AIR">
                                                <span class="radio-label"></span>
                                                항공
                                            </label>
                                        </div>
                                        <div class="radio">
                                            <input type="radio" name="dlvr_way" id="DLVR_SHIP" value="2">
                                            <label for="DLVR_SHIP">
                                                <span class="radio-label"></span>
                                                해운
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>

        </div>
        <!-- Row End -->
        <!-- Row -->
        <div class="row">
            <div class="col-xl-12 col-common tc margin-top-30">
                <a href="javascript:void(0)" onclick="setTimeout(function(){goNext()}, 150)" class="button ripple-effect dark big"
                   data-animation="ripple">
                    다음 진행
                </a>
            </div>
        </div>
    </form>
</div>

<%@ include file="../common_footer.jsp" %>

<script src="js/btn_ripple_effect.js"></script>
<script>
    function goNext() {
        var agree = document.board.t_agree.checked;
        if(!agree) {
            alert("서비스 신청 유의사항 약관에 동의하셔야 합니다.")
            return;
        }
        if(checkValue(board.dlvr_way, "운송방식을 선택하십시오.")) return;
        board.submit();
    }
</script>
</body>
</html>