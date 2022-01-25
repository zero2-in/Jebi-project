<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../common_header.jsp" %>
<c:if test="${not empty session_name}">
  <script>
    alert("이미 로그인하셨습니다!");
    location.href="OrderStatus";
  </script>
</c:if>

<script src="js/tab_content.js"></script>
<script>
  $(document).ready(function () {
    $("#breadcrumbs #pageTitle").html("아이디/비번찾기");
    $("#breadcrumbs .id-pw").addClass("selected");
    $("#breadcrumbs .id-pw").attr("href", "javascript:void(0)");
  });
</script>

<div class="container-find-id-pw">
  <div class="bar-title">
    <h2 class="title">아이디/비번찾기</h2>
    <%@ include file="breadcrumbs_member.jsp" %>
  </div>
  <div class="content-find-id-pw">
    <div class="tab01">
      <ul class="tabnavi">
        <li class="tab-find-id"><a href="#tab01"><b>아이디 찾기</b></a></li>
        <li class="tab-find-pw"><a href="#tab02"><b>비밀번호 재발급</b></a></li>
      </ul>
    </div>
    <div class="tab-content">
      <form action="Member" method="post" onsubmit="return check();" name="id-pw">
        <input type="hidden" name="separate" value="dologin">
      <div id="tab01">
        <div class="board-find-id-pw">
          <div class="form-find-id-pw">
            <!-- 로그인 텍스트 상자 -->
            <p class="text-box">
              <i class="fas fa-user-circle"></i>
              <input type="text" class="input" name="name"  placeholder="성명" autofocus onkeypress="if(event.keyCode == '13') id-pw.phone.focus();">
            </p>
            <p class="text-box">
              <i class="fas fa-phone"></i>
              <input type="text" class="input" name="phone" placeholder="전화번호"   onkeypress="if(event.keyCode == '13') check();">
            </p>

            <!-- 로그인 버튼 -->
            <button type="button" class="btn-fint-id" data-animation="ripple" onclick="setTimeout(function() {check();}, 100);">
              <span class="text">아이디 찾기</span>
              <span class="arrow-animate"><i class="fas fa-long-arrow-alt-right"></i></span>
            </button>
          </div>
        </div>
      </div>

      <div id="tab02">
        <div class="board-find-id-pw">
          <div class="form-find-id-pw">
            <!-- 로그인 텍스트 상자 -->
            <p class="text-box">
              <i class="fas fa-user-circle"></i>
              <input type="text" class="input" name="id"  placeholder="아이디" autofocus onkeypress="if(event.keyCode == '13') id-pw.name.focus();">
            </p>
            <p class="text-box">
              <i class="fas fa-user-circle"></i>
              <input type="text" class="input" name="name"  placeholder="성명" autofocus onkeypress="if(event.keyCode == '13') id-pw.phone.focus();">
            </p>
            <p class="text-box">
              <i class="fas fa-phone"></i>
              <input type="text" class="input" name="phone" placeholder="전화번호"   onkeypress="if(event.keyCode == '13') check();">
            </p>

            <!-- 로그인 버튼 -->
            <button type="button" class="btn-fint-id" data-animation="ripple" onclick="setTimeout(function() {check();}, 100);">
              <span class="text">비밀번호 재발급</span>
              <span class="arrow-animate"><i class="fas fa-long-arrow-alt-right"></i></span>
            </button>
          </div>
        </div>
      </div>
      </form>
    </div>
  </div>




  <!-- Scripts -->
  <script>
    function check() {
      if(checkValue(id-pw.name, "성명을 입력하세요")) return;
      if(checkValue(id-pw.phone, "전화번호를 입력하세요")) return;

      saveid();

      login.submit();
    }
  </script>
</div>

<!-- Footer -->
<%@ include file="../common_footer.jsp" %>
</body>
</html>