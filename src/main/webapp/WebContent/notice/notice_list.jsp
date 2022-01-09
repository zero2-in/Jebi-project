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
                    <form action="notice_list.html" method="post" name="search">
                        <div class="search">
                            <input type="text" name="s" class="search-text" placeholder="제목">
                            <button type="button" class="search-btn ripple-effect" data-animation="ripple">
                                검색 <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </form>

                </div>
            </div>

            <div class="content">
                <ul class="board">

                    <c:forEach items="${list}" var="list">
                        <!-- List Block -->
                        <li class="row">
                            <div class="board-listing">
                                <!-- No -->
                                <div class="list-no">
                                    <c:if test="${list.getImportant() ne 'N'}">
                                        <strong class="important">공지</strong>
                                    </c:if>
                                    <c:if test="${list.getImportant() eq 'N'}">
                                        ${list.getNo()}
                                    </c:if>
                                </div>
                                <!-- Title -->
                                <h3 class="board-title">
                                    <a href="javascript:goView('${list.getNo()}')">
                                        <c:choose>
                                            <c:when test="${list.getImportant() eq 'Y'}">
                                                <b class="important">${list.getTitle()}</b>
                                            </c:when>
                                            <c:when test="${list.getImportant() eq 'X'}">
                                                <b style="color: #78148c">${list.getTitle()}</b>
                                            </c:when>
                                            <c:otherwise>
                                                ${list.getTitle()}
                                            </c:otherwise>
                                        </c:choose>
                                    </a>
                                    <span class="status-button">new</span>
                                </h3>
                                <!-- Writter, Reg Date, Hit -->
                                <div class="board-footer">
                                    <ul class="fl">
                                        <li><i class="far fa-edit"></i> ${list.getReg_name()}</li>
                                        <li><i class="far fa-calendar"></i> ${list.getReg_date()}</li>
                                        <c:if test="${list.getImportant() ne 'N'}">
                                            <li><i class="far fa-eye"></i> ${list.getHit()}</li>
                                        </c:if>
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
                <li><a href="javascript:void(0)" class="ripple-effect" data-animation="ripple"><i class="fas fa-chevron-left"></i></a></li>
                <li><a href="javascript:void(0)" class="current-page ripple-effect" data-animation="ripple">1</a></li>
                <li><a href="javascript:void(0)" class="ripple-effect" data-animation="ripple">2</a></li>
                <li><a href="javascript:void(0)" class="ripple-effect" data-animation="ripple">3</a></li>
                <li><a href="javascript:void(0)" class="ripple-effect" data-animation="ripple">4</a></li>
                <li><a href="javascript:void(0)" class="ripple-effect" data-animation="ripple">5</a></li>
                <li><a href="javascript:void(0)" class="ripple-effect" data-animation="ripple"><i class="fas fa-chevron-right"></i></a></li>
            </ul>
        </div>
    </div>

    <%@ include file="../common_footer.jsp" %>

    <script src="js/btn_ripple_effect.js"></script>
    <script>
        function goView(arg) {
            urldirect.separate.value = "noticeview";
            urldirect.no.value = arg;
            urldirect.submit();
        }
    </script>
</body>
</html>