<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="../common_header.jsp" %>

<c:if test="${empty session_name}">
    <script>
        alert("로그인 후 이용이 가능합니다.");
        location.href="Member";
    </script>
</c:if>

    <%@ include file="common_qna.jsp" %>

    <div class="container-notice">
        <div class="bar-title">
            <h2 class="title">1:1문의</h2>

            <!-- 사이트 이동경로를 만들어라! -->
            <%@ include file="../breadcrumbs_cscenter.jsp" %>
        </div>

        <div class="dashboard">
            <div class="search-con">
                <div class="row">
                    <!-- 검색 폼! -->
                    <form action="Qna" method="post" name="search">
                        <div class="search">
                            <input type="text" name="s" class="search-text" placeholder="제목">
                            <button type="button" class="search-btn ripple-effect" data-animation="ripple">
                                검색 <i class="fas fa-search"></i>
                            </button>
                            <button type="button" class="ripple-effect button blue-line" onclick="setTimeout(function() { location.href='qna_write.jsp'}, 150)" data-animation="ripple">
                                글쓰기
                            </button>
                            <c:if test="${session_level eq 'top'}">
                                <button type="button" class="ripple-effect button blue-line" onclick="setTimeout(function() { location.href='qna_write.html'}, 150)" data-animation="ripple">
                                    공지등록
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
                            전체
                        </a>
                    </div>
                    <div class="category-tab-link">
                        <a href="javascript:void(0)">
                            입출고
                        </a>
                    </div>
                    <div class="category-tab-link">
                        <a href="javascript:void(0)">
                            결제
                        </a>
                    </div>
                    <div class="category-tab-link">
                        <a href="javascript:void(0)">
                            구매대행
                        </a>
                    </div>
                    <div class="category-tab-link">
                        <a href="javascript:void(0)">
                            반품,교환
                        </a>
                    </div>
                    <div class="category-tab-link">
                        <a href="javascript:void(0)">
                            통관
                        </a>
                    </div>
                    <div class="category-tab-link">
                        <a href="javascript:void(0)">
                            누락
                        </a>
                    </div>
                    <div class="category-tab-link">
                        <a href="javascript:void(0)">
                            노데이터
                        </a>
                    </div>
                    <div class="category-tab-link">
                        <a href="javascript:void(0)">
                            기타
                        </a>
                    </div>
                </div>
            </div>

            <div class="content">
                <ul class="board">
                    <!-- List Block -->
                    <li class="row">
                        <div class="board-listing">
                            <!-- No -->
                            <div class="list-no">
                                <strong class="important">공지</strong>
                            </div>
                            <!-- Title -->
                            <h3 class="board-title">
                                <a href="qna_view.jsp"><span class="gray">[기타]</span> <b class="important">★문의글 등록 전 꼭 확인해주세요★</b></a>
                                <span class="status-button">new</span>
                            </h3>
                            <!-- Writter, Reg Date, Hit -->
                            <div class="board-footer">
                                <ul class="fl">
                                    <li><i class="far fa-edit"></i> 관리자</li>
                                    <li><i class="far fa-calendar"></i> 2021-12-28 16:53</li>
                                    <li><i class="far fa-eye"></i> 1,516</li>
                                </ul>
                            </div>
                        </div>
                    </li>

                    <li class="row">
                        <div class="board-listing">
                            <!-- No -->
                            <div class="list-no">
                                <strong class="important">공지</strong>
                            </div>
                            <!-- Title -->
                            <h3 class="board-title">
                                <a href="qna_view.jsp"><span class="gray">[기타]</span> <b style="color: #78148c">문의사항은 작성자만 볼 수 있습니다.</b></a>
                                <span class="status-button">new</span>
                            </h3>
                            <!-- Writter, Reg Date, Hit -->
                            <div class="board-footer">
                                <ul class="fl">
                                    <li><i class="far fa-edit"></i> 관리자</li>
                                    <li><i class="far fa-calendar"></i> 2021-12-28 10:39</li>
                                    <li><i class="far fa-eye"></i> 7,071</li>
                                </ul>
                            </div>
                        </div>
                    </li>

                    <li class="row">
                        <div class="board-listing">
                            <h3 class="board-title">
                                데이터가 없습니다.
                            </h3>
                        </div>
                    </li>

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

    <script src="../js/btn_ripple_effect.js"></script>
</body>
</html>