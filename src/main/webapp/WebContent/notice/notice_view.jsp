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
        
        <div class="dashboard margin-bottom-40">
            <div class="blog-post-content">
                <!-- 제목 입력! -->
                <h3 class="margin-bottom-10">
                    <c:choose>
                        <c:when test="${dto.getImportant() eq 'Y'}">
                            <b style="color: red">${dto.getTitle()}</b>
                        </c:when>
                        <c:when test="${dto.getImportant() eq 'X'}">
                            <b style="color: #78148c">${dto.getTitle()}</b>
                        </c:when>
                        <c:otherwise>
                            ${dto.getTitle()}
                        </c:otherwise>
                    </c:choose>
                </h3>
                <!-- 입력자 정보! -->
                <div class="blog-post-info-list margin-bottom-20">
                    <span class="blog-post-info">
                        <i class="far fa-edit"></i> ${dto.getReg_name()}
                    </span>
                    <span class="blog-post-info">
                        <i class="far fa-calendar"></i> ${dto.getReg_date()}
                    </span>
                    <span class="blog-post-info">
                        <i class="far fa-eye"></i> ${dto.getHit()}
                    </span>
                </div>

                <!-- 썸머노트 내용 필드 -->
                ${dto.getContent()}

            </div>
        </div>

        <!-- 목록 버튼 필드 -->
        <div class="button-field">
            <a href="javascript:void(0)" onclick="setTimeout(function() {goSite('notice');}, 200)" class="button ripple-effect blue-line" data-animation="ripple">
                목록
            </a>
            <c:if test="${session_level eq 'top'}">
                <a href="javascript:void(0)" onclick="setTimeout(function() {goModify('${dto.getNo()}')}, 200)" class="button ripple-effect blue-line" data-animation="ripple">
                    수정
                </a>
                <a href="javascript:void(0)" onclick="setTimeout(function() {goDelete('${dto.getNo()}')}, 200)" class="button ripple-effect" data-animation="ripple">
                    삭제
                </a>
            </c:if>
        </div>

        <div class="prev-next-box">
            <div class="box-wrap">
                <ul class="post-nav margin-bottom-40">
                    <c:if test="${not empty nextTitle}">
                        <!-- 다음 글 -->
                        <li class="next-post">
                            <a href="javascript:goView('${nextNo}')">
                                <span>다음글</span>
                                <strong>${nextTitle}</strong>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${not empty prevTitle}">
                        <!-- 이전 글 -->
                        <li class="prev-post">
                            <a href="javascript:goView('${prevNo}')">
                                <span>이전글</span>
                                <strong>${prevTitle}</strong>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </div>
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

        function goModify(arg) {
            urldirect.action = "Notice";
            urldirect.separate.value = "modify";
            urldirect.no.value = arg;
            urldirect.submit();
        }

        function goDelete(arg) {
            if(confirm("정말 이 게시글을 삭제하시겠습니까?")) {
                urldirect.action = "Notice";
                urldirect.separate.value = "delete";
                urldirect.no.value = arg;
                urldirect.submit();
            }
        }
    </script>
</body>
</html>