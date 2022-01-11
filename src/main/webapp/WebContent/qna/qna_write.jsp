<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="../common_header.jsp" %>

<!-- nav Script -->
<script>
    $(document).ready(function () {
        $("#breadcrumbs .dropbtn").click(function () {
            $("#breadcrumbs .dropdown-content").toggle(200);
            $("#breadcrumbs .select-area .caret").toggleClass("active");
        });
    });
</script>

<div class="container-notice">
    <div class="bar-title">
        <h2 class="title">1:1문의</h2>

        <!-- 사이트 이동경로를 만들어라! -->
        <nav id="breadcrumbs" class="dark">
            <ul class="nav-list">
                <li><a href="../index.html">Home</a></li>
                <li>고객센터</li>
                <li class="select-area">
                    <button class="dropbtn">1:1문의 <span class="bs-caret"><span class="caret"></span></span></button>
                    <div class="dropdown-content">
                        <a href="../notice/notice_list.html">공지사항</a>
                        <a href="../faq/faq_list.html">자주하는질문</a>
                        <a href="javascript:void(0)">1:1문의<span class="check"><i class="fas fa-check"></i></span></a>
                        <a href="../review/review_list.html">이용후기</a>
                        <a href="../event/event_list.html">이벤트</a>
                        <a href="../nodata/nodata_list.html">노데이터</a>
                        <a href="../clearance/clearance.html">통관조회</a>
                    </div>
                </li>
                <div class="clearfix"></div>
            </ul>
        </nav>
    </div>

    <form action="" name="board" method="post">
        <div class="dashboard margin-bottom-40">

            <div class="content">
                <ul class="dashboard-box-list">
                    <li>
                        <div class="submit-field margin-bottom-0">
                            <input type="text" name="t_title" class="with-border" placeholder="제목">
                        </div>
                        <div class="submit-field margin-bottom-0 margin-top-15">
                            <select class="with-border" name="t_category">
                                <option value=""> = 선택</option>
                                <option value="">입출고</option>
                                <option value="">결제</option>
                                <option value="">구매대행</option>
                                <option value="">반품,교환</option>
                                <option value="">통관</option>
                                <option value="">누락</option>
                                <option value="">노데이터</option>
                                <option value="">기타</option>
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
            <a href="javascript:void(0)" class="button ripple-effect" data-animation="ripple">
                등록
            </a>
            <a href="javascript:void(0)" onclick="setTimeout(function(){location.href='qna_list.html'}, 150)"
               class="button ripple-effect blue-line" data-animation="ripple">
                목록
            </a>
        </div>

    </form>
</div>

<script src="../js/btn_ripple_effect.js"></script>
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

<!-- Menu footer Start -->
<div id="footer">
    <!-- Menu information-use Start -->
    <div class="favorites-service">
        <div class="content">
            <ul>
                <li><div class="information-use"><a href="">이용안내</a></div></li>
                <li><div class="terms-of-use"><a href="">이용약관</a></div></li>
                <li><div class="privacy"><a href="">개인정보수집방침</a></div></li>
                <li><div class="service-center"><a href="">고객센터</a></div></li>
            </ul>
        </div>
    </div>
    <!-- Menu Information-use Start -->
    <div class="content01">
        <div class="deposit-account">
            <ul>
                <li><div class="deposit"><b>입금계좌 안내</b></div></li>
                <li><div class="wooribank"><img src="../images/woori_bank_logo_img.png" height="31px"></div></li>
                <li><div class="account-number">268-069109-02-001</div></li>
                <li><div class="corporation-jsh">예금주: 주식회사 제이에스에이치</div></li>
                <li><div class="applicable-exchange-rate">적용환율 : 우리은행-196 ㅣ 제비-206</div></li>
            </ul>
        </div>
    </div>
    <!-- Menu Information-use End -->

    <!-- Menu deposit-account Start -->
    <div class="content02">
        <div class="deposit-account">
            <ul>
                <li><div class="lg"><img src="../images/lg_logo_img.jpg" height="50px"></div></li>
                <li><div class="unipass"><img src="../images/uni_pass_logo_img.jpg" height="50px"></div></li>
                <li><div class="kcs"><img src="../images/k_c_s_logo_img.jpg" height="50px"></div></li>
                <li><div class="kcssa"><img src="../images/service_logo_img.png" height="50px"></div></li>
                <li><div class="kcsa"><img src="../images/k_c_s_a_logo_img.jpg" height="50px"></div></li>
                <li><div class="ksci"><img src="../images/k_s_c_i_logo_img.jpg" height="50px"></div></li>
            </ul>
        </div>
    </div>
    <!-- Menu deposit-account Start -->

    <!-- Menu Mutual Start -->
    <div class="content03">
        <div class="mutual">
            상호:(주)제이에스에이치 ㅣ 대표자명:정상현 ㅣ 대표번호:042-242-4412 ㅣ 개인정보관리책임자:김영인 ㅣ 이메일:jshbak@naver.com(문의불가)<br><br>
            사업자등록번호: 801-02-81520   통신판매업신고번호:2020-대전중구A-1028<br><br>
            소재지:대전시 중구 계룡로 825(용두동,희영빌딩)5층
        </div>
        <ul>
            <li><div class="jebi-logo"><img src="../images/logo.png" height="70px"></div></li>
        </ul>
    </div>
    <!-- Menu Mutual Start -->
</div>
<!-- Menu footer End -->
</body>
</html>