<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="../common_header.jsp" %>

<c:if test="${empty session_name}">
    <script>
        alert("로그인 후 이용이 가능합니다.");
        location.href="Member";
    </script>
</c:if>

<c:if test="${session_id ne dto.getReg_id()}">
    <script>
        alert("비정상적인 접근입니다.");
        location.href="Qna";
    </script>
</c:if>

<%@ include file="common_qna.jsp" %>

<div class="container-notice">
    <div class="bar-title">
        <h2 class="title">1:1문의</h2>

        <!-- 사이트 이동경로를 만들어라! -->
        <%@ include file="../breadcrumbs_cscenter.jsp" %>
    </div>

    <form action="Qna?separate=update" name="board" method="post" enctype="multipart/form-data">
        <input type="hidden" name="no" value="${dto.getNo()}">
        <div class="dashboard margin-bottom-40">

            <div class="content">
                <ul class="dashboard-box-list">
                    <li>
                        <div class="submit-field margin-bottom-0">
                            <input type="text" name="t_title" class="with-border" placeholder="제목" value="${dto.getTitle()}">
                        </div>
                        <div class="submit-field margin-bottom-0 margin-top-15">
                            <select class="with-border" name="t_category" style="cursor: pointer">
                                <option value=""> = 선택</option>
                                <c:forEach items="${category_list}" var="list">
                                    <option value="${list[0]}" <c:if test="${list[0] eq dto.getCategory_code()}">selected</c:if>>${list[1]}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </li>

                    <li>
                        <div class="submit-field">
                            <div class="upload-button">
                                <input type="text" name="t_order_no" style="width: 30%" class="with-border" placeholder="주문번호" readonly>
                                &nbsp;&nbsp;&nbsp;
                                <a href="javascript:void(0)" data-animation="ripple" class="button blue-line ripple-effect">
                                    <i class="fas fa-home"></i> 주문정보 불러오기
                                </a>
                                &nbsp;&nbsp;&nbsp;
                                <a href="javascript:void(0)" data-animation="ripple" class="button ripple-effect">
                                    리셋
                                </a>
                            </div>
                        </div>
                    </li>

                    <li>
                        <div class="submit-field">
                            <input type="hidden" name="t_content">
                            <div id="summernote">${dto.getContent()}</div>
                        </div>
                    </li>

                    <c:if test="${session_level eq 'top'}">
                        <li>
                            <div class="submit-field">
                                <select name="t_important" style="cursor: pointer" class="with-border">
                                    <option value="">일반 질문게시글로 설정</option>
                                    <option value="Y" <c:if test="${dto.getImportant() eq 'Y'}">selected</c:if>>최고중요 공지글로 설정</option>
                                    <option value="X" <c:if test="${dto.getImportant() eq 'X'}">selected</c:if>>부제목 공지글로 설정</option>
                                </select>
                            </div>
                        </li>
                    </c:if>

                    <li>
                        <div class="submit-field margin-bottom-0">
                            <div class="upload-button container-agent">
                                <input type="file" accept="image/*, application/pdf" name="t_attach" id="upload" class="upload-button-input" multiple>
                                <c:choose>
                                    <c:when test="${not empty dto.getAttach()}">
                                        <label for="upload" class="upload-button-button ripple-effect" data-animation="ripple">파일찾기</label>
                                        <span class="upload-button-file-name">파일 최대 크기 : 10 MB</span>
                                        <div class="checkbox">
                                            <input type="checkbox" id="delAtt" name="deleteAttach" value="${dto.getAttach()}">
                                            <label for="delAtt">
                                                <span class="checkbox-icon"></span>
                                                ${dto.getAttach()} 파일 삭제
                                            </label>
                                        </div>
                                        <input type="hidden" name="preAttach" value="${dto.getAttach()}">
                                    </c:when>
                                    <c:otherwise>
                                        <label for="upload" class="upload-button-button ripple-effect" data-animation="ripple">파일찾기</label>
                                        <span class="upload-button-file-name">파일 최대 크기 : 10 MB</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </li>

                </ul>
            </div>

        </div>

        <div class="button-field">
            <a href="javascript:void(0)" class="button ripple-effect" data-animation="ripple" onclick="setTimeout(function(){goSave()}, 150)">
                수정
            </a>
            <a href="javascript:void(0)" onclick="setTimeout(function(){location.href='Qna'}, 150)"
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

        $("#upload").change(function() {
            var str = $(this).val();
            var fileName = str.split('\\').pop();
            $(".upload-button .upload-button-file-name").html(fileName);
        });
    });
</script>
<script>
    function goSave() {
        if(checkValue(board.t_title, "제목을 입력하세요.")) return;
        if(checkValue(board.t_category, "카테고리를 선택하세요.")) return;
        var snoteContent = $("#summernote").summernote('code');
        board.t_content.value = snoteContent;

        if(checkValue(board.t_content, "내용을 입력하세요.")) return;

        /*첨부 용량 체크*/
        var file = board.t_attach;
        var fileMaxSize  = 10;
        if(file.value !=""){
            // 사이즈체크
            var maxSize  = 1024 * 1024 * fileMaxSize;
            var fileSize = 0;

            // 브라우저 확인
            var browser=navigator.appName;
            // 익스플로러일 경우
            if (browser=="Microsoft Internet Explorer"){
                var oas = new ActiveXObject("Scripting.FileSystemObject");
                fileSize = oas.getFile(file.value).size;
            }else {
                // 익스플로러가 아닐경우
                fileSize = file.files[0].size;
            }
            //alert("파일사이즈 : "+ fileSize);

            if(fileSize > maxSize){
                alert("첨부파일 사이즈는 "+fileMaxSize+"MB 이내로 등록 가능합니다. ");
                return;
            }
        }

        if(confirm("게시글을 수정하시겠습니까?")) {
            board.submit();
        }
    }
</script>
</body>
</html>