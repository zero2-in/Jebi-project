<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../common_header.jsp" %>

<link rel="stylesheet" href="css/customs_duty_list.css">

<!-- nav Script -->
<script>
  $(document).ready(function () {
    $("#breadcrumbs .dropbtn").click(function () {
      $("#breadcrumbs .dropdown-content").toggle(200);
      $("#breadcrumbs .select-area").toggleClass("active");
    });
  });
</script>
<%@ include file="common_informationuse.jsp" %>

<!-- Container Start -->
<div id="container">
  <!-- Informatio Use Start -->
  <div class="informationuse">
    <!-- Title / nav-list  Start -->
    <div class="informationuse-title"><p>관/부가세 안내</p>
      <nav id="breadcrumbs" class="dark">
        <ul class="nav-list">
          <li><a href="../index.html">Home</a></li>
          <li>이용안내</li>
          <li class="select-area">
            <button class="dropbtn">이용팁&nbsp;<span class="bs-caret"><span class="caret"></span></span></button>
            <div class="dropdown-content">
              <a href="javascript:goSite('delivery_agent_service_list')">배송대행 이용방법</a>
              <a href="javascript:goSite('purchasing_agent_service_list')">구매대행 이용방법</a>
              <a href="javascript:goSite('business_user_guide_list')">사업자 이용안내</a>
              <a href="javascript:goSite('joni_manual_list')">타오바오 이용방법</a>
              <a href="javascript:goSite('chinese_size_condition_table_list')">이용팁&nbsp;&nbsp;&nbsp;<i class="fas fa-check"></i></a>
              <a href="javascript:goSite('nodata_processing_manual_list')">노데이터 처리방법</a>
            </div>
          </li>
        </ul>
      </nav>
    </div>
    <!-- Title / nav-list  End -->

    <!-- Sub title  Start -->
    <div class="informationuse-sub-title">
      <div class="delivery-agent">
        <div class="delivery-agent-manual">배송대행 이용방법</div>
        <a href="javascript:goSite('delivery_agent_service_list')"><div class="delivery-agent-service">배송대행 서비스 안내</div></a>
        <a href="javascript:goSite('delivery_agent_application_manual_list')"><div class="delivery-agent-application-manual">배송대행 신청서 작성법</div></a>
      </div>
      <div class="purchasingagent-agent">
        <div class="purchasingagent-agent-manual">구매대행 이용방법</div>
        <a href="javascript:goSite('purchasing_agent_service_list')"><div class="purchasingagent-agent-service">구매대행 서비스 안내</div></a>
        <a href="javascript:goSite('purchasingagent_agent_application_manual_list')"><div class="purchasingagent-agent-application-manual">구매대행 신청서 작성법</div></a>
      </div>
      <a href="javascript:goSite('business_user_guide_list')"><div class="business-user-guide">사업자 이용안내</div></a>
      <div class="taobao-agent">
        <div class="taobao-manual">타오바오 이용방법</div>
        <a href="javascript:goSite('joni_manual_list')"><div class="join-manual">가입방법</div></a>
        <a href="javascript:goSite('address_manual_list')"><div class="address-manual">주소 설정하기</div></a>
        <a href="javascript:goSite('purchase_payment_list')"><div class="purchase-payment">구매결제하기</div></a>
        <a href="javascript:goSite('return_refund_manual_list')"><div class="return-refund-manual">반품/환불방법</div></a>
        <a href="javascript:goSite('invoice_number_list')"><div class="invoice-number">송장번호 확인하기</div></a>
        <a href="javascript:goSite('automatic_order_registration_list')"><div class="automatic-order-registration">주문자동등록방법</div></a>
      </div>
      <div class="use-tip-agent">
        <div class="use-tip">이용팁</div>
        <a href="javascript:goSite('chinese_size_condition_table_list')"><div class="chinese-size-condition-table">중국사이즈 조건표</div></a>
        <a href="javascript:goSite('chinese_delivery_tracking_list')"><div class="chinese-delivery-tracking">중국내 배송조회</div></a>
        <a href="javascript:goSite('issuance_of_unique_number_list')"><div class="issuance-of-unique-number">개인통관고유부호발급 방법</div></a>
        <a href="javascript:goSite('customs_duty_list')"><div class="customs-duty">관/부가세 안내</div></a>
        <a href="javascript:goSite('import_prohibited_items_list')"><div class="import-prohibited-items">수입금지품목</div></a>
      </div>
      <a href="javascript:goSite('nodata_processing_manual_list')"><div class="nodata-processing-manual">노데이터 처리방법</div></a>
    </div>
    <!-- Sub title  End -->

    <!-- Content  Start -->
    <div class="customs-duty-content">
      <div class="customs-duty-box">
        <div class="customs-duty-what"><i class="fas fa-minus"></i><br><h2>관부가세란?</h2></div>
        <div class="customs-duty-what-img"><img src="images/customs_duty_what_img.png" height="170px">
          <P>외국으로부터 반입되는 화물에 대한 세금(관세) + 해당 구매금액 및 관세에 대한 10%(부가세)를 합산한 세금 입니다.</P>
        </div>
      </div>
      <div class="customs-duty-calculus-notice">
        <div class="customs-duty-box2">
          <div class="customs-duty-calculus"><i class="fas fa-minus"></i><br><h2>관부가세 계산법</h2></div>
          <div class="customs-duty-calculus-img"><img src="images/customs_duty_calculus_img.png" height="125px">
            <P>과세 가격 = 상품 총 결제 금액 X 관세청 고시환율 + 과세운임<br>
              관세 = 과세가격 X 구입한 품목의 관세율<br>
              부가세 = (과세가격 + 관세) X 0.1</P>
          </div>
        </div>
        <div class="customs-duty-box3">
          <div class="customs-duty-notice"><i class="fas fa-minus"></i><br><h2>관부가세 유의사항</h2></div>
          <div class="customs-duty-notice-img"><img src="../images/customs_duty_notice_img.png" height="125px">
            <P>1) 세관 수입신고시 운임은 직박구리의 배송요금이 아닙니다.<br>
              2) 물품금액 20만원 이하일 경우는 선편 일반 소포요금을 적용하며, 물품금액 20만원 초과시는 특송화물 과세운임을 적용합니다.<br>
              3) 관세청 고시환율은 매주 일~토요일까지 적용되고 해당 주의 전 주의 환율을 토대로 정해집니다.<br>
              4) 정해진 고시환율은 고객님께서 상품 구입시 적용 받으시는 환율과는 다릅니다.<br>
              5) 추가 내국세가 적용되는 품목도 있습니다.</P>
          </div>
        </div>
      </div>
      <div class="tariff-rate">
        <h2>일반물품 품목별 관세율표</h2>
      </div>
      <div class="uniqueness">
        <p>(*) 품목은 물품금액이 100~200 만원 이상일 경우 특소세가 부가될 수 있습니다.</p>
      </div>
      <div class="tariff-rate-table-box">
        <table class="tariff-rate-table">
          <thead>
          <tr>
            <th width=500>품목</th>
            <th width=200>관세율</th>
            <th>부가세</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td class="title">의류/수영복/속옷</td>
            <td data-label="관세율">13%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">스카프/숄/넥타이/장갑</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">액세사리*</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">신발류</td>
            <td data-label="관세율">13%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">가방/핸드백</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">선글래스</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">화장품/향수*</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">펜/잉크</td>
            <td data-label="관세율">8%/6.5%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">서적/잡지/우표</td>
            <td data-label="관세율">-</td>
            <td data-label="부가세">-</td>
          </tr>
          <tr>
            <td class="title">면도기/다리미</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">CDP/MP3/오디오/스피커</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">노트북/PDA/컴퓨터 부품</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">캠코더*</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">폴라로이드 카메라/필름 카메라</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">디지털 카메라*</td>
            <td data-label="관세율">-</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">손목시계</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">골프채</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">모터보트 관련</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">행글라이더</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">수상스키</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">영사기</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">헤어관련용품</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">음반(CD / DVD)</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">커피머신</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">RC</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">유리식기종류</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">자동차(오토바이)부품</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">전등</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">음향장비/악기</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">레고/블럭장난감</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">유모차</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">스포차장비(가구)</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">기저귀</td>
            <td data-label="관세율">-</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">기념주화</td>
            <td data-label="관세율">-</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">텐트</td>
            <td data-label="관세율">13%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">PDP</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">가습기</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">낚시대</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">동물사료</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">GPS 수신기</td>
            <td data-label="관세율">-</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">그림</td>
            <td data-label="관세율">-</td>
            <td data-label="부가세">-</td>
          </tr>
          <tr>
            <td class="title">꿀</td>
            <td data-label="관세율">20%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">가구(장롱/쇼파/침대/침구류 등)</td>
            <td data-label="관세율">-</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">방독면</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">건강보조식품(최대수량 6개)</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">액션피규어</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">소프트웨어</td>
            <td data-label="관세율">-</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">전기전자제어판</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">자전거(부품)</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">공기청정기</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">무전기(통신허가필요)</td>
            <td data-label="관세율">-</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">페인트</td>
            <td data-label="관세율">7%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">금괴(골드바)</td>
            <td data-label="관세율">3%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">식품(과자/시리얼/젤리 등)</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">카메라렌즈</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">LCD패널</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">정수기(필터)</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">담배</td>
            <td data-label="관세율">40%</td>
            <td data-label="부가세">-</td>
          </tr>
          <tr>
            <td class="title">스프레이(락카)</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">도자기</td>
            <td data-label="관세율">8%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">도자기(골동품-100년이상)</td>
            <td data-label="관세율">-</td>
            <td data-label="부가세">-</td>
          </tr>
          <tr>
            <td class="title">우산</td>
            <td data-label="관세율">13%</td>
            <td data-label="부가세">10%</td>
          </tr>
          <tr>
            <td class="title">자동차/오토바이/배(요트)/트레일러 등</td>
            <td data-label="관세율">별도문의</td>
            <td data-label="부가세">별도문의</td>
          </tr>
          <tr>
            <td class="title">카페트</td>
            <td data-label="관세율">10%</td>
            <td data-label="부가세">10%</td>
          </tr>
          </tbody>
        </table>
      </div>
      <div class="special-tax"><h2>특소세 부과물품</h2></div>
      <div class="special-tax-table-box">
        <table class="special-tax-table">
          <thead>
          <tr>
            <th width=220>품목</th>
            <th width=110>관세율</th>
            <th width=110>특소세</th>
            <th width=110>교육세</th>
            <th width=110>농특세</th>
            <th width=110>부가세</th>
            <th>비고</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td class="title">오락용품(사행성)</td>
            <td data-label="관세율">8%</td>
            <td data-label="특소세">20%</td>
            <td data-label="교육세">30%</td>
            <td data-label="농특세">10%</td>
            <td data-label="부가세">10%</td>
            <td data-label="비고"></td>
          </tr>
          <tr>
            <td class="title">공기 조절기 관련</td>
            <td data-label="관세율">8%</td>
            <td data-label="특소세">20%</td>
            <td data-label="교육세">30%</td>
            <td data-label="농특세">-</td>
            <td data-label="부가세">10%</td>
            <td data-label="비고"></td>
          </tr>
          <tr>
            <td class="title">영사투사방식 TV 등</td>
            <td data-label="관세율">8%</td>
            <td data-label="특소세">10%</td>
            <td data-label="교육세">30%</td>
            <td data-label="농특세">-</td>
            <td data-label="부가세">10%</td>
            <td data-label="비고"></td>
          </tr>
          <tr>
            <td class="title">녹용/로얄젤리</td>
            <td data-label="관세율">20%</td>
            <td data-label="특소세">7%</td>
            <td data-label="교육세">30%</td>
            <td data-label="농특세">-</td>
            <td data-label="부가세">10%</td>
            <td data-label="비고"></td>
          </tr>
          <tr>
            <td class="title">향수</td>
            <td data-label="관세율">8%</td>
            <td data-label="특소세">7%</td>
            <td data-label="교육세">30%</td>
            <td data-label="농특세">10%</td>
            <td data-label="부가세">10%</td>
            <td data-label="비고"></td>
          </tr>
          <tr>
            <td class="title">보석/귀금속 관련</td>
            <td data-label="관세율">8%</td>
            <td data-label="특소세">20%</td>
            <td data-label="교육세">30%</td>
            <td data-label="농특세">-</td>
            <td data-label="부가세">10%</td>
            <td data-label="비고"></td>
          </tr>
          <tr>
            <td class="title">고급카메라 관련</td>
            <td data-label="관세율">8%</td>
            <td data-label="특소세">20%</td>
            <td data-label="교육세">30%</td>
            <td data-label="농특세">-</td>
            <td data-label="부가세">10%</td>
            <td data-label="비고"></td>
          </tr>
          <tr>
            <td class="title">고급모피 관련</td>
            <td data-label="관세율">16%</td>
            <td data-label="특소세">20%</td>
            <td data-label="교육세">30%</td>
            <td data-label="농특세">10%</td>
            <td data-label="부가세">10%</td>
            <td data-label="비고"></td>
          </tr>
          <tr>
            <td class="title">고급융단 등</td>
            <td data-label="관세율">10%</td>
            <td data-label="특소세">20%</td>
            <td data-label="교육세">30%</td>
            <td data-label="농특세">-</td>
            <td data-label="부가세">10%</td>
            <td data-label="비고"></td>
          </tr>
          <tr>
            <td class="title">고급가구 등</td>
            <td data-label="관세율">8%</td>
            <td data-label="특소세">20%</td>
            <td data-label="교육세">30%</td>
            <td data-label="농특세">10%</td>
            <td data-label="부가세">10%</td>
            <td data-label="비고"></td>
          </tr>
          <tr>
            <td class="title">술(위스키)</td>
            <td data-label="관세율">20%</td>
            <td data-label="특소세">-</td>
            <td data-label="교육세">30%</td>
            <td data-label="농특세">-</td>
            <td data-label="부가세">10%</td>
            <td data-label="비고">주세 72%</td>
          </tr>
          <tr>
            <td class="title">술(와인)</td>
            <td data-label="관세율">15%</td>
            <td data-label="특소세">-</td>
            <td data-label="교육세">10%</td>
            <td data-label="농특세">-</td>
            <td data-label="부가세">10%</td>
            <td data-label="비고">주세 30%</td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>
    <!-- Content  End -->

  </div>
  <!-- Informatio Use End-->
</div>
<!-- Container End -->

<!-- Footer -->
<%@ include file="../common_footer.jsp" %>

<script src="js/btn_ripple_effect.js"></script>
</body>

</html>