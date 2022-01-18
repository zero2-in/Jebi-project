<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="../common_header.jsp" %>

<!-- nav Script -->
<script>
    $(document).ready(function () {
        $(".menu-main #purchaseAgent").addClass("active");
        $("#breadcrumbs .dropbtn").click(function () {
            $("#breadcrumbs .dropdown-content").toggle(200);
            $("#breadcrumbs .select-area .caret").toggleClass("active");
        });
    });
</script>

<div class="container-agent">
    <div class="bar-title">
        <h2 class="title">구매대행 신청</h2>

        <!-- 사이트 이동경로를 만들어라! -->
        <nav id="breadcrumbs" class="dark">
            <ul class="nav-list">
                <li><a href="/jebi">Home</a></li>
                <li>구매대행</li>
                <li class="select-area">
                    <button class="dropbtn">구매대행 신청 <span class="bs-caret"><span class="caret"></span></span></button>
                    <div class="dropdown-content">
                        <a href="javascript:void(0)">구매대행 신청<span class="check"><i class="fas fa-check"></i></span></a>
                    </div>
                </li>
                <div class="clearfix"></div>
            </ul>
        </nav>
    </div>

    <div class="margin-top-50"></div>
    <!-- 센터 정보 -->
    <div class="row">
        <div class="col-xl-12 col-common">
            <div class="dashboard-box margin-top-0 margin-bottom-20">
                <!-- 헤드라인 -->
                <div class="headline">
                    <h3>
                        <i class="fas fa-angle-double-right"></i>
                        물류센터 및 운송방식
                    </h3>
                </div>
                <div class="content">
                    <ul class="dashboard-box-list">
                        <li>
                            <div class="submit-field">
                                <h5><c:if test="${logi_center eq 'CN'}">위해</c:if> / <c:if test="${dlvr_way == 1}">항공</c:if><c:if test="${dlvr_way == 2}">해운</c:if></h5>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- 수취인 주소 -->
    <!-- Row -->
    <div class="row">
        <!-- Dashboard Box 받는 사람 정보 -->
        <div class="col-xl-12 col-common">
            <div class="dashboard-box margin-top-0">
                <!-- 헤드라인 -->
                <div class="headline">
                    <h3 class="fl">
                        <i class="fas fa-angle-double-right"></i>
                        받는 사람 정보
                    </h3>
                    <div class="headline-btn">
                        <a href="#small-dialog" data-animation="ripple" class="popup-with-zoom-anim button blue-line ripple-effect">
                            <i class="fas fa-home"></i>
                            주소록
                        </a>
                    </div>
                </div>
                <div class="content">
                    <ul class="dashboard-box-list">

                        <li>
                            <div class="row">
                                <div class="col-xl-6 col-common">

                                    <div class="submit-field field-two">
                                        <h5>받는 사람</h5>
                                        <!-- 한글 이름 -->
                                        <div class="field-block fl">
                                            <input type="text" name="t_kor_name" id="" maxlength="80" placeholder="한글" value="홍길동" class="with-border ">
                                        </div>
                                        <!-- 영문 이름 -->
                                        <div class="field-block fr">
                                            <input type="text" name="t_eng_name" id="" maxlength="80" placeholder="영문" value="HONGGILDONG" class="with-border ">
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>

                                    <div class="submit-field">
                                        <div class="radio-area margin-bottom-10">
                                            <!-- 개인: 1, 사업자: 2 라디오버튼 : ctms_dvs -->
                                            <div class="radio">
                                                <input type="radio" name="ctms_dvs" id="CTMS_DVS_P" value="1" checked>
                                                <label for="CTMS_DVS_P">
                                                    <span class="radio-label"></span>
                                                    개인
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <input type="radio" name="ctms_dvs" id="CTMS_DVS_B" value="2">
                                                <label for="CTMS_DVS_B">
                                                    <span class="radio-label"></span>
                                                    사업자
                                                </label>
                                            </div>
                                        </div>
                                        <div>
                                            <!-- 개인통관보유부호 : person_ctms_no -->
                                            <input type="text" name="person_ctms_no" maxlength="20" value="P210000000000" class="with-border ">
                                        </div>
                                    </div>
                                    <div class="submit-field">
                                        <div class="input-with-icon-left">
                                            <i class="fas fa-phone"></i>
                                            <input type="text" name="t_mobile" class="input-text with-border " maxlength="20" placeholder="휴대전화" value="01012345678">
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xl-6 col-common">
                                    <div class="submit-field">
                                        <!-- 주소 입력 필드 -->
                                        <h5>주소</h5>
                                        <input type="text" name="t_zip" maxlength="5" placeholder="우편번호" class="with-border wd100 fl margin-right-10 gray-read" value="34856" readonly>
                                        <a href="#samll-dialog" data-animation="ripple" class="popup-with-zoom-anim button gray ripple-effect fl">우편번호 검색</a>
                                        <div class="clearfix"></div>
                                        <input type="text" name="t_address_1" placeholder="주소" value="대전광역시 중구 계룡로 825(용두동)" class="with-border margin-top-10 gray-read">
                                        <input type="text" name="t_address_2" class="with-border margin-top-10" value="5층 505호">

                                        <!-- 설명란 -->
                                        <div class="tip-text margin-top-10">
                                            <span>*</span>
                                            도로명 주소를 써주십시오.
                                            <br>
                                            지번 주소 기재 시 통관/세관에서 오류로 분류시켜 통관지연이 될 수 있습니다.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>

                        <li>
                            <div class="row">
                                <div class="col-xl-6 col-common">
                                    <div class="submit-field">
                                        <h5>배송 요청사항 선택</h5>
                                        <div class="btn-group bootstrap-select with-border">
                                            <select name="" class="btn dropdown-toggle bs-placeholder btn-default">
                                                <option value=""> = 직접기재</option>
                                                <option value="">배송 전 연락 바랍니다</option>
                                                <option value="">부재시 휴대폰으로 연락주세요</option>
                                                <option value="">부재시 경비실에 맡겨주세요</option>
                                                <option value="">부재시 집앞에 놔주세요</option>
                                                <option value="">택배함에 맡겨주세요</option>
                                            </select>
                                        </div>
                                        <div class="tip-text margin-top-10">
                                            <span>*</span>
                                            국내 배송기사 분께 전달하고자 하는 요청사항을 남겨주세요
                                            (예: 부재 시 휴대폰으로 연락주세요)
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xl-6 col-common">
                                    <div class="submit-field">
                                        <h5>배송 요청사항 직접기재</h5>
                                        <input type="text" name="dlvr_req" maxlength="100" class="with-border">
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
    <!-- 상품정보 -->
    <!-- Row -->
    <div class="row">
        <div class="col-xl-12 col-common">
            <div class="dashboard-box">
                <!-- 헤드라인 -->
                <div class="headline">
                    <h3>
                        <i class="fas fa-angle-double-right"></i>
                        상품정보 입력
                    </h3>
                </div>
                <div class="content">
                    <ul class="dashboard-box-list">
                        <li>
                            <div class="row">
                                <div class="col-xl-12 col-common">
                                    <div class="submit-field mbw100">
                                        <h5 class="point fl margin-bottom-5">
                                            <span>상품</span>
                                            <span class="num">1</span>
                                            <span class="s_txt tc_red">* 적색 테두리 필수항목</span>
                                        </h5>
                                        <!-- Buttons -->
                                        <div class="fr margin-bottom-5">
                                            <a href="javascript:void(0)" data-animation="ripple" class="button gray ripple-effect ico margin-bottom-5">
                                                <i class="far fa-copy"></i>
                                            </a>
                                            <a href="javascript:void(0)" data-animation="ripple" class="button gray ripple-effect ico margin-bottom-5">
                                                <i class="far fa-plus-square"></i>
                                            </a>
                                            <a href="javascript:void(0)" data-animation="ripple" class="button gray ripple-effect ico margin-bottom-5">
                                                <i class="far fa-trash-alt"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-auto col-common margin-top-2">
                                    <!-- 사진 업로드 -->
                                    <div class="avatar-wrapper">
                                        <img src="../images/img-upload.png" onerror="this.src='../images/img-upload.png'" alt class="file-pic">
                                    </div>
                                    <!-- 업로드 버튼 -->
                                    <div class="wrp-ImgUpBtn tc">
                                        <input type="file" name="t_img_up" accept="image/*" class="file-upload">
                                        <a href="javascript:void(0)" data-animation="ripple" class="img-up button ripple-effect margin-bottom-5">
                                            이미지 업로드
                                        </a>
                                    </div>
                                </div>

                                <div class="col col-common">
                                    <div class="row">
                                        <!-- 통관품목 검색 -->
                                        <div class="col-xl-6 col-common">
                                            <div class="submit-field">
                                                <input type="text" name="" class="with-border" maxlength="40" placeholder="통관품목 검색">
                                                <!-- TODO 나중에 추가해야 할 리스트 -->
                                                <ul class="dropdown-menu"></ul>
                                            </div>
                                        </div>
                                        <!-- 통관품목 선택 -->
                                        <div class="col-xl-6 col-common">
                                            <div class="submit-field point-border">
                                                <div class="btn-group bootstrap-select with-border necessary">
                                                    <!-- TODO 나중에 DB로 추가하세요~ -->
                                                    <select name="t_item_seq" class="btn">
                                                        <option value=""> = 통관품목 선택</option>
                                                        <option value="">[목록통관] 가구/조명 - 커튼</option>
                                                        <option value="">[목록통관] 디지털/공구 - 건전지</option>
                                                        <option value="">[일반통관] 등등...</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 상품명 (영문) -->
                                        <div class="col-xl-12 col-common">
                                            <div class="submit-field">
                                                <input type="text" name="" maxlength="100" placeholder="상품명 영문" class="with-border necessary">
                                                <div class="tip-text margin-top-10">
                                                    <span>*</span>
                                                    정확한 작성을 해주셔야 통관지연을 막을 수 있습니다. (특수문자, 한글 입력 금지)
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 수량, 합계 -->
                                        <div class="col-xl-6 col-common">
                                            <div class="submit-field field-two">
                                                <div class="field-block fl">
                                                    <input type="text" name="t_quantity" placeholder="수량" maxlength="6" value="1" class="with-border necessary tr">
                                                    <span class="stxt">
                                                            수량
                                                        </span>
                                                </div>
                                                <div class="field-block fr">
                                                    <input type="text" name="t_amount" value="0" placeholder="합계" class="with-border necessary tr">
                                                    <span class="stxt">&nbsp; 합계(￥)</span>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                        <!-- 색상, 사이즈 -->
                                        <div class="col-xl-6 col-common">
                                            <div class="submit-field field-two">
                                                <div class="field-block fl">
                                                    <input type="text" name="t_color" maxlength="100" placeholder="색상" class="with-border necessary">
                                                </div>
                                                <div class="field-block fr">
                                                    <input type="text" name="t_size" maxlength="100" placeholder="사이즈" class="with-border necessary">
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                        <!-- 옵션 추가정보 -->
                                        <div class="col-xl-6 col-common">
                                            <div class="submit-field">
                                                <input type="text" name="t_shop_site" maxlength="100" placeholder="옵션 추가정보" class="with-border">
                                            </div>
                                        </div>
                                        <!-- 브랜드 -->
                                        <div class="col-xl-6 col-common">
                                            <div class="submit-field">
                                                <input type="text" name="t_brand" placeholder="브랜드" maxlength="40" class="with-border">
                                            </div>
                                        </div>
                                        <!-- 상품 URL -->
                                        <div class="col-xl-6 col-common">
                                            <div class="submit-field">
                                                <input type="text" name="t_shop_url" maxlength="500" placeholder="상품URL" class="with-border necessary">
                                            </div>
                                        </div>
                                        <!-- 이미지 URL -->
                                        <div class="col-xl-6 col-common">
                                            <div class="submit-field">
                                                <input type="text" name="t_img_url" placeholder="이미지URL" maxlength="500" class="with-border necessary">
                                            </div>
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
                <!-- 헤드라인 -->
                <div class="headline">
                    <h3>
                        <i class="fas fa-angle-double-right"></i>
                        금액정보 입력
                    </h3>
                </div>
                <div class="content">
                    <ul class="dashboard-box-list">
                        <li>
                            <div class="row">
                                <!-- 총 수량 -->
                                <div class="col-xl-4 col-common">
                                    <div class="submit-field">
                                        <input type="text" name="t_total_quantity" maxlength="8" value="1" class="with-border fc_red bold tr gray-read" readonly>
                                        <span class="stxt">총 수량</span>
                                    </div>
                                </div>
                                <!-- 총 금액 ￥ -->
                                <div class="col-xl-4 col-common">
                                    <div class="submit-field">
                                        <input type="text" name="t_total_cost" maxlength="12" value="0.00" class="with-border fc_red bold tr gray-read" readonly>
                                        <span class="stxt">총 금액 ￥</span>
                                    </div>
                                </div>
                                <!-- 총 금액 $ -->
                                <div class="col-xl-4 col-common">
                                    <div class="submit-field">
                                        <input type="text" name="t_total_cost_usd" maxlength="12" value="0.00" class="with-border fc_red bold tr gray-read" readonly>
                                        <span class="stxt">총 금액 $</span>
                                    </div>
                                </div>
                                <!-- 주의사항 안내문구 -->
                                <div class="col-xl-8 col-common">
                                    <div class="tip-text">
                                        <span>*</span>
                                        세관에 신고되는 금액 입니다 (쇼핑몰 금액과 동일)
                                        <br>
                                        <span>*</span>
                                        총금액이 미화 150달러 이상인경우, 간이통관으로 진행되며 간이통관비용, 관세 등이 부과됩니다.
                                        <br>
                                        <span>*</span>
                                        목록통관 불가 품목(식품, 액체, 분말 등)은 간이통관으로 진행됩니다. (세관 적발시 책임지지 않으니 주의하시기 바랍니다.)
                                    </div>
                                </div>
                                <!-- 통관 인디케이터 -->
                                <div class="col-xl-4 col-common">
                                    <div class="submit-field">
                                        <div class="field-block">
                                            <div class="notification error tc">
                                                <p>목록통관</p>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
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
        <!-- Dashboard Box 부가서비스 -->
        <div class="col-xl-12 col-common">
            <!-- 상품정보 -->
            <div class="dashboard-box">
                <!-- 헤드라인 -->
                <div class="headline">
                    <h3>
                        <i class="fas fa-angle-double-right"></i>
                        부가서비스
                    </h3>
                </div>
                <div class="content">
                    <ul class="dashboard-box-list">
                        <li>
                            <table class="basic-table">
                                <colgroup>
                                    <col width="15%">
                                    <col width="*">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <td class="title">예치금 자동결제</td>
                                    <td>
                                        <!-- 자동결제 -->
                                        <div class="radio">
                                            <input type="radio" name="svc_dvs" id="AUTO_SVC" value="1">
                                            <label for="AUTO_SVC">
                                                <span class="radio-label"></span>
                                                자동결제
                                            </label>
                                        </div>
                                        <!-- 수동결제 -->
                                        <div class="radio">
                                            <input type="radio" name="svc_dvs" id="MANUAL_SVC" value="2" checked>
                                            <label for="MANUAL_SVC">
                                                <span class="radio-label"></span>
                                                수동결제
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="title">검수옵션</td>
                                    <td>
                                        <div class="checkbox-area">
                                            <!-- 정밀검수 -->
                                            <div class="checkbox">
                                                <input type="checkbox" name="detail_insp" id="DETAIL_INSP" value="detail">
                                                <label for="DETAIL_INSP">
                                                    <span class="checkbox-icon"></span>
                                                    정밀검수
                                                    <span class="fc_red">(￦3,000)</span>
                                                </label>
                                            </div>
                                            <!-- 기본사진촬영 -->
                                            <div class="checkbox">
                                                <input type="checkbox" name="default_pic" id="DEFAULT_PIC" value="default">
                                                <label for="DEFAULT_PIC">
                                                    <span class="checkbox-icon"></span>
                                                    기본사진촬영
                                                    <span class="fc_red">(￦0)</span>
                                                </label>
                                            </div>
                                            <!-- 사진 추가 -->
                                            <div class="checkbox">
                                                <input type="checkbox" name="add_pic" id="ADD_PIC" value="more">
                                                <label for="ADD_PIC">
                                                    <span class="checkbox-icon"></span>
                                                    사진추가
                                                    <span class="fc_red">(￦1,000)</span>
                                                </label>
                                            </div>
                                            <div class="col col-common">
                                                <div class="row">
                                                    <!-- 정밀검수요청사항 -->
                                                    <div class="col-xl-6 col-common">
                                                        <div class="submit-field">
                                                            <input type="text" name="insp_req" maxlength="500" placeholder="정밀검수요청사항(사진추가제공X)" class="with-border">
                                                        </div>
                                                    </div>
                                                    <!-- 사진추가 요청사항 -->
                                                    <div class="col-xl-6 col-common">
                                                        <div class="submit-field">
                                                            <input type="text" name="photo_req" maxlength="500" placeholder="사진추가 요청사항(대상트래킹번호+요청내용 기재필수)" class="with-border">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <span class="fc_red">*정밀검수/사진추가 선택시 요청내용에 따라 추가비용이 발생할 수 있습니다.</span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="title">포장옵션</td>
                                    <td>
                                        <div class="checkbox-area">
                                            <!-- 폴리백 포장 -->
                                            <div class="checkbox">
                                                <input type="checkbox" name="poly_bag" id="POLY_BAG" value="poly">
                                                <label for="POLY_BAG">
                                                    <span class="checkbox-icon"></span>
                                                    폴리백 포장
                                                    <span class="fc_red">(￦1,000)</span>
                                                </label>
                                            </div>
                                            <!-- 안전포장 -->
                                            <div class="checkbox">
                                                <input type="checkbox" name="safety_bag" id="SAFETY_BAG" value="safety">
                                                <label for="SAFETY_BAG">
                                                    <span class="checkbox-icon"></span>
                                                    안전포장
                                                    <span class="fc_red">(￦3,000)</span>
                                                </label>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="title">제거옵션</td>
                                    <td>
                                        <div class="checkbox-area">
                                            <div class="checkbox">
                                                <input type="checkbox" name="remove_box" id="REMOVE_BOX" value="box_remove">
                                                <label for="REMOVE_BOX">
                                                    <span class="checkbox-icon"></span>
                                                    박스제거
                                                    <span class="fc_red">(￦0)</span>
                                                </label>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="title">통관옵션</td>
                                    <td>
                                        <div class="checkbox-area">
                                            <div class="checkbox">
                                                <input type="checkbox" name="simple_clearance" id="SIMPLE_CLEARANCE" value="simple_cl">
                                                <label for="SIMPLE_CLEARANCE">
                                                    <span class="checkbox-icon"></span>
                                                    간이통관
                                                    <span class="fc_red">(￦3,300)</span>
                                                </label>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="title">기타옵션</td>
                                    <td>
                                        <div class="checkbox-area">
                                            <div class="checkbox">
                                                <input type="checkbox" name="island_mountain" id="ISLAND_MOUNTAIN" value="mountain_area">
                                                <label for="ISLAND_MOUNTAIN">
                                                    <span class="checkbox-icon"></span>
                                                    도서산간지역-제주도,울릉도,완도 등
                                                    <span class="fc_red">(￦4,000)</span>
                                                </label>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </li>
                        <li>
                            <div class="submit-field">
                                <h5>물류센터 요청사항</h5>
                                <input type="text" name="center_req" maxlength="100" class="with-border">
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="notification error margin-top-20 pd20">
                <p>
                    구매견적을 신청 하신 후 견적이 완료되면 수정이 불가합니다.
                    <br>

                    (구매견적을 완료하신 후에 부득이한 사유로 요청서 수정이 필요한 경우에는 1:1문의를 주세요)

                </p>
            </div>
        </div>
        <div class="col-xl-12 col-common tc margin-top-30">
            <a href="javascript:void(0)" data-animation="ripple" class="button ripple-effect big">
                구매견적
            </a>
        </div>
    </div>
    <!-- Row / End -->
</div>

<%@ include file="../common_footer.jsp" %>

<script src="js/btn_ripple_effect.js"></script>
<script>
    $(document).ready(function () {
        $(".wrp-ImgUpBtn .img-up").click(function() {
            $(this).prev(".file-upload").click();
        });
    });
</script>
</body>
</html>