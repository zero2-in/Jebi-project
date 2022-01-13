<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>
<%@ include file="../common_header.jsp" %>
    
    <!-- 사이트 네비게이션 이름, 주소 표시 -->
    <%@ include file="common_notice.jsp" %>

    <div class="container-notice">
        <div class="bar-title">
            <h2 class="title">공지사항</h2>

            <%@ include file="../breadcrumbs_cscenter.jsp" %>
        </div>

        <div class="dashboard">
            <div class="search-con">
                <div class="row">
                    <!-- 검색 폼! -->
                    <form action="Notice" method="post" name="search">
                        <div class="search">
                            <input type="text" name="s" class="search-text" placeholder="제목" value="${s}">
                            <button type="submit" class="search-btn ripple-effect" data-animation="ripple">
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

            <div class="content">
                <ul class="board">
                    <c:forEach items="${important_list}" var="list">
                        <!-- List Block -->
                        <li class="row">
                            <div class="board-listing">
                                <!-- No -->
                                <div class="list-no">
                                    <strong class="important">공지</strong>
                                </div>
                                <!-- Title -->
                                <h3 class="board-title">
                                    <a href="javascript:goView('${list.getNo()}')">
                                        <c:if test="${list.getImportant() eq 'Y'}">
                                            <b class="important">${list.getTitle()}</b>
                                        </c:if>
                                        <c:if test="${list.getImportant() eq 'X'}">
                                            <b style="color: #78148c">${list.getTitle()}</b>
                                        </c:if>
                                    </a>
                                    <span class="status-button">new</span>
                                </h3>
                                <!-- Writter, Reg Date, Hit -->
                                <div class="board-footer">
                                    <ul class="fl">
                                        <li><i class="far fa-edit"></i> ${list.getReg_name()}</li>
                                        <li><i class="far fa-calendar"></i> ${list.getReg_date()}</li>
                                        <li><i class="far fa-eye"></i> <fmt:formatNumber value="${list.getHit()}" type="number" /></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </c:forEach>

                    <c:if test="${empty list}">
                        <li class="row">
                            <div class="board-listing">
                                <div class="board-title">
                                    데이터가 없습니다.
                                </div>
                            </div>
                        </li>
                    </c:if>

                    <c:forEach items="${list}" var="list">
                        <!-- List Block -->
                        <li class="row">
                            <div class="board-listing">
                                <!-- No -->
                                <div class="list-no">
                                    <fmt:formatNumber value="${list.getNo()}" type="number" />
                                </div>
                                <!-- Title -->
                                <h3 class="board-title">
                                    <a href="javascript:goView('${list.getNo()}')">
                                        ${list.getTitle()}
                                    </a>
                                    <span class="status-button">new</span>
                                </h3>
                                <!-- Writter, Reg Date, Hit -->
                                <div class="board-footer">
                                    <ul class="fl">
                                        <li><i class="far fa-edit"></i> ${list.getReg_name()}</li>
                                        <li><i class="far fa-calendar"></i> ${list.getReg_date()}</li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </c:forEach>

                </ul>
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

    <%@ include file="../common_footer.jsp" %>

    <script src="js/btn_ripple_effect.js"></script>
    <script>
        function goView(arg) {
            urldirect.action = "Notice";
            urldirect.separate.value = "view";
            urldirect.no.value = arg;
            urldirect.submit();
        }

        function goWrite() {
            urldirect.action = "Notice";
            urldirect.separate.value = "write";
            urldirect.submit();
        }

        function goPage(arg) {
            search.action = "Notice?pageNum="+arg;
            search.submit();
        }
    </script>
</body>
</html>