<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="../common_header.jsp" %>

<c:if test="${empty session_name}">
    <script>
        alert("로그인 후 이용이 가능합니다.");
        location.href="Member";
    </script>
</c:if>

    <%@ include file="common_qna.jsp" %>

    <div class="container-notice">
        <div class="bar-title">
            <h2 class="title">1:1문의</h2>

            <!-- 사이트 이동경로를 만들어라! -->
            <%@ include file="../breadcrumbs_cscenter.jsp" %>
        </div>

        <div class="dashboard">
            <div class="search-con">
                <div class="row">
                    <!-- 검색 폼! -->
                    <form action="Qna" method="post" name="search">
                        <div class="search">
                            <input type="text" name="s" class="search-text" placeholder="제목">
                            <button type="button" class="search-btn ripple-effect" data-animation="ripple">
                                검색 <i class="fas fa-search"></i>
                            </button>
                            <button type="button" class="ripple-effect button blue-line" onclick="setTimeout(function() { location.href='qna_write.html'}, 150)" data-animation="ripple">
                                글쓰기
                            </button>
                            <c:if test="${session_level eq 'top'}">
                                <button type="button" class="ripple-effect button blue-line" onclick="setTimeout(function() { location.href='qna_write.html'}, 150)" data-animation="ripple">
                                    공지등록
                                </button>
                            </c:if>
                        </div>
                    </form>

                </div>
            </div>

            <div class="category-tab-area">
                <div class="category-tab">
                    <div class="category-tab-link active">
                        <a href="javascript:void(0)">
                            전체
                        </a>
                    </div>
                    <div class="category-tab-link">
                        <a href="javascript:void(0)">
                            입출고
                        </a>
                    </div>
                    <div class="category-tab-link">
                        <a href="javascript:void(0)">
                            결제
                        </a>
                    </div>
                    <div class="category-tab-link">
                        <a href="javascript:void(0)">
                            구매대행
                        </a>
                    </div>
                    <div class="category-tab-link">
                        <a href="javascript:void(0)">
                            반품,교환
                        </a>
                    </div>
                    <div class="category-tab-link">
                        <a href="javascript:void(0)">
                            통관
                        </a>
                    </div>
                    <div class="category-tab-link">
                        <a href="javascript:void(0)">
                            누락
                        </a>
                    </div>
                    <div class="category-tab-link">
                        <a href="javascript:void(0)">
                            노데이터
                        </a>
                    </div>
                    <div class="category-tab-link">
                        <a href="javascript:void(0)">
                            기타
                        </a>
                    </div>
                </div>
            </div>

            <div class="content">
                <ul class="board">
                    <!-- List Block -->
                    <li class="row">
                        <div class="board-listing">
                            <!-- No -->
                            <div class="list-no">
                                <strong class="important">공지</strong>
                            </div>
                            <!-- Title -->
                            <h3 class="board-title">
                                <a href="qna_view.jsp"><span class="gray">[기타]</span> <b class="important">★문의글 등록 전 꼭 확인해주세요★</b></a>
                                <span class="status-button">new</span>
                            </h3>
                            <!-- Writter, Reg Date, Hit -->
                            <div class="board-footer">
                                <ul class="fl">
                                    <li><i class="far fa-edit"></i> 관리자</li>
                                    <li><i class="far fa-calendar"></i> 2021-12-28 16:53</li>
                                    <li><i class="far fa-eye"></i> 1,516</li>
                                </ul>
                            </div>
                        </div>
                    </li>

                    <li class="row">
                        <div class="board-listing">
                            <!-- No -->
                            <div class="list-no">
                                <strong class="important">공지</strong>
                            </div>
                            <!-- Title -->
                            <h3 class="board-title">
                                <a href="qna_view.jsp"><span class="gray">[기타]</span> <b style="color: #78148c">문의사항은 작성자만 볼 수 있습니다.</b></a>
                                <span class="status-button">new</span>
                            </h3>
                            <!-- Writter, Reg Date, Hit -->
                            <div class="board-footer">
                                <ul class="fl">
                                    <li><i class="far fa-edit"></i> 관리자</li>
                                    <li><i class="far fa-calendar"></i> 2021-12-28 10:39</li>
                                    <li><i class="far fa-eye"></i> 7,071</li>
                                </ul>
                            </div>
                        </div>
                    </li>

                    <li class="row">
                        <div class="board-listing">
                            <h3 class="board-title">
                                데이터가 없습니다.
                            </h3>
                        </div>
                    </li>

                </ul>
            </div>
        </div>

        <div class="paging">
            <ul>
                <li><a href="javascript:void(0)" class="ripple-effect" data-animation="ripple"><i class="fas fa-chevron-left"></i></a></li>
                <li><a href="javascript:void(0)" class="current-page ripple-effect" data-animation="ripple">1</a></li>
                <li><a href="javascript:void(0)" class="ripple-effect" data-animation="ripple"><i class="fas fa-chevron-right"></i></a></li>
            </ul>
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