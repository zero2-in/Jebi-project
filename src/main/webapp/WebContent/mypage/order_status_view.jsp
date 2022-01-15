<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="../common_header.jsp" %>

<%@ include file="common_order_status.jsp" %>

<div class="container-agent">
    <div class="bar-title">
        <h2 class="title">주문신청 현황</h2>

        <!-- 사이트 이동경로를 만들어라! -->
        <%@ include file="breadcrumbs_mypage.jsp" %>
    </div>

    <div class="margin-top-50"></div>
    <!-- Row -->
    <div class="row">
        <div class="col-xl-12 col-common">
            <div class="dashboard-box margin-top-0 margin-bottom-20">
                <!-- Headline -->
                <div class="headline">
                    <h3>
                        <i class="fas fa-angle-double-right"></i> 주문정보
                    </h3>
                </div>
                <div class="content with-padding">
                    <table class="basic-table">
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <td class="title">주문번호</td>
                            <td>
                                <span class="num bold">211001040</span>
                            </td>
                            <td class="title">진행상태</td>
                            <td>출고완료 (상품 : 입고완료)</td>
                        </tr>
                        <tr>
                            <td class="title">물류센터</td>
                            <td><img src="images/CN_flag.png" class="flag"> 중국 - 위해(항공)</td>
                            <td class="title">신청구분</td>
                            <td>배송대행 (출고 : 수동결제)</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- Row / End -->
    <!-- Row -->
    <div class="row">
        <div class="col-xl-12 col-common">
            <div class="dashboard-box margin-top-0">
                <!-- Headline -->
                <div class="headline">
                    <h3 class="fl">
                        <i class="fas fa-angle-double-right"></i> 받는 사람 정보
                    </h3>
                    <div class="headline-btn">

                    </div>
                </div>
                <div class="content with-padding">
                    <table class="basic-table">
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <td class="title">이름</td>
                            <td>김영인 / KIMYOUGNIN</td>
                            <td class="title">개인통관 정보</td>
                            <td>개인 : P210026755409(일치)</td>
                        </tr>
                        <tr>
                            <td class="title">연락처</td>
                            <td>01066456209</td>
                            <td class="title">주소</td>
                            <td>(35255) 대전광역시 서구 남선로 31-12(탄방동), 202호</td>
                        </tr>
                        <tr>
                            <td class="title">배송 요청사항</td>
                            <td colspan="3">배송 전 연락 바랍니다.</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- Row / End -->
    <!-- Row -->
    <div class="row">
        <div class="col-xl-12 col-common">
            <div class="dashboard-box">
                <!-- Headline -->
                <div class="headline">
                    <h3>
                        <i class="fas fa-angle-double-right"></i> 상품정보
                    </h3>
                </div>
                <div class="content">
                    <ul class="dashboard-box-list">
                        <li>
                            <div class="row">
                                <div class="col-auto col-common margin-top-2">
                                    <div class="avatar-wrapper-box">
                                        <div class="checkbox">
                                            <input type="checkbox" name="pro_no" id="PRO_NO_24354" value="24354">
                                            <label for="PRO_NO_24354">
                                                <span class="checkbox-icon"></span>
                                                순번: 1
                                            </label>
                                        </div>
                                        <div class="avatar-wrapper-img">
                                            <a href="javascript:void(0)">
                                                <img src="https://img.alicdn.com/imgextra/i4/3249253975/O1CN01GajNX91fEb3O8mCqG_!!3249253975.jpg_400x400.jpg" onerror="this.src='images/img-upload.png'" class="file-pic">
                                            </a>
                                        </div>
                                        <div class="btn-group"></div>
                                    </div>
                                </div>
                                <div class="col col-common">
                                    <div class="row">
                                        <div class="col-xl-12 col-common">
                                            <table class="basic-table">
                                                <colgroup>
                                                    <col width="20%">
                                                    <col width="*">
                                                </colgroup>
                                                <tbody>
                                                <tr>
                                                    <td class="title">트래킹번호</td>
                                                    <td> 75814908257353</td>
                                                </tr>
                                                <tr>
                                                    <td class="title">통관품목</td>
                                                    <td>[목록통관] 잡화 - 우산</td>
                                                </tr>
                                                <tr>
                                                    <td class="title">상품명</td>
                                                    <td>
                                                        <a href="https://item.taobao.com/item.htm?id=649362085937&_u=a20cmq4m0ib2cb#;" target="_blank">
                                                            Unbrella (Umbrella)
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="title">단가 * 수량</td>
                                                    <td>
                                                        <strong class="num">
                                                            ￥89.00&nbsp; * &nbsp;1  =  <span class="fc_red num">￥89.00</span>
                                                        </strong>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="title">색상/사이즈</td>
                                                    <td>希儿 / 【现货】</td>
                                                </tr>
                                                <tr>
                                                    <td class="title">옵션 추가정보</td>
                                                    <td>www.taobao.com</td>
                                                </tr>
                                                <tr>
                                                    <td class="title">입고상태</td>
                                                    <td>
                                                        <span class="fc_blue">(입고완료)</span>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- Row / End -->
    <!-- Row -->
    <div class="row">
        <!-- Dashboard Box 금액정보 -->
        <div class="col-xl-12 col-common">
            <div class="dashboard-box">
                <!-- Headline -->
                <div class="headline">
                    <h3>
                        <i class="fas fa-angle-double-right"></i> 금액정보
                    </h3>
                </div>
                <div class="content with-padding">
                    <table class="basic-table">
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <td class="title">트래킹수</td>
                            <td><strong class="num">1</strong> 개</td>
                            <td class="title">총 수량</td>
                            <td><strong class="num">1</strong> 개</td>
                        </tr>
                        <tr>
                            <td class="title">총금액</td>
                            <td><strong class="num fc_red">￥89.00</strong><span style="padding-left: 15px;">( USD 12.90 )</span></td>
                            <td class="title">통관구분</td>
                            <td>목록통관</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- Dashboard Box 결제정보 -->
        <div class="col-xl-12 col-common">
            <div class="dashboard-box">
                <!-- Headline -->
                <div class="headline">
                    <h3>
                        <i class="fas fa-angle-double-right"></i> 결제정보
                    </h3>
                </div>
                <div class="content with-padding">
                    <table class="basic-table">
                        <colgroup>
                            <col width="20%">
                            <col width="30%">
                            <col width="20%">
                            <col width="30%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <td class="title">국제 배송비용</td>
                            <td colspan="3">
                                - 총 결제 금액 : <strong class="num">￦3,000</strong> (결제완료) <br>
                                - 무게 : 1 kg ( 부피무게 : 0.01 kg ) <br>
                                - 배송비 : <span class="num">￦6,500</span><span>→</span> <span class="num">￦0</span> ( 쿠폰 할인 : ￦6,500 ) <br>
                                - 기본사진촬영 : ￦0 <br>
                                - 안전포장 : ￦3,000 <br>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- Row / End -->
    <!-- Row -->
    <div class="row">
        <!-- Dashboard Box 부가서비스 -->
        <div class="col-xl-12 col-common">
            <div class="dashboard-box">
                <!-- Headline -->
                <div class="headline">
                    <h3>
                        <i class="fas fa-angle-double-right"></i> 부가서비스
                    </h3>
                </div>
                <div class="content">
                    <ul class="dashboard-box-list">
                        <li>
                            <table class="basic-table">
                                <colgroup>
                                    <col width="20%">
                                    <col width="*">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <td class="title">예치금 자동결제</td>
                                    <td>
                                        <div class="radio">
                                            <input type="radio" name="svc_dvs_cd" id="SVC_DVS_CD_1" value="1" disabled>
                                            <label for="SVC_DVS_CD_1">
                                                <span class="radio-label"></span>
                                                자동결제
                                            </label>
                                        </div>
                                        <div class="radio">
                                            <input type="radio" name="svc_dvs_cd" id="SVC_DVS_CD_2" value="2" checked disabled>
                                            <label for="SVC_DVS_CD_2">
                                                <span class="radio-label"></span>
                                                수동결제
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="title">검수옵션</td>
                                    <td>
                                        <div class="checkbox">
                                            <input type="checkbox" name="charge_det_cd" id="CHARGE_DET_CD_7" value="7" disabled>
                                            <label for="CHARGE_DET_CD_7">
                                                <span class="checkbox-icon"></span>
                                                정밀검수
                                                <span class="fc_red">
                                                            (￦&nbsp;3000)
                                                        </span>
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <input type="checkbox" name="charge_det_cd" id="CHARGE_DET_CD_29" value="29" checked disabled>
                                            <label for="CHARGE_DET_CD_29">
                                                <span class="checkbox-icon"></span>
                                                기본사진촬영
                                                <span class="fc_red">
                                                            (￦&nbsp;0)
                                                        </span>
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <input type="checkbox" name="charge_det_cd" id="CHARGE_DET_CD_49" value="49" disabled>
                                            <label for="CHARGE_DET_CD_49">
                                                <span class="checkbox-icon"></span>
                                                사진추가
                                                <span class="fc_red">
                                                            (￦&nbsp;1000)
                                                        </span>
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="title">포장옵션</td>
                                    <td>
                                        <div class="checkbox">
                                            <input type="checkbox" name="charge_det_cd" id="CARGE_DET_CD_43" value="43" disabled>
                                            <label for="CHARGE_DET_CD_43">
                                                <span class="checkbox-icon"></span>
                                                폴리백 포장
                                                <span class="fc_red">(￦&nbsp;1000)</span>
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <input type="checkbox" name="charge_det_cd" id="CARGE_DET_CD_46" value="46" checked disabled>
                                            <label for="CHARGE_DET_CD_46">
                                                <span class="checkbox-icon"></span>
                                                안전포장
                                                <span class="fc_red">(￦&nbsp;3000)</span>
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="title">제거옵션</td>
                                    <td>
                                        <div class="checkbox">
                                            <input type="checkbox" name="charge_det_cd" id="CARGE_DET_CD_47" value="47" disabled>
                                            <label for="CHARGE_DET_CD_43">
                                                <span class="checkbox-icon"></span>
                                                박스제거
                                                <span class="fc_red">(￦&nbsp;0)</span>
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="title">통관옵션</td>
                                    <td>
                                        <div class="checkbox">
                                            <input type="checkbox" name="charge_det_cd" id="CARGE_DET_CD_38" value="38" disabled>
                                            <label for="CHARGE_DET_CD_43">
                                                <span class="checkbox-icon"></span>
                                                간이통관
                                                <span class="fc_red">(￦&nbsp;3300)</span>
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="title">기타옵션</td>
                                    <td>
                                        <div class="checkbox">
                                            <input type="checkbox" name="charge_det_cd" id="CARGE_DET_CD_9" value="9" disabled>
                                            <label for="CHARGE_DET_CD_9">
                                                <span class="checkbox-icon"></span>
                                                도서산간지역-제주도,울릉도,완도 등
                                                <span class="fc_red">(￦&nbsp;4000)</span>
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </li>
                        <li>
                            <table class="basic-table">
                                <colgroup>
                                    <col width="20%">
                                    <col width="*">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <td class="title">정밀검수 요청사항</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="title">사진추가 요청사항</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="title">물류센터 요청사항</td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- Row / End -->
    <!-- Row -->
    <div class="row">
        <div class="col-xl-12 col-common">
            <div class="dashboard-box">
                <!-- Headline -->
                <div class="headline">
                    <h3>
                        <i class="fas fa-angle-double-right"></i> 주문 문의
                    </h3>
                </div>
                <!-- Messages Container -->
                <div class="messages-container margin-top-0">
                    <div class="messages-container-inner">
                        <!-- Message Content -->
                        <div class="message-content">
                            <!-- Message Content Inner -->
                            <div class="message-content-inner">
                                <div class="message-time-sign">
                                    <span>2022-01-03</span>
                                </div>

                                <div class="row-clearfix">
                                    <div class="message-bubble me">
                                        <div class="message-bubble-inner">
                                            <div class="message-avatar">나</div>
                                            <div class="message-text">
                                                <p>결제했습니다~ 확인바랍니다.</p>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>

                                <div class="row-clearfix">
                                    <div class="message-bubble ">
                                        <div class="message-bubble-inner">
                                            <div class="message-avatar">관리자</div>
                                            <div class="message-text">
                                                <p></p>
                                                <div><br></div>
                                                <div>안녕하세요 고객님, 제비 입니다 ^^</div>
                                                <div><br></div>
                                                <div>무통장입금은 저희 고객센터가 운영되는 평일 오전 11시, 오후 3시에 일괄처리 됩니다~</div>
                                                <div><br></div>
                                                <div><div>오전 11시 이후 입금건이므로 해당 입금건은 조금 후 오후 3시에&nbsp;</div>
                                                    <div>처리될 예정이오니 조금더 시간양해부탁드립니다</div>
                                                </div>
                                                <div><br></div>
                                                <div>감사합니다.</div>
                                                <div><br></div>
                                                <div>.</div>
                                                <p></p>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- Message Content Inner / End -->
                            <!-- Reply Area -->
                            <form method="post" name="frmChat">
                                <div class="message-reply">
                                    <div id="summernote"></div>
                                </div>
                                <div class="col-xl-12 col-common tc margin-bottom-30">
                                    <button type="button" onclick="fn_Chat_I()" class="button ripple-effect" data-animation="ripple">
                                        주문문의 등록
                                    </button>
                                </div>
                            </form>
                            <!-- Reply Area / End -->
                        </div>
                        <!-- Message Content -->
                    </div>
                </div>
                <!-- Messages Container / End -->
            </div>
        </div>

        <div class="col-xl-12 col-common tc margin-top-30">
            <a href="javascript:void(0)" onclick="setTimeout(function(){location.href='OrderStatus'}, 200)" data-animation="ripple" class="button ripple-effect big blue-line">
                목록으로
            </a>
        </div>
    </div>
    <!-- Row / End -->
</div>

<%@ include file="../common_footer.jsp" %>

<script src="js/btn_ripple_effect.js"></script>
<script>
    $(document).ready(function () {
        $("#summernote").summernote({
            width: "100%",
            height: 330,
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

</body>
</html>