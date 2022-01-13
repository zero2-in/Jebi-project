<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="../common_header.jsp"%>

<c:if test="${session_level ne 'top'}">
  <script>
    alert("비정상적인 접근입니다!");
    location.href = "Event";
  </script>
</c:if>

<%@ include file="common_event.jsp"%>

<div class="container-notice">
  <div class="bar-title">
    <h2 class="title">이벤트</h2>

    <%@ include file="../breadcrumbs_cscenter.jsp" %>
  </div>

  <form action="Event?separate=save" name="board" method="post" enctype="multipart/form-data">
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
            <div class="submit-field margin-bottom-0">
              <input type="text" name="t_sub_title" class="with-border" placeholder="부제목">
            </div>
          </li>

          <li>
            <div class="submit-field container-agent">

              <div class="submit-field">
                <div class="input-with-icon-left">
                  <i class="far fa-calendar"></i><input type="date" name="t_start_date" class="with-border" data-placeholder="이벤트 시작일" required>
                </div>
              </div>

              <div class="submit-field">
                <div class="input-with-icon-left">
                  <i class="far fa-calendar"></i><input type="date" name="t_end_date" class="with-border" data-placeholder="이벤트 종료일" required>
                </div>
              </div>

            </div>
          </li>

          <li>
            <div class="submit-field">
              <input type="hidden" name="t_content">
              <div id="summernote"></div>
            </div>
          </li>
          <li>
            <div class="submit-field margin-bottom-0">
              <div class="upload-button">
                <input type="file" accept="image/*, application/pdf" name="t_attach" id="upload" class="upload-button-input" multiple>
                <label for="upload" class="upload-button-button ripple-effect" data-animation="ripple">파일찾기</label>
                <span class="upload-button-file-name">파일 최대 크기 : 10 MB</span>
              </div>
            </div>
          </li>
        </ul>
      </div>

    </div>

    <div class="button-field">
      <a href="javascript:void(0)" onclick="setTimeout(function(){goSave()}, 150)" class="button ripple-effect" data-animation="ripple">
        등록
      </a>
      <a href="javascript:void(0)" onclick="setTimeout(function(){location.href='Event'}, 150)"
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
    if(checkValue(board.t_title, "제목을 입력하세요")) return;
    var snoteContent = $("#summernote").summernote('code');
    board.t_content.value = snoteContent;

    if(checkValue(board.t_sub_title, "부제목을 입력하세요")) return;

    if(checkValue(board.t_content, "내용을 입력하세요")) return;

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

    if(confirm("게시글을 등록하시겠습니까?")) {
      board.submit();
    }
  }
</script>
</body>
</html>