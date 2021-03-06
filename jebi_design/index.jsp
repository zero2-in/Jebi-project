<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file="common_header.jsp" %>

<script src="js/jquery.magnific-popup.min.js"></script>
<link rel="stylesheet" href="css/magnific-popup.css">

<div id="small-dialog" class="zoom-anim-dialog dialog-with-tabs mfp-hide">
    <div class="schedule-form" id="dialog-cont"></div>
</div>

    <!-- Popup Script -->
    <script>
        function fnPopup(siteSrc) {
            $.ajax({
                type: "post",
                url: siteSrc,
                success: function (data) {
                    $("#small-dialog #dialog-cont").html(data);
                }
            });
        }
    </script>
    <script>
         $(document).ready(function () {
            $(".popup-with-zoom-anim").magnificPopup({
                type: 'inline', 

                fixedContentPos: false, 
                fixedBgPos: true, 

                overflowY: 'auto',

                closeBtnInside: true, 
                preloader: false, 

                midClick: true, 
                removalDelay: 300,
                mainClass: 'my-mfp-zoom-in'
            });
        });
    </script>
    
    <!-- Container Start -->
    <div id="container">
        <!-- Menu img Start -->
        <div class="menu-img"></div>
        <!-- Menu img End -->

        <!-- Notice Start -->
        <div class="content">
            <div class="notice-question">
                <div class="notice">
                    <p class="notice-title">공지사항1</p>
                    <p class="btn-notice"><a href ="notice/notice_list.html"><i class="fas fa-plus-square"></i></a>
                </div>	
                    <ul class="notice-content">	
                        <li><a href="">주문서 작성시 유의사항<span>2021-12-14</span></a></li>								
                        <li><a href="">2021년 중국 국경절 일정 안내<span>2021-09-27</span></a></li>	
                        <li><a href="">9월 12일(일), 13일(월) 항공출고건 지연안내<span>2021-09-15</span></a></li>
                        <li><a href="">2021년 추석 일정 안내<span>2021-09-14</span></a></li>
                        <li><a href="">9월6일 항공 출고건 출항 지연안내<span>2021-09-07</span></a></li>	
                        <li><a href="">8월9일~16일 항공 출고 관련 안내<span>2021-08-09</span></a></li>	
                    </ul>     
            </div>
            <!-- Notice End -->

            <!-- Customer-service-center Start -->
            <div class="customer-service-center">
                <div class="customer-service-center-title">고객센터</div>  
                <div class="customer-service-center-Tel-time-inquiry-answer">
                    <ul>
                        <li><div class="tel"><b>031-708-1120</b></div></li>
                        <li><div class="time">평일 오전 10시~오후 5시 [점심시간 오후 12시~1시]<br>주말/공휴일 휴무</div></li>
                        <li><div class="inquiry"><a href="qna/qna_list.html"><p>1:1문의</p></a></div></li>
                        <li><div class="answer">궁금한 점이 있으신가요?<br>1:1문의에 남겨주시면 친절히 답변 드리겠습니다.</div></li>
                    </ul>  
                </div>                 
            </div>	   
        </div>
         <!-- Customer-service-center End --> 

        <!-- Login Start -->
        <div class="content01">    
            <div class="login-box">
                <div class="id-password-box">
                    <input type="text"  class="id"  placeholder="&nbsp;&nbsp;아이디">
                    <input type="button" onClick="" value="로그인" class="btn-log" > 
                    <input type="password"  class="password"  placeholder="&nbsp;&nbsp;비밀번호">         
                </div>
                    <div class="checksave">
                        <input type="checkbox" value="1" id="idsave" name="idsave"><label for="idsave">&nbsp;&nbsp;&nbsp;아이디 저장</label>
                        
                        <ul class="btn-id-password">
                            <li><a href="">ID</a></li>
                            <li><a href="">비밀번호 찾기</a></li>
                        </ul>
                        <ul class="btn-jebi-naver-talk">
                            <li><a href="member/join.html" class="jebi">제비 회원가입</a></li>
                            <li><a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=Hi0oJsyzfOnKraAX79h8&redirect_uri=http%3A%2F%2Fwww%2Ejikbak%2Ecom%2FFront%2FJoin%2FN%5Fapi%2Easp&state=41362a0516eebb5fde48e4a4c478f938" class="naver" onclick="window.open(this.href, '_blank', 'width=550, height=745'); return false;">네이버 아이디로 로그인</a></li>                    
                            <li><a href="https://accounts.kakao.com/login?continue=https%3A%2F%2Fkauth.kakao.com%2Foauth%2Fauthorize%3Fredirect_uri%3Dkakaojs%26response_type%3Dcode%26state%3Deg0aj43gfkco0fytupqanm%26proxy%3DeasyXDM_Kakao_k84ccnx3vj_provider%26ka%3Dsdk%252F1.24.1%2520os%252Fjavascript%2520lang%252Fko-KR%2520device%252FWin32%2520origin%252Fhttp%25253A%25252F%25252Fwww.jikbak.com%26origin%3Dhttp%253A%252F%252Fwww.jikbak.com%26client_id%3D2194f6bd15f50ffeba89834addd14504" class="talk" onclick="window.open(this.href, '_blank', 'width=550, height=745'); return false;">카카오톡 계정으로 로그인</a></li>  
                        </ul>
                    </div>                
            </div>
            <!-- Login End -->

            <!-- China-address Start -->
            <div class="china-address-box">
                <div class="china-address">
                    <p class="address-title">중국센터 주소안내</p>
                </div>
                <p class="china-address-content"> 주소 : 山东省 威海市 环翠区 凤林街道<br><br>
                    상세주소 : 经区宋家洼凤鸣路燕喜堂东 黄色建筑物（仓库）6号, 나의 사서함번호<br><br>
                    우편번호 : 264205<br><br>
                    연 락 처 : 15066314676
                </p>                   
            </div> 
        </div>   
        <!-- China-address End -->
        
        <!-- Dlivery/purchase Start -->
        <div class="content01">     
             <div class="dlivery-purchase-box">   
                <div class="dlivery">
                    <p class="dlivery-content">
                        <a href="company_agent/delivery_agent.html"><span>배송대행 신청</span></a>	
                    </p>   
                </div>
                <div class="purchase">
                    <p class="purchase-content">
                        <a href="company_agent/purchase_agent.html"><span>구매대행 신청</span></a>	
                    </p> 
                </div>                   
            </div>   
            <!-- Review End -->

            <!-- Review Start -->
            <div class="review-box">
                <div class="review">
                    <p class="review-title">이용후기</p>
                </div>
                <div class="review-content">  
                    <a href="review/review_list.html"><img src="images/review_img.png" height="150px"><span>김***님<br>2021.12.19<br>첫 후기ㅎㅎㅎ</span></a>		   
                </div>                  
            </div>   
        </div>
        <!-- Review End -->

        <!-- Departure_schedule Start -->
        <div class="departure-schedule">
            <div class="content02"> 
                <div class="schedule">
                    <p class="departure-schedule-title">출항 한주 스케줄<span> &nbsp;&nbsp;&nbsp; 당일 출항 결제 마감 남은시간&nbsp;:&nbsp;<b>마감되었습니다. 11시까지 결제완료 기준으로 출항이 진행됩니다.</b></span></p>
                    <p class="btn-departure-schedule"><a href="#small-dialog" onclick="fnPopup('DepartureSchedule')" class="popup-with-zoom-anim">한달 스케줄 보기<i class="fas fa-plus-square"></i></a>
                </div>
                <div class="oneweek-schedule">
                    <ul>
                        <li><div class="sun"><a href="#small-dialog" onclick="fnPopup('DepartureSchedule')" class="popup-with-zoom-anim">12-19(일)<br><p>항공 스케줄 없음<br></p><p>해운 스케줄 없음</p></a></div></li>
                        <li><div class="mon"><a href="#small-dialog" onclick="fnPopup('DepartureSchedule')" class="popup-with-zoom-anim">12-20(월)<br><img src="images/air_img.png" height="30px"><br><img src="images/shi_img.png" height="30px"></a></div></li>
                        <li><div class="tues"><a href="#small-dialog" onclick="fnPopup('DepartureSchedule')" class="popup-with-zoom-anim">12-21(화)<br><img src="images/air_img.png" height="30px"><br><img src="images/shi_img.png" height="30px"></a></div></li>
                        <li><div class="wednes"><a href="#small-dialog" onclick="fnPopup('DepartureSchedule')" class="popup-with-zoom-anim">12-22(수)<br><img src="images/air_img.png" height="30px"><br><img src="images/shi_img.png" height="30px"></a></div></li>
                        <li><div class="thurs"><a href="#small-dialog" onclick="fnPopup('DepartureSchedule')" class="popup-with-zoom-anim">12-23(목)<br><img src="images/air_img.png" height="30px"><br><img src="images/shi_img.png" height="30px"></a></div></li>
                        <li><div class="fri"><a href="#small-dialog" onclick="fnPopup('DepartureSchedule')" class="popup-with-zoom-anim">12-24(금)<br><img src="images/air_img.png" height="30px"><br><img src="images/shi_img.png" height="30px"></a></div></li>
                        <li><div class="satur"><a href="#small-dialog" onclick="fnPopup('DepartureSchedule')" class="popup-with-zoom-anim">12-25(토)<br><p>항공 스케줄 없음<br></p><p>해운 스케줄 없음</p></a></div></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Departure_schedule End -->

        <!-- Youtube Start -->
        <div class="content03">
            <div class="youtube">
                <div class="ararand-title">제비 구매대행 신청방법 by 아라랜드</div>
                <div class="ararand-video"><iframe width="840" height="472" src="https://www.youtube.com/embed/TughH7EPbBU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>   
            </div>
        </div>    
        <!-- Youtube End -->

        <!-- Taobao-alibaba Start -->
        <div class="content04">
            <div class="taobao-alibaba-box">          
                <ul>
                    <li>
                        <div class="taobao"><a href="https://www.taobao.com/"><img src="images/taobao_img.jpg" height="60px"></a></div>
                        <div class="taobao-site"><a href=""><b>타오바오</b><span> 바로가기</span></a></div>  
                    </li>
                    <li>
                        <div class="alibaba"><a href="https://www.1688.com/"><img src="images/alibaba_img.jpg" height="65px"></a></div>
                        <div class="alibaba-site"><a href=""><b>알리바바</b><span> 바로가기</span></a></div>
                    </li>
                </ul>
            </div>
        </div>      
        <!-- Taobao-alibaba End -->

        <!-- Taobao-best Start -->
        <div class="content05">
            <div class="taobao-title"><b>타오바오<span>BEST</span></b>베스트 상품을 한눈에 보실 수 있습니다.</div>
            <div class="taobao-box"> 
                <div class="women-pet-men-toy-box">       
                    <ul>
                        <li><div class="taobao-women"><a href="https://s.taobao.com/search?q=%E5%A5%B3%E8%A3%85&amp;type=p&amp;tmhkh5=&amp;spm=a21wu.241046-kr.a2227oh.d100&amp;from=sea_1_searchbutton&amp;catId=100" target="_blank"><img src="images/taobaobest_women_img.PNG" height="414px"></a></div></li>
                        <li><div class="taobao-pet"><a href="https://s.taobao.com/search?q=%E5%AE%A0%E7%89%A9%E7%94%A8%E5%93%81&amp;imgfile=&amp;js=1&amp;stats_click=search_radio_all%3A1&amp;initiative_id=staobaoz_20200701&amp;ie=utf8" target="_blank"><img src="images/taobaobest_pet_img.PNG" height="414px"></a></div></li>
                        <li><div class="taobao-men"><a href="https://s.taobao.com/search?q=%E7%94%B7%E8%A3%85&amp;imgfile=&amp;js=1&amp;stats_click=search_radio_all%3A1&amp;initiative_id=staobaoz_20200701&amp;ie=utf8" target="_blank"><img src="images/taobaobest_men_img.PNG" height="200px"></a></div></li>
                        <li><div class="taobao-toy"><a href="https://s.taobao.com/search?q=%E7%8E%A9%E5%85%B7&amp;imgfile=&amp;js=1&amp;stats_click=search_radio_all%3A1&amp;initiative_id=staobaoz_20200701&amp;ie=utf8" target="_blank"><img src="images/taobaobest_toy_img.PNG" height="193px"></a></div></li>
                    </ul>
                </div> 
                <div class="camping-sports-box">  
                    <ul>  
                        <li><div class="taobao-camping"><a href="https://s.taobao.com/search?ie=utf8&amp;initiative_id=staobaoz_20200701&amp;stats_click=search_radio_all%3A1&amp;js=1&amp;imgfile=&amp;q=%E6%88%B7%E5%A4%96%E7%94%A8%E5%93%81&amp;suggest=history_1&amp;_input_charset=utf-8&amp;wq=%E6%88%B7%E5%A4%96&amp;suggest_query=%E6%88%B7%E5%A4%96&amp;source=suggest" target="_blank"><img src="images/taobaobest_camping_img.PNG" height="435px"></a></div></li>
                        <li><div class="taobao-sports"><a href="https://s.taobao.com/search?q=%E8%BF%90%E5%8A%A8%E7%94%A8%E5%93%81&amp;imgfile=&amp;js=1&amp;stats_click=search_radio_all%3A1&amp;initiative_id=staobaoz_20200701&amp;ie=utf8" target="_blank"><img src="images/taobaobest_sports_img.PNG" height="435px"></a></div></li>                 
                    </ul>
                </div> 
            </div>
        </div> 
        <!-- Taobao-best end -->

        <!-- Dlivery-purchase Start -->
        <div class="content01">
            <div class="dlivery-purchase-title"><a href=""><b>배송대행 절차 ㅣ</b>구매대행 절차</a></div>
            <div class="dlivery-purchase-procedure">                   
                <ul>
                    <li><div class="dlivery-procedure"><img src="images/dlivery01_1_img.png" height="150px"></div></li>
                    <li><div class="purchase-procedure"><img src="images/dlivery01_2_img.png" height="150px"></div></li>


                </ul>  
            </div>
        </div> 
        <!-- Dlivery-purchase end -->

        <!-- Departure-schedule Start -->
        <div class="favorites-service">
            <div class="content01"> 
                <div class="favorites-service-title">즐겨찾는 서비스</div>
                <div class="sverice-Information">
                    <ul>
                        <li><div class="guide"><a href="informationuse/informationuse_list.html"><img src="images/service_guide_img.png" height="98px"><p>초보자 이용 가이드</p></a></div></li>
                        <li><div class="questions"><a href="qna/qna_list.html"><img src="images/questions_img.png" height="98px"><p>문의사항</p></a></div></li>
                        <li><div class="Fee-information"><a href="cost_guide/shipping_list.html"><img src="images/Fee_information_img.png" height="98px"><p>국제배송 요금안내</p></a></div></li>
                        <li><div class="transportation-information"><a href="informationuse/invoice_number_list.html"><img src="images/rate_system_img.png" height="98px"><p>운송안내</p></a></div></li>
                        <li><div class="taobao-insert"><a href="informationuse/automatic_order_registration_list.html"><img src="images/insert_img.png" height="98px"><p>타오바오 주문자동등록</p></a></div></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Departure-schedule End -->
    </div>
    <!-- Container End -->

    <!-- Footer -->
    <%@ include file="common_footer.jsp" %>

    <script src="js/btn_ripple_effect.js"></script>
</body>

</html>