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
                                <span class="num bold">${dto.getOrder_no()}</span>
                            </td>
                            <td class="title">진행상태</td>
                            <td>${dto.getStatus_name()} (상품 : 입고대기)</td>
                        </tr>
                        <tr>
                            <td class="title">물류센터</td>
                            <td><img src="images/CN_flag.png" class="flag"> 중국 - 위해(<c:if test="${dto.getDlvr_method() eq 'plane'}">항공</c:if><c:if test="${dto.getDlvr_method() eq 'ship'}">해운</c:if>)</td>
                            <td class="title">신청구분</td>
                            <td>${dto.getAgent_type()} <c:if test="${dto.getSvc_dvs() eq 'auto'}">(출고 : 자동결제)</c:if>
                                <c:if test="${dto.getSvc_dvs() eq 'manual'}">(출고 : 수동결제)</c:if></td>
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
                            <td>${dto.getReg_kor_name()} / ${dto.getReg_eng_name()}</td>
                            <td class="title">개인통관 정보</td>
                            <td>개인 : ${dto.getPerson_ctms_no()}(일치)</td>
                        </tr>
                        <tr>
                            <td class="title">연락처</td>
                            <td>${dto.getReg_mob_no()}</td>
                            <td class="title">주소</td>
                            <td>(${dto.getCons_zip()}) ${dto.getCons_addr()}, ${dto.getCons_addr_det()}</td>
                        </tr>
                        <tr>
                            <td class="title">배송 요청사항</td>
                            <td colspan="3">${dto.getDlvr_req()}</td>
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
                                                <img src="${dto.getItem_img_url()}" onerror="this.src='images/img-upload.png'" class="file-pic">
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
                                                    <td> ${dto.getTracking_no()}</td>
                                                </tr>
                                                <tr>
                                                    <td class="title">통관품목</td>
                                                    <td>[${dto.getClearance()}] ${dto.getClearance_category()} - ${dto.getClearance_name()}</td>
                                                </tr>
                                                <tr>
                                                    <td class="title">상품명</td>
                                                    <td>
                                                        <a href="${dto.getItem_url()}" target="_blank">
                                                            ${dto.getItem_eng_name()} (${dto.getItem_eng_name()})
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="title">단가 * 수량</td>
                                                    <td>
                                                        <strong class="num">
                                                            ￥${dto.getMoney_yuan()}&nbsp; * &nbsp;${dto.getQuantity()}  =  <span class="fc_red num">￥<fmt:formatNumber type="pattern" value="${dto.getMoney_yuan() * dto.getQuantity()}" pattern="0.00"/></span>
                                                        </strong>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="title">색상/사이즈</td>
                                                    <td>${dto.getItem_color()} / ${dto.getItem_size()}</td>
                                                </tr>
                                                <tr>
                                                    <td class="title">옵션 추가정보</td>
                                                    <td>${dto.getItem_more_info()}</td>
                                                </tr>
                                                <tr>
                                                    <td class="title">입고상태</td>
                                                    <td>
                                                        <span class="fc_blue">(입고대기)</span>
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
                            <td><strong class="num">${dto.getQuantity()}</strong> 개</td>
                            <td class="title">총 수량</td>
                            <td><strong class="num">${dto.getQuantity()}</strong> 개</td>
                        </tr>
                        <tr>
                            <td class="title">총금액</td>
                            <td><strong class="num fc_red">￥<fmt:formatNumber pattern="0.00" value="${dto.getTotal_money_yuan()}" type="pattern" /></strong><span style="padding-left: 15px;">( USD <fmt:formatNumber pattern="0.00" type="pattern" value="${dto.getTotal_money_dollor()}" /> )</span></td>
                            <td class="title">통관구분</td>
                            <td>${dto.getClearance()}</td>
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
                                            <input type="radio" name="svc_dvs_cd" id="SVC_DVS_CD_1" <c:if test="${dto.getSvc_dvs() eq 'auto'}">checked</c:if> disabled>
                                            <label for="SVC_DVS_CD_1">
                                                <span class="radio-label"></span>
                                                자동결제
                                            </label>
                                        </div>
                                        <div class="radio">
                                            <input type="radio" name="svc_dvs_cd" id="SVC_DVS_CD_2" value="2" <c:if test="${dto.getSvc_dvs() eq 'manual'}">checked</c:if> disabled>
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
                                            <input type="checkbox" name="charge_det_cd" id="CHARGE_DET_CD_7" <c:if test="${dto.getDetail_insp() eq 'Y'}">checked</c:if> disabled>
                                            <label for="CHARGE_DET_CD_7">
                                                <span class="checkbox-icon"></span>
                                                정밀검수
                                                <span class="fc_red">
                                                            (￦&nbsp;3000)
                                                        </span>
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <input type="checkbox" name="charge_det_cd" id="CHARGE_DET_CD_29" <c:if test="${dto.getDefault_pic() eq 'Y'}">checked</c:if> disabled>
                                            <label for="CHARGE_DET_CD_29">
                                                <span class="checkbox-icon"></span>
                                                기본사진촬영
                                                <span class="fc_red">
                                                            (￦&nbsp;0)
                                                        </span>
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <input type="checkbox" name="charge_det_cd" id="CHARGE_DET_CD_49" <c:if test="${dto.getAdd_pic() eq 'Y'}">checked</c:if> disabled>
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
                                            <input type="checkbox" name="charge_det_cd" id="CHARGE_DET_CD_43" <c:if test="${dto.getPoly_bag() eq 'Y'}">checked</c:if> disabled>
                                            <label for="CHARGE_DET_CD_43">
                                                <span class="checkbox-icon"></span>
                                                폴리백 포장
                                                <span class="fc_red">(￦&nbsp;1000)</span>
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <input type="checkbox" name="charge_det_cd" id="CHARGE_DET_CD_46" <c:if test="${dto.getSafety_bag() eq 'Y'}">checked</c:if> disabled>
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
                                            <input type="checkbox" name="charge_det_cd" id="CHARGE_DET_CD_47" <c:if test="${dto.getRemove_box() eq 'Y'}">checked</c:if> disabled>
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
                                            <input type="checkbox" name="charge_det_cd" id="CHARGE_DET_CD_38" <c:if test="${dto.getSimple_clearance() eq 'Y'}">checked</c:if> disabled>
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
                                            <input type="checkbox" name="charge_det_cd" id="CHARGE_DET_CD_9" <c:if test="${dto.getIsland_mountain() eq 'Y'}">checked</c:if> disabled>
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
                                    <td>${dto.getInsp_req()}</td>
                                </tr>
                                <tr>
                                    <td class="title">사진추가 요청사항</td>
                                    <td>${dto.getPhoto_req()}</td>
                                </tr>
                                <tr>
                                    <td class="title">물류센터 요청사항</td>
                                    <td>${dto.getCenter_req()}</td>
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
                                <c:forEach items="${replydatelist}" var="datelist">
                                    <div class="message-time-sign">
                                        <span>${datelist.getComment_reg_date()}</span>
                                    </div>
                                    <c:set var="table_no" value="${datelist.getTable_no()}" />
                                    <c:set var="reg_date" value="${datelist.getComment_reg_date()}"/>
                                    <c:forEach items="${dao.getOrderReply(table_no, reg_date)}" var="list">
                                            <div class="row-clearfix">
                                                <div class="message-bubble <c:if test='${list.getComment_reg_id() eq session_id}'>me</c:if>">
                                                    <div class="message-bubble-inner">
                                                        <div class="message-avatar"><c:if test='${list.getComment_reg_id() eq session_id}'>나</c:if><c:if test='${list.getComment_reg_id() ne session_id}'>${list.getComment_reg_name()}</c:if></div>
                                                        <div class="message-text">
                                                            ${list.getComment_content()}
                                                        </div>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                    </c:forEach>
                                </c:forEach>

                            </div>
                            <!-- Message Content Inner / End -->
                            <!-- Reply Area -->
                            <form method="post" name="frmChat">
                                <div class="message-reply">
                                    <div id="summernote"></div>
                                    <input type="hidden" name="reply_content">
                                </div>
                                <div class="col-xl-12 col-common tc margin-bottom-30">
                                    <button type="button" onclick="fn_Chat_I()" class="button ripple-effect" data-animation="ripple">
                                        <c:if test="${session_level eq 'top'}">
                                            답글 등록
                                        </c:if>
                                        <c:if test="${session_level ne 'top'}">
                                            주문문의 등록
                                        </c:if>
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
<script>
    function fn_Chat_I() {
        var snoteContent = $("#summernote").summernote('code');
        frmChat.reply_content.value = snoteContent;
        if(checkValue(frmChat.reply_content, "글을 작성하세요!")) return;

        if(confirm("글을 등록하시겠습니까?")) {
            $.ajax({
               method: 'post',
                async: false,
               url: 'OrderDoReply',
               data: 'reply_content='+frmChat.reply_content.value+'&table_no=${dto.getTable_no()}',
                success: function(data) {
                    if(data.trim() == 'success') {
                        location.reload();
                    } else {
                        console.log(data);
                    }
                }
            });
        }
    }
</script>
</body>
</html>