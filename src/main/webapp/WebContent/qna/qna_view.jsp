<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="UTF-8" %>

<%@ include file="../common_header.jsp" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>

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
        
        <div class="dashboard margin-bottom-40">
            <div class="blog-post-content">
                <!-- 제목 입력! -->
                <h3 class="margin-bottom-10">
                    [${dto.getCategory_name()}]
                    <c:if test="${dto.getImportant() eq 'Y'}"> <font color="red"><b>${dto.getTitle()}</b></font></c:if>
                    <c:if test="${dto.getImportant() eq 'X'}"> <font color="#78148c"><b>${dto.getTitle()}</b></font></c:if>
                    <c:if test="${dto.getImportant() eq 'N'}"> ${dto.getTitle()}</c:if>
                </h3>
                <!-- 입력자 정보! -->
                <div class="blog-post-info-list margin-bottom-20">
                    <span class="blog-post-info">
                        <i class="fas fa-exclamation-triangle"></i> <c:if test="${not empty reply_list || dto.getImportant() eq 'Y'}">답변완료</c:if>
                    </span>
                    <span class="blog-post-info">
                        <i class="far fa-edit"></i> ${dto.getReg_name()}
                    </span>
                    <span class="blog-post-info">
                        <i class="far fa-calendar"></i> ${dto.getReg_date()}
                    </span>
                    <c:if test="${not empty dto.getAttach()}">
                        <a href="javascript:void(0)" class="blog-post-info">
                            <i class="fas fa-link"></i>  ${dto.getAttach()} (다운로드)
                        </a>
                    </c:if>
                </div>

                <!-- 썸머노트 내용 필드 -->
                ${dto.getContent()}
            </div>
        </div>

        <!-- 목록 버튼 필드 -->
        <div class="button-field">
            <a href="javascript:void(0)" onclick="setTimeout(function() {location.href='Qna';}, 200)" class="button ripple-effect blue-line" data-animation="ripple">
                목록
            </a>
            <c:if test="${dto.getReg_id() eq session_id && empty reply_list}">
                <a href="javascript:void(0)" onclick="setTimeout(function() {goModify('${dto.getNo()}')}, 200)" class="button ripple-effect blue-line" data-animation="ripple">
                    수정
                </a>
                <a href="javascript:void(0)" onclick="setTimeout(function() {goDelete('${dto.getNo()}')}, 200)" class="button ripple-effect" data-animation="ripple">
                    삭제
                </a>
            </c:if>
            <c:if test="${session_level eq 'top'}">
                <a href="javascript:void(0)" onclick="setTimeout(function() {goDelete('${dto.getNo()}')}, 200)" class="button ripple-effect" style="float: right" data-animation="ripple">
                    강제삭제
                </a>
            </c:if>
        </div>
    </div>
    <div class="container-agent margin-top-30">
        <form action="Qna" method="post" name="frmComment">
            <input type="hidden" name="separate" value="reply">
            <!-- Comments -->
            <div class="row">
                <div class="col-xl-12 col-common">
                    <div class="comments margin-bottom-20">
                        <h3 class="margin-top-45 margin-bottom-0">Comments <span class="comments-amount">(${reply_list.size()})</span></h3>
                        <ul>
                            <c:forEach items="${reply_list}" var="list">
                                <!-- 댓글 블럭 -->
                                <li>
                                    <div class="comment-content">
                                        <div class="arrow-comment"></div>
                                        <div class="comment-by">
                                            ${list.getComment_reg_name()}
                                            <span class="date">${list.getComment_reg_date()}</span>
                                            <c:if test="${list.getComment_reg_id() eq session_id || session_level eq 'top'}">
                                                <span class="edit">
                                                    <a href="javascript:delComment('${list.getNo()}', '${list.getComment_reg_id()}')">삭제</a>
                                                </span>
                                            </c:if>
                                        </div>
                                        <p>${fn:replace(list.getComment_content(), replaceChar, "<br/></p><p>")}</p>
                                    </div>
                                </li>
                                <!-- 댓글 블럭 / End -->
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Comments / End -->
            <c:if test="${dto.getImportant() ne 'Y' || not empty session_name}">
                <!-- Leave a Comment -->
                <div class="row">
                    <div class="col-xl-12 col-common">
                        <!-- Form -->
                        <textarea name="t_comment" id="cont" cols="30" rows="3" placeholder="Comment" class="margin-bottom-15"></textarea>
                        <!-- Button -->
                        <button class="button button-sliding-icon ripple-effect margin-bottom-40" type="button" data-animation="ripple"
                        onclick="setTimeout(function(){goReply()}, 150)">
                            댓글 달기 <i class="fas fa-arrow-right"></i>
                        </button>
                    </div>
                </div>
            </c:if>
        </form>
    </div>

    <%@ include file="../common_footer.jsp" %>

    <script src="js/btn_ripple_effect.js"></script>
    <script>
        function goReply() {
            if(checkValue(frmComment.t_comment, "댓글 내용을 입력하지 않았습니다.")) return;

            var comment_content = frmComment.t_comment.value;

            $.ajax({
                type: "post",
                url: "QnaReply",
                async: false,
                data: "no=${dto.getNo()}&t_comment="+comment_content,
                success: function (data) {
                    if(data.trim() == 'success') {
                        location.reload();
                    } else {
                        alert("댓글 달기에 실패했습니다.");
                    }
                }
            });
        }

        function goModify(arg) {
            urldirect.separate.value = "modify";
            urldirect.no.value = arg;
            urldirect.action = "Qna";
            urldirect.submit();
        }

        function goDelete(arg) {
            if(confirm("해당 게시글을 삭제하시겠습니까?")) {
                urldirect.separate.value = "delete";
                urldirect.no.value = arg;
                urldirect.attach.value = "${dto.getAttach()}";
                urldirect.action = "Qna";
                urldirect.submit();
            }
        }

        function delComment(arg, arg1) {
            if(confirm("해당 댓글을 삭제하시겠습니까?")) {
                $.ajax({
                    type: "post",
                    url: "QnaDeleteReply",
                    data: "no="+arg+"&reg_id="+arg1,
                    success: function (data) {
                        if(data.trim() == 'success') {
                            location.reload();
                        } else {
                            alert("댓글 삭제에 실패했습니다!");
                        }
                    }
                });
            }
        }

    </script>
</body>
</html>