<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../common_header.jsp" %>

<!-- 사이트 네비게이션 이름, 주소 표시 -->
<%@ include file="common_event.jsp" %>

<div class="container-notice">
    <div class="bar-title">
        <h2 class="title">이벤트</h2>

        <%@ include file="../breadcrumbs_cscenter.jsp" %>
    </div>

    <div class="dashboard margin-bottom-20">

        <div class="search-con">
            <div class="row">
                <!-- 검색 폼! -->
                <form action="Event" method="post" name="search">
                    <div class="search">
                        <input type="text" name="s" class="search-text" placeholder="제목">
                        <button type="button" class="search-btn ripple-effect" data-animation="ripple">
                            검색 <i class="fas fa-search"></i>
                        </button>
                        <c:if test="${session_level eq 'top'}">
                            <button type="button" class="ripple-effect button blue-line" onclick="setTimeout(function() { goWrite() }, 150)" data-animation="ripple">
                                글쓰기
                            </button>
                        </c:if>
                    </div>
                </form>
            </div>
        </div>

        <div class="category-tab-area">
            <div class="category-tab">
                <div class="category-tab-link active">
                    <a href="javascript:void(0)">
                        진행중인 이벤트
                    </a>
                </div>
                <div class="category-tab-link">
                    <a href="javascript:void(0)">
                        종료된 이벤트
                    </a>
                </div>
            </div>
        </div>

        <div class="content with-padding padding-bottom-0">
            <div class="content-row">
                <div class="col-full">

                    <c:forEach items="${list}" var="list">
                        <div class="event-box">
                            <div class="content-row">
                                <!-- 사진 부분 -->
                                <div class="col-half">
                                    <a href="javascript:goView('${list.getNo()}')" class="photo-box small no-bg"
                                    style="background-image: url('file_room/event/${list.getNo()}_${list.getAttach()}');"></a>
                                </div>
                                <!-- 내용 부분 -->
                                <div class="col-half">
                                    <div class="event-content">
                                        <strong class="dashboard-status-button red">
                                            진행중
                                        </strong>
                                        <div class="num">
                                            <i class="far fa-calendar"></i>
                                            <span class="s_txt">${list.getStart_date()} ~ ${list.getEnd_date()}</span>
                                        </div>
                                        <p>
                                            <a href="javascript:goView('${list.getNo()}')">
                                                    ${list.getTitle()}
                                            </a>
                                        </p>
                                        <span id="txt">${list.getSub_title()}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>
    </div>

    <div class="paging">
        <ul>
            <c:if test="${count > 0}">
                <c:if test="${endPage > pageCount}">
                    <c:set var="endPage" value="${pageCount}"></c:set>
                </c:if>
                <li><a <c:if test="${startPage > pageBlock}">href="javascript:goPage('${startPage - pageBlock}')"  title="이전 블록"</c:if>
                       <c:if test="${startPage <= pageBlock}">href="javascript:void(0)" title="이전 블록 없음"</c:if>
                       class="ripple-effect" data-animation="ripple"><i class="fas fa-chevron-left"></i></a></li>
                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                    <c:choose>
                        <c:when test="${i == currentPage}">
                            <li><a href="javascript:void(0)" class="current-page ripple-effect" data-animation="ripple">${i}</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="javascript:goPage('${i}')" class="ripple-effect" data-animation="ripple">${i}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <li><a <c:if test="${endPage < pageCount}">href="javascript:goPage('${starPage + pageBlock}')" title="다음 블록"</c:if>
                       <c:if test="${endPage >= pageCount}">href="javascript:void(0)" title="다음 블록 없음"</c:if>
                       class="ripple-effect" data-animation="ripple"><i class="fas fa-chevron-right"></i></a></li>
            </c:if>
        </ul>
    </div>
</div>
<!-- Footer -->
<%@ include file="../common_footer.jsp" %>

<script src="js/btn_ripple_effect.js"></script>
<script>
    function goView(arg) {
        urldirect.action = "Event";
        urldirect.separate.value = "view";
        urldirect.no.value = arg;
        urldirect.submit();
    }

    function goWrite() {
        urldirect.action = "Event";
        urldirect.separate.value = "write";
        urldirect.submit();
    }

    function goPage(arg) {
        search.action = "Event?pageNum="+arg;
        search.submit();
    }
</script>

</body>
</html>