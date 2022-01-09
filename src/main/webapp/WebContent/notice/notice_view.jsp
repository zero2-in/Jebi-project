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
                    주문서 작성시 유의사항
                </h3>
                <!-- 입력자 정보! -->
                <div class="blog-post-info-list margin-bottom-20">
                    <span class="blog-post-info">
                        <i class="far fa-edit"></i> 관리자
                    </span>
                    <span class="blog-post-info">
                        <i class="far fa-calendar"></i> 2021-12-24 17:22
                    </span>
                    <span class="blog-post-info">
                        <i class="far fa-eye"></i> 130
                    </span>
                </div>

                <!-- 썸머노트 내용 필드 -->
                <div>
                    안녕하세요 제비 입니다:) <br/>
                    저희 제비 서비스를 이용하시기 전 꼭 아래 내용을 확인 부탁드립니다.<br/><br/>

                    1.주문서 작성 전 서비스 신청 유의사항을 필독해주세요. <br/>
                    2.평일 오전 11시까지 결제확인 완료된 주문건은 당일 출고됩니다. <br/>
                    (출고대기 상태의 주문서는 당일 출고되며 운송장번호 입력 후 출고완료로 변경됩니다.)<br/>
                    3.묶음/나눔배송, 주문서수정 신청은 주문건이 입고완료 되기전까지만 가능합니다. <br/>
                    (주문번호의 모든 상품이 입고완료 되기전에 묶음/나눔 요청을 완료해주세요.)<br/>
                    4.접수대기 상태를 이용하시면 주문서 수정이 원활합니다.<br/>
                    (이용안내 - 배송대행 신청서 작성법 하단의 내용을 확인해주세요.)<br/>
                    5.트래킹넘버를 정확히 입력하지 않으면 노데이터로 처리되며 입고확인이 지연됩니다.<br/>
                    (노데이터 비용이 트래킹번호당 500원 추가 청구됩니다.)<br/>
                    6.한개의 트래킹번호로 입고된 물건은 각기 다른 주문으로 나눔배송이 불가합니다.<br/>
                    7.운송사에서 지정한 무게,부피 초과 시 포장 사이즈 비용이 추가 청구됩니다. <br/>
                    (상세 금액은 비용 안내 -> 부가서비스 내용을 참고 바랍니다.)<br/>
                    8.택배사에서 택배운송 불가로 판단될 시 화물택배로 착불발송 됩니다. <br/>
                    택배접수 기사의 개인재량으로 기준이 명확하지 않은 점 주의바랍니다.<br/>
                    (세변의 합이 130cm이상, 한변의길이가 100cm이상, 총 무게 20kg 이상인 경우 등)<br/>
                </div>
            </div>
        </div>

        <!-- 목록 버튼 필드 -->
        <div class="button-field">
            <a href="javascript:void(0)" onclick="setTimeout(function() {location.href='notice_list.html';}, 200)" class="button ripple-effect blue-line" data-animation="ripple">
                목록
            </a>
        </div>

        <div class="prev-next-box">
            <div class="box-wrap">
                <ul class="post-nav margin-bottom-40">
                    <!-- 다음 글 -->
                    <li class="next-post">
                        <a href="javascript:void(0)">
                            <span>다음글</span>
                            <strong>주문서 작성시 유의사항</strong>
                        </a>
                    </li>
                    <!-- 이전 글 -->
                    <li class="prev-post">
                        <a href="javascript:void(0)">
                            <span>이전글</span>
                            <strong>9월 12일(일), 13(월) 항공출고건 지연안내</strong>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <%@ include file="../common_footer.jsp" %>

    <script src="js/btn_ripple_effect.js"></script>
</body>
</html>