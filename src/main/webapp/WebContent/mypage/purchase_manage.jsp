<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="../common_header.jsp" %>

<c:if test="${empty session_name}">
  <script>
    alert("로그인 후 이용가능합니다.");
    location.href = "Member";
  </script>
</c:if>

<script>
  $(document).ready(function () {
    $("#breadcrumbs #pageTitle").html("결제 관리");
    $("#breadcrumbs .purchase_manage").addClass("selected");
    $("#breadcrumbs .purchase_manage").attr("href", "javascript:void(0)");
  });
</script>

<div class="container-agent">
  <div class="bar-title">
    <h2 class="title">결제 관리</h2>

    <%@include file="breadcrumbs_mypage.jsp"%>
  </div>

  <div class="margin-top-50"></div>

  <!-- 마이페이지 컨테이너 -->
  <%@ include file="mypage_container.jsp" %>
  <!-- 마이페이지 컨테이너 / 끝 -->
  <form action="" method="post">

    <!-- Row -->
    <div class="row">
      <div class="col-xl-12 col-common">
        <div class="dashboard-box margin-top-0 margin-bottom-20">
          <!-- Headline -->
          <div class="headline">
            <h3 class="fl">
              <i class="fas fa-angle-double-right"></i>
              주문 리스트
            </h3>
            <div class="headline-btn">
              <a href="javascript:void(0)" data-animation="ripple" class="button blue-line ripple-effect">
                결제 내역
              </a>
            </div>
          </div>
          <!-- Content -->
          <div class="content">
            <ul class="dashboard-box-list">
              <li>
                <div class="board-listing width-adjustment">
                  <div class="board-listing-details">
                    <div class="board-listing-description">
                      <label>결제 대기건이 존재하지 않습니다.</label>
                    </div>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>
        <div class="tip-text margin-top-10">
          <span>*</span>
          여러 건을 한꺼번에 결제하실 경우에는 해당 건을 모두 클릭해주시면 됩니다.
          <br>
          <span>*</span>
          결제대기건의 경우 모든 포장, 배송비 계측이 마무리 된 것이므로 재포장이나 합배송/묶음배송이 불가능합니다.
        </div>
      </div>
    </div>
    <!-- Row / End -->
    <!-- Row -->
    <div class="row">
      <!-- content-right-offset -->
      <div class="col-xl-8 col-common content-right-offset">
        <!-- Billing Cycle Radios -->
        <div class="billing-cycle">
          <!-- Rado -->
          <div class="radio">
            <input type="radio" name="payment_way" id="PAYMENT_1" value="1" checked>
            <label for="PAYMENT_1">
              <span class="radio-label"></span>
              무통장입금
            </label>
          </div>
          <div class="radio">
            <input type="radio" name="payment_way" id="PAYMENT_2" value="2">
            <label for="PAYMENT_2">
              <span class="radio-label"></span>
              신용카드
            </label>
          </div>
        </div>
        <div class="billing-cycle margin-top-10">
                        <span class="tip-text fc_red">
                             입금 계좌번호는 하기 결제요청 버튼을 클릭하시면 확인 가능합니다.
                        </span>
        </div>
        <!-- Payment Methods Accordion -->
        <div class="payment">
          <div class="payment-tab payment-tab-active">
            <div class="submit-field-area">
              <div class="submit-field field-two margin-bottom-0">
                <div class="field-block fl">
                  <input type="text" name="" placeholder="예치금 결제" class="with-border" value="0">
                  <button type="button" class="input-button ripple-effect" data-animation="ripple">
                    예치금 전액사용
                  </button>
                </div>
                <div class="field-block fr">
                  <input type="text" name="" placeholder="포인트 사용" class="with-border" value="0">
                  <button type="button" class="input-button ripple-effect" data-animation="ripple">
                    포인트 전액사용
                  </button>
                </div>
                <div class="clearfix"></div>
              </div>
            </div>
          </div>
        </div>
        <!-- Payment Methods Accordion / End -->
      </div>
      <!-- content-right-offset / End -->
      <!-- Summary -->
      <div class="col-xl-4 col-common">
        <div class="boxed-widget summary margin-top-0">
          <div class="boxed-widget-headline">
            <h3>총 결제금액</h3>
          </div>
          <div class="boxed-widget-inner">
            <ul>
              <li>
                결제금액
                <span>
                                        &#8361;<span class="num">0</span>
                                    </span>
              </li>
              <li>
                쿠폰할인
                <span>
                                        &#8361;<span class="num">0</span>
                                    </span>
              </li>
              <li class="total-costs">
                Total
                <span class="bold num">
                                        &#8361;
                                        <span class="num">0</span>
                                    </span>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <!-- Summary / End -->
      <div class="col-xl-12 col-common tc margin-top-30">
        <a href="javascript:void(0)" data-animation="ripple" class="button big ripple-effect">
          결제하기
        </a>
      </div>
    </div>
    <!-- Row / End -->

  </form>


</div>
<%@ include file="../common_footer.jsp" %>

<script src="js/btn_ripple_effect.js"></script>
</body>
</html>