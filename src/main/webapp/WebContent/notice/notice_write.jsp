<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ include file="../common_header.jsp"%>

<c:if test="${session_level ne 'top'}">
    <script>
        alert("비정상적인 접근입니다!");
        location.href = "Notice";
    </script>
</c:if>

<%@ include file="common_notice.jsp"%>

<div class="container-notice">
    <div class="bar-title">
        <h2 class="title">공지사항</h2>

        <%@ include file="../breadcrumbs_cscenter.jsp" %>
    </div>

    <form action="Notice" name="board" method="post">
        <input type="hidden" name="separate" value="save">
        <div class="dashboard margin-bottom-40">

            <div class="content">
                <ul class="dashboard-box-list">
                    <li>
                        <div class="submit-field margin-bottom-0">
                            <input type="text" name="t_title" class="with-border" placeholder="제목">
                        </div>
                    </li>

                    <li>
                        <div class="submit-field">
                            <input type="hidden" name="t_content">
                            <div id="summernote"></div>
                        </div>
                    </li>

                    <li>
                        <div class="submit-field">
                            <select class="with-border" style="cursor: pointer" name="t_important">
                                <option value=""> = 공지설정 </option>
                                <option value="1">최고중요</option>
                                <option value="2">부제목</option>
                            </select>
                        </div>
                    </li>

                </ul>
            </div>

        </div>

        <div class="button-field">
            <a href="javascript:void(0)" onclick="setTimeout(function(){goSave()}, 150)" class="button ripple-effect" data-animation="ripple">
                등록
            </a>
            <a href="javascript:void(0)" onclick="setTimeout(function(){location.href='Notice'}, 150)"
               class="button ripple-effect blue-line" data-animation="ripple">
                목록
            </a>
        </div>

    </form>
</div>

<%@ include file="../common_footer.jsp" %>

<script src="js/btn_ripple_effect.js"></script>
<script>
    $(document).ready(function () {
        $("#summernote").summernote({
            height: 300,
            lang: 'ko-KR',
            toolbar : [
                [ 'fontname', [ 'fontname' ] ],
                [ 'fontsize', [ 'fontsize' ] ],
                ['style', [ 'bold', 'italic', 'underline', 'strikethrough', 'clear' ] ],
                [ 'color', [ 'forecolor', 'color' ] ],
                [ 'para', [ 'ul', 'ol', 'paragraph' ] ],
                [ 'insert', [ 'picture','link','video' ] ],
                [ 'height', [ 'height' ] ],
                ['view', ['codeview', 'help']],
            ],
            fontNames : [ '돋움', '돋움체', '굴림', '굴림체', '바탕', '바탕체', '궁서',
                'Arial', 'Tahoma', 'Times New Roman', 'Verdana', '나눔고딕'],
            fontSizes : [ '7', '8', '9', '10', '11', '12', '14', '18',
                '24', '36' ]
        });
    });
</script>
<script>
    function goSave() {
        if(checkValue(board.t_title, "제목을 입력하세요")) return;
        var snoteContent = $("#summernote").summernote('code');
        board.t_content.value = snoteContent;

        if(checkValue(board.t_content, "내용을 입력하세요")) return;

        if(confirm("게시글을 등록하시겠습니까?")) {
            board.submit();
        }
    }
</script>
</body>
</html>