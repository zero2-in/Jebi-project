<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="../common_header.jsp"%>

<c:if test="${session_level ne 'top'}">
    <script>
        alert("비정상적인 접근입니다!");
        location.href = "Faq";
    </script>
</c:if>

<%@ include file="common_faq.jsp"%>

<div class="container-notice">
    <div class="bar-title">
        <h2 class="title">자주하는질문</h2>

        <%@ include file="../breadcrumbs_cscenter.jsp" %>
    </div>

    <form action="Faq" name="board" method="post">
        <input type="hidden" name="separate" value="update">
        <input type="hidden" name="t_no" value="${dto.getNo()}">
        <div class="dashboard margin-bottom-40">

            <div class="content">
                <ul class="dashboard-box-list">
                    <li>
                        <div class="submit-field margin-bottom-0">
                            <input type="text" name="t_title" class="with-border" placeholder="제목" value="${dto.getTitle()}">
                        </div>
                    </li>

                    <li>
                        <div class="submit-field">
                            <input type="hidden" name="t_content">
                            <div id="summernote">${dto.getContent()}</div>
                        </div>
                    </li>

                    <li>
                        <div class="submit-field">
                            <select class="with-border" style="cursor: pointer" name="t_category">
                                <option value=""> = 카테고리 </option>
                                <c:forEach items="${category_list}" var="list" begin="0" end="${category_list.size()}">
                                    <option value="${list[0]}" <c:if test="${dto.getCategory_code() eq list[0]}">selected</c:if>>${list[1]}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </li>

                </ul>
            </div>

        </div>

        <div class="button-field">
            <a href="javascript:void(0)" onclick="setTimeout(function(){goSave()}, 150)" class="button ripple-effect" data-animation="ripple">
                수정
            </a>
            <a href="javascript:void(0)" onclick="setTimeout(function(){location.href='Faq'}, 150)"
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
        if(board.t_category.value == "") {
            alert("카테고리를 선택하세요.");
            board.t_category.focus();
            return;
        }

        if(confirm("게시글을 수정하시겠습니까?")) {
            board.submit();
        }
    }
</script>
</body>
</html>