<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../common_header.jsp" %>


<link rel="stylesheet" href="../css/pricacy_statement.list.css">

!-- nav Script -->
<script>
    $(document).ready(function () {
        $("#breadcrumbs .dropbtn").click(function () {
            $("#breadcrumbs .dropdown-content").toggle(200);
            $("#breadcrumbs .select-area").toggleClass("active");
        });
    });
</script>

<!-- Container Start -->
<div id="container">
    <!-- cost-guide Start -->
    <div class="privacy-statement">
        <!-- Title / nav-list  Start -->
        <div class="privacy-statement-title"><p>개인정보 취급방침</p>
            <nav id="breadcrumbs" class="dark">
                <ul class="nav-list">
                    <li><a href="../index.html">Home</a></li>
                    <li>이용약관</li>
                    <li class="select-area">
                        <button class="dropbtn">회사소개<span class="bs-caret"><span class="caret"></span></span></button>
                        <div class="dropdown-content">
                            <a href="javascript:goSite('privacy_statement_list')">이용약관&nbsp;&nbsp;</span></a>
                            <a href="javascript:goSite('privacy_statement_list')">개인정보 취급방침<i class="fas fa-check"></i></a>
                        </div>
                    </li>
                </ul>
            </nav>
        </div>
        <!-- Title / nav-list  End -->

        <!-- Sub title  Start -->
        <div class="privacy-statement-sub-title">
            <div class="btn-privacy-statement">
                <a href="javascript:goSite('privacy_statement_list')"><div class="termsofuse">이용약관</div></a>
                <a href="javascript:goSite('privacy_statement_list')"><div class="privacystatement">개인정보 취급방침</div></a>
            </div>
        </div>
        <!-- Sub title  End -->

        <!-- Content  Start -->
        <div class="privacy-statement-content">
            <div class="privacy-statement-box">
                <p>제비(이하 "회사"라 함)은 아래와 같이 개인정보취급방침을 정하여 이용자 권익 보호에 최선을 다하고 있습니다.

                    본 개인정보취급방침은 당사가 본 웹사이트(site)에서 이용자의 정보를 수집 및 활용하는 방법과 범위를 알려 드리기 위한 내용을 담고 있습니다.

                    본 웹사이트를 이용하시거나 개인정보를 제출하시기 전에 아래 내용을 먼저 확인해 보시길 바랍니다.



                    수집하는 개인 정보의 항목 및 수집 방법



                    1. 회사는 회원가입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 시 이용자의 동의 하에 아래와 같은 정보를 필수항목으로 수집하고 있습니다.



                    1) 개인 회원



                    - 성명(국문, 영문), 아이디, 비밀번호, 이메일, 주소, 전화번호, 휴대폰번호, 생년월일



                    2) 사업자 회원



                    - 이름(개인 또는 법인명 국문, 영문), 아이디, 비밀번호, 이메일, 사업장소재지(국적 및 주소), 운영웹사이트 URL, 전화번호, 휴대폰번호, 생년월일(법인은 설립일)



                    2. 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.



                    - 쿠키, 서비스 이용 기록, 불량 이용 기록



                    3. 유료서비스 이용 시 아래와 같은 결제 정보들이 수집될 수 있습니다.



                    - 신용카드 결제시 : 카드사명, 카드소유자명, 카드번호, 유효기간 등



                    4. 개인정보 수집방법



                    회사는 다음과 같은 방법으로 개인정보를 수집합니다.



                    - 홈페이지, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청 등.



                    - 협력회사로부터의 제공



                    ▶ 개인정보의 수집 목적



                    1. 서비스 제공에 관한 계약 이행 및 요금정산



                    물품 배송, 본인인증, 구매 및 요금 결제, 요금 추심, 컨텐츠 제공, 맞춤 서비스 제공 등.



                    2. 회원관리



                    회원 개인 식별, 가입의사 확인, 회원 서비스 이용, 불량회원 사용방지, 비인가 사용방지, 가입횟수 제한, 분쟁 조정을



                    위한 기록보존, 민원처리, 관세등 각종 세금정보 및 통관 관련 정보 고지 등.



                    3. 마케팅ㆍ광고ㆍ통계에의 활용 및 신규 서비스 개발



                    통계학적 특성에 따른 서비스 제공 및 광고 게재, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 접속빈도 파악,



                    회원의 서비스이용에 각종 통계 조사 및 맞춤형 서비스 등 신규 서비스 개발.



                    개인정보 수집의 동의 회사는 귀하의 개인정보 수집에 대한 동의를 받고 있습니다. 귀하의 개인정보 수집과 관련하여 본 웹사이트의 개인정보취급방침 또는 이용약관의 내용에 대한 『동의』버튼 또는 『동의 안함』 버튼을 클릭할 수 있는 절차를 마련하고 있으며, 귀하가 『동의』버튼을 클릭하면 개인정보 수집에 대해 동의한 것으로 봅니다.



                    ▶개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항



                    회사는 귀하의 정보를 수시로 저장하고 찾아내는 ‘쿠키(cookie)’ 등을 운용합니다. 쿠키란 회사의 웹사이트를



                    운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에 저장됩니다. 회사는 다음과 같은 목적을 위해 쿠키를 사용합니다.



                    ▶ 쿠키 등 사용 목적



                    - 회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공



                    - 귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 귀하는 웹 브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.



                    ▶ 쿠키 설정 거부 방법



                    - 예: 쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.



                    *설정방법 예(인터넷 익스플로어의 경우): 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보



                    단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.







                    [개인정보의 공유 및 제공]



                    회사는 이용자들의 개인정보를 ‘개인정보의 수집목적’에서 고지한 범위내에서 사용하며, 이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 외부에 공개하지 않습니다. 다만, 이용자들이 사전에 공개에 동의 경우 및 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우는 예외로 합니다.



                    [개인정보의 보호]



                    회사는 이용자의 개인정보의 취급에 있어 분실, 도난, 누출, 변조 또는 훼손이 일어나지 않도록 각종 기술적/관리적 대책을 강구하고 있습니다. 다만, 비밀번호 등 주요 개인정보를 이용자 스스로가 관리를 허술하게 하여 분실, 도난, 누출 시켰을 경우 그 책임은 이용자에게 있으므로, 관리에 유의하시기 바랍니다.



                    [개인정보관리책임자 및 담당자의 연락처]



                    귀하께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자에게 신고하실 수 있습니다.



                    회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.



                    [개인정보 관리책임자]



                    - 이름 : 이기택



                    - 메일 : jikbak@naver.com

                </p>

            </div>
        </div>
        <!-- Content  End -->

    </div>
    <!-- cost-guide End-->
</div>
<!-- Container End -->
<!-- Menu footer Start -->
<div id="footer">
    <!-- Menu information-use Start -->
    <div class="informationuse">
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