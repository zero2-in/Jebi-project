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

    <div class="dashboard margin-bottom-40">
        <div class="blog-post-content">
            <!-- 제목 입력! -->
            <h3 class="margin-bottom-10">
                ${dto.getTitle()}
            </h3>
            <!-- 입력자 정보! -->
            <div class="blog-post-info-list margin-bottom-20">
                <span class="blog-post-info">
                    <i class="far fa-calendar"></i>  ${dto.getStart_date()} ~ ${dto.getEnd_date()}
                </span>
                <p style="text-align: center; " align="center"><img src="file_room/event/${dto.getNo()}_${dto.getAttach()}" width="792"><br style="clear:both;"></p>
            </div>
            ${dto.getContent()}

        </div>
    </div>



    <!-- 목록 버튼 필드 -->
    <div class="button-field">
        <a href="javascript:void(0)" onclick="setTimeout(function() {location.href='Qna';}, 200)" class="button ripple-effect blue-line" data-animation="ripple">
            1:1문의
        </a>
        <c:if test="${session_level eq 'top'}">
            <a href="javascript:void(0)" onclick="setTimeout(function(){location.href='Event'}, 150)"
               class="button ripple-effect blue-line" data-animation="ripple">
                목록
            </a>
            <a href="javascript:void(0)" onclick="setTimeout(function() {goModify('${dto.getNo()}')}, 200)" class="button ripple-effect blue-line" data-animation="ripple">
                수정
            </a>
            <a href="javascript:void(0)" onclick="setTimeout(function() {goDelete('${dto.getNo()}')}, 200)" class="button ripple-effect" data-animation="ripple">
                삭제
            </a>
        </c:if>
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

    function goModify(arg) {
        urldirect.action = "Event";
        urldirect.separate.value = "modify";
        urldirect.no.value = arg;
        urldirect.submit();
    }

    function goDelete(arg) {
        if(confirm("정말 이 게시글을 삭제하시겠습니까?")) {
            urldirect.action = "Event";
            urldirect.separate.value = "delete";
            urldirect.no.value = arg;
            urldirect.attach.value = "${dto.getAttach()}";
            urldirect.submit();
        }
    }
</script>

</body>
</html>