<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/layout.css">
    <script src="../js/common.js"></script>
    <script src="../js/jquery-3.6.0.min.js"></script>
    <title>제비 - 배송대행</title>
</head>
<body>
    <!-- Header Start -->
    <div id="header">
        <div class="btn-login">
            <ul class="menu-login">
                <li><a href="member/login.html">로그인</a></li>
                <li><a href="member/join.html">회원가입</a></li>
                <li><a href="notice/notice_list.html">고객센터</a></li>
            </ul>
        </div>

        <div class="img-logo">
            <a href="../index.html">
                <img src="../images/logo.png" height="100px">
            </a>
        </div>

        <div class="btn-menu">
            <ul class="menu-main">
                <li><a href="">이용안내</a></li>
                <li><a href="">비용안내</a></li>
                <li><a href="">배송대행</a></li>
                <li><a href="">구매대행</a></li>
                <li><a href="">고객센터</a></li>
                <li><a href="">마이페이지</a></li>
            </ul>
        </div>
        
    </div>
    <!-- Header End -->

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
            <h2 class="title">공지사항</h2>

            <!-- 사이트 이동경로를 만들어라! -->
            <nav id="breadcrumbs" class="dark">
                <ul class="nav-list">
                    <li><a href="../index.html">Home</a></li>
                    <li>고객센터</li>
                    <li class="select-area">
                        <button class="dropbtn">공지사항 <span class="bs-caret"><span class="caret"></span></span></button>
                        <div class="dropdown-content">
                            <a href="javascript:void(0)">공지사항<span class="check"><i class="fas fa-check"></i></span></a>
                            <a href="../faq/faq_list.html">자주하는질문</a>
                            <a href="../qna/qna_list.html">1:1문의</a>
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

    <script src="../js/btn_ripple_effect.js"></script>

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