<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="../common_header.jsp" %>

<c:if test="${empty session_name}">
    <script>
        alert("로그인 후 이용가능합니다.");
        location.href = "Member";
    </script>
</c:if>

<script>
    $(document).ready(function () {
        $("#breadcrumbs #pageTitle").html("받은 쪽지함");
        $("#breadcrumbs .mailbox").addClass("selected");
        $("#breadcrumbs .mailbox").attr("href", "javascript:void(0)");
    });
</script>

<div id="small-dialog" class="zoom-anim-dialog dialog-with-tabs mfp-hide">
    <div class="sign-in-form" id="dialog-cont">

    </div>
</div>

<div class="container-agent">
    <div class="bar-title">
        <h2 class="title">받은 쪽지함</h2>

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
                <!-- search-con -->
                <form action="" name="frmSearch" method="post">
                    <div class="search-con">
                        <div class="search-con-inner2">
                            <div class="submit-field">
                                <div class="input-with-icon-left">
                                    <i class="far fa-calendar"></i>
                                    <input type="date" name="" required aria-required="true" class="input-text with-border" data-placeholder="시작일">
                                </div>
                            </div>
                            <div class="submit-field">
                                <div class="input-with-icon-left">
                                    <i class="far fa-calendar"></i>
                                    <input type="date" name="" required aria-required="true" class="input-text with-border" data-placeholder="종료일">
                                </div>
                            </div>
                            <div class="submit-field">
                                <select name="" class="btn-group bootstrap-select with-border">
                                    <option value=""> = 읽음여부</option>
                                    <option value="N">읽지않음</option>
                                    <option value="Y">읽음</option>
                                </select>
                            </div>
                            <div class="search-btn2">
                                <a href="javascript:void(0)" data-animation="ripple" class="button ripple-effect">
                                    검색 <i class="fas fa-search"></i>
                                </a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </form>
                <!-- search-con / End -->
                <div class="content">
                    <ul class="dashboard-box-list">
                        <c:if test="${empty list}">
                            <li class="ntc-height">
                                <div class="board-listing">
                                    <div class="board-listing-details">
                                        <div class="board-listing-description">
                                            <div class="checkbox"></div>
                                            <h3 class="board-listing-title">
                                                받은 알림이 없습니다.
                                            </h3>
                                            <div class="board-listing-footer"></div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </c:if>

                        <c:if test="${not empty list}">
                            <c:set var="i" value="1" />
                            <c:forEach items="${list}" var="list">
                                <c:set var="i" value="${i+1}" />
                                <li class="ntc-height">
                                    <!-- board-listing -->
                                    <div class="board-listing">
                                        <!-- board-listing-details -->
                                        <div class="board-listing-details">
                                            <!-- Details -->
                                            <div class="board-listing-description">
                                                <div class="checkbox">
                                                    <input type="checkbox" name="ckNOTE_SEQ" id="chk${i}" value="${list.getNo()}">
                                                    <label for="chk${i}">
                                                        <span class="checkbox-icon"></span>
                                                    </label>
                                                </div>
                                                <h3 class="board-listing-title">
                                                    <a href="#small-dialog" onclick="fnPopup('Mailbox?separate=content&mailNo=${list.getNo()}')" class="popup-with-zoom-anim">
                                                        ${list.getTitle()}
                                                    </a>
                                                </h3>
                                                <!-- board-listing-footer -->
                                                <div class="board-listing-footer fr">
                                                    <ul class="fl">
                                                        <li>
                                                            <i class="far fa-edit"></i>
                                                            <span class="num s_txt">${list.getReg_name()}</span>
                                                        </li>
                                                        <li>
                                                            <i class="far fa-calendar"></i>
                                                            <span class="num s_txt">${list.getReg_date()}</span>
                                                        </li>
                                                        <c:if test="${not empty list.getRead_date()}">
                                                            <li class="date">
                                                                <i class="far fa-eye"></i>
                                                                <span class="num s_txt">${list.getRead_date()}</span>
                                                            </li>
                                                        </c:if>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Task Details -->
                                </li>
                            </c:forEach>
                        </c:if>

                    </ul>
                </div>
            </div>
            <a href="javascript:void(0)" onclick="setTimeout(function(){fnDel_M()}, 150)" data-animation="ripple" class="button red ripple-effect ico">
                <i class="far fa-trash-alt"></i>
            </a>
        </div>
    </div>
    <!-- Row / End -->
    <!-- Pagination -->
    <div class="row">
        <div class="col-xl-12 col-common">
            <div class="pagination-container margin-top-10 margin-bottom-20">
                <nav class="pagination">
                    <ul>
                        <c:if test="${count > 0}">
                            <c:if test="${endPage > pageCount}">
                                <c:set var="endPage" value="${pageCount}"></c:set>
                            </c:if>
                            <li class="pagination-arrow">
                                <a href="javascript:void(0)" data-animation="ripple"
                                   <c:if test="${startPage > pageBlock}">href="javascript:goPage('${startPage - pageBlock}')" title="이전 10페이지"</c:if>
                                   <c:if test="${startPage <= pageBlock}">href="javascript:void(0)" title="이전 10페이지 없음"</c:if> class="ripple-effect">
                                    <i class="fas fa-chevron-left"></i>
                                </a>
                            </li>
                            <c:forEach var="i" begin="${startPage}" end="${endPage}">
                                <c:choose>
                                    <c:when test="${i == currentPage}">
                                        <li><a href="javascript:void(0)" data-animation="ripple" class="current-page ripple-effect">${i}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a href="javascript:goPage('${i}')" class="ripple-effect" data-animation="ripple">${i}</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <li class="pagination-arrow">
                                <a href="javascript:void(0)" <c:if test="${endPage < pageCount}">href="javascript:goPage('${starPage + pageBlock}')" title="다음 10페이지"</c:if>
                                   <c:if test="${endPage >= pageCount}">href="javascript:void(0)" title="다음 없음"</c:if>
                                   data-animation="ripple" class="ripple-effect">
                                    <i class="fas fa-chevron-right"></i>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    <!-- Pagination / End -->
</div>

<%@ include file="../common_footer.jsp" %>
<link rel="stylesheet" href="css/magnific-popup.css">
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/btn_ripple_effect.js"></script>
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

    function goPage(arg) {
        search.action = "Mailbox?pageNum="+arg;
        search.submit();
    }

    // 쪽지 삭제
    function fnDel_M() {
        var oNoteSeq = $("input[name='ckNOTE_SEQ']");

        if ( fnCkBoxVal(oNoteSeq) == '' )	{
            alert('삭제할 쪽지를 선택하십시오.');
            return;
        }

        if ( confirm('선택 쪽지 건을 삭제하시겠습니까?') ) {
            $.ajax({
                url: "MailboxDelete",
                method: "GET",
                data: {MAIL_NO: fnCkBoxVal(oNoteSeq)},
                contentType: "application/json",
                success: function() {
                    location.reload();
                },
                error: function(e) {
                    alert(e.responseText);
                }
            });
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