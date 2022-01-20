<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../common_header.jsp" %>

<!-- 사이트 네비게이션 이름, 주소 표시 -->
<%@ include file="common_review.jsp" %>

<div class="container-notice">
    <div class="bar-title">
        <h2 class="title">이용후기</h2>

        <%@ include file="../breadcrumbs_cscenter.jsp" %>
    </div>

    <div class="dashboard margin-bottom-20">

        <div class="search-con">
            <div class="row">
                <!-- 검색 폼! -->
                <form action="Review" method="post" name="search">

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

        <div class="content with-padding padding-bottom-0">
            <div class="content-row">
                <!-- 리뷰박스는 여기부터! -->
                <c:forEach items="${list}" var="list">
                <div class="review-content">
                    <a href="javascript:goView('${list.getNo()}')" style="background-image: url('file_room/review/${list.getNo()}_${list.getAttach()}');" class="photo-box small">
                        <div class="photo-box-content">
                            <h3>${list.getTitle()}</h3>
                            <p>${list.getKor_name()} / ${list.getReg_date()}</p>
                            <span class="num">${list.getHit()}</span>
                        </div>
                    </a>
                </div>
                </c:forEach>
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
    function goWrite() {
        urldirect.action = "Review";
        urldirect.separate.value = "write";
        urldirect.submit();
    }
    function goView(arg) {
        urldirect.action = "Review";
        urldirect.separate.value = "view";
        urldirect.no.value = arg;
        urldirect.submit();
    }
    function goPage(arg) {
        search.action = "Review?pageNum="+arg;
        search.submit();
    }
</script>

</body>
</html>