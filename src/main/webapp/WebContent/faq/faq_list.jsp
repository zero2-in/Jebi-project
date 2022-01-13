<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../common_header.jsp" %>

    <!-- 사이트 네비게이션 이름, 주소 표시 -->
    <%@ include file="common_faq.jsp" %>

    <div class="container-notice">
        <div class="bar-title">
            <h2 class="title">자주하는질문</h2>

            <%@ include file="../breadcrumbs_cscenter.jsp" %>
        </div>

        <div class="dashboard">
            <div class="search-con">
                <div class="row">
                    <!-- 검색 폼! -->
                    <form action="Faq" method="post" name="search">
                        <input type="hidden" name="category">
                        <div class="search">
                            <input type="text" name="s" class="search-text" placeholder="제목" value="${s}">
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
                    <div class="category-tab-link <c:if test="${empty category}">active</c:if>">
                        <a href="javascript:void(0)" onclick="findCategory('')">
                            전체
                        </a>
                    </div>
                    <c:forEach items="${category_list}" var="list" begin="0" end="${category_list.size()}">
                        <div class="category-tab-link <c:if test="${category eq list[0]}">active</c:if>">
                            <a href="javascript:void(0)" onclick="findCategory('${list[0]}')">
                                ${list[1]}
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="content">
                <ul class="board">

                    <c:if test="${empty list}">
                        <!-- List Block -->
                        <li class="row">
                            <div class="board-listing">
                                <!-- Title -->
                                <h3 class="board-title">
                                    데이터가 없습니다.
                                </h3>
                            </div>
                        </li>
                    </c:if>

                    <c:forEach items="${list}" var="list">
                        <!-- List Block -->
                        <li class="row">
                            <div class="board-listing">
                                <!-- No -->
                                <div class="list-no">
                                    <fmt:formatNumber type="number" value="${list.getNo()}" />
                                </div>
                                <!-- Title -->
                                <h3 class="board-title">
                                    <a href="javascript:goView('${list.getNo()}')">${list.getTitle()}</a>
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
    <!-- Footer -->
    <%@ include file="../common_footer.jsp" %>
    <!-- Menu footer End -->

    <script src="js/btn_ripple_effect.js"></script>
    <script>
        function goView(arg) {
            urldirect.action = "Faq";
            urldirect.separate.value = "view";
            urldirect.no.value = arg;
            urldirect.submit();
        }

        function goWrite() {
            urldirect.action = "Faq";
            urldirect.separate.value = "write";
            urldirect.submit();
        }

        function goPage(arg) {
            search.action = "Faq?pageNum="+arg;
            search.submit();
        }

        function findCategory(arg) {
            search.category.value = arg;
            search.submit();
        }
    </script>

    </body>
</html>

