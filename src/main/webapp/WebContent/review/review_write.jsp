<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../common_header.jsp" %>

<!-- 사이트 네비게이션 이름, 주소 표시 -->
<%@ include file="common_review.jsp" %>

<div class="container-notice">
    <div class="bar-title">
        <h2 class="title">이용후기</h2>

        <%@ include file="../breadcrumbs_cscenter.jsp" %>
    </div>

    <form action="" name="board" method="post">
        <div class="dashboard margin-bottom-40">

            <div class="content">
                <ul class="dashboard-box-list">
                    <li>
                        <div class="submit-field margin-bottom-0">
                            <input type="text" name="t_title" class="with-border" placeholder="제목">
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
            <a href="javascript:void(0)" onclick="setTimeout(function(){location.href='review_list.html'}, 150)"
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
