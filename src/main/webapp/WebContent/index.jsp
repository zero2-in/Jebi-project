<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!--
// 운송 스케즐 table script
create table departure_schedule(
cday varchar2(8) not null, --출발일자 20220105
gubun varchar2(10) not null, -- 구분 air:항공, ship:배
depart  varchar2(12) not null, -- 출발일시분(년월일시분) 202201051530
arrival varchar2(12) not null, -- 도착일시분(년월일시분) 202201051530
CONSTRAINT pk_departure_schedule primary key(cday,gubun));
-->

<!-- 추가 1 시작-->
<%@ page import="com.jebi.dto.*,java.util.*,java.text.*" %>
<%
    ArrayList<DepartureDTO> evs = (ArrayList<DepartureDTO>)request.getAttribute("t_dtos");
%>
<!-- 추가 1 끝-->
<%@ include file="common_header.jsp" %>
<!-- 추가 2 시작-->
<script src="js/jquery-3.6.0.min.js"></script><!-- js/jquery-3.6.0.min.js 위에 있어야 magnific-popup.min.js 보다-->
<!-- 추가 2 끝-->
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/tabcontent.js"></script>
<link rel="stylesheet" href="css/magnific-popup.css">

<!-- 수정 1 시작-->
<div id="small-dialog" class="zoom-anim-dialog dialog-with-tabs mfp-hide">
    <div class="schedule-form" id="dialog-cont">
        <script>
            function fnPopup(siteSrc) {
                $.ajax({
                    type: "post",
                    url: siteSrc,
                    success: function (data) {
                        $(".month_day").html("");
                        $(".dialog-cont-right-cont-air .dis").css('display','none');
                        $(".dialog-cont-right-cont-ship .dis").css('display','none');
                    }
                });
            }
        </script>
        <!-- 수정 1 끝-->
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

        <!--  모달창 시작   -->

        <style type="text/css">
            .dialog-with-tabs#small-dialog-2, .dialog-with-tabs#small-dialog-3,
            .dialog-with-tabs#small-dialog-4, .dialog-with-tabs#small-dialog {
                padding: 0;
                color: #666;
                max-width: 950px;
                height: 740px;
                padding: 10px;
                box-shadow: 0 0 25px rgba(0,0,0,.25);
            }


            p{padding:0; margin:0}
            a { color:#000000;text-decoration:none; }
            .scriptCalendar { width:650px; text-align:center; border:1px solid #BDBDBD}
            .scriptCalendar > thead > tr > td { width:50px;height:50px; }
            .scriptCalendar > thead > tr:first-child > td { font-weight:bold; }

            .scriptCalendar > thead > tr:last-child > td { background-color:#D9E5FF; }
            .scriptCalendar > tbody > tr > td { width:100px;height:100px; }
        </style>
        <script type="text/javascript">
            document.addEventListener("DOMContentLoaded", function() {
                buildCalendar();
            });

            var today = new Date(); // @param 전역 변수, 오늘 날짜 / 내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
            var date = new Date();  // @param 전역 변수, today의 Date를 세어주는 역할

            /**
             * @brief   이전달 버튼 클릭
             */
            function prevCalendar() {
                this.today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
                buildCalendar();    // @param 전월 캘린더 출력 요청
                $(".month_day").html("");
                $(".dialog-cont-right-cont-air .dis").css('display','none');
                $(".dialog-cont-right-cont-ship .dis").css('display','none');
            }

            /**
             * @brief   다음달 버튼 클릭
             */
            function nextCalendar() {
                this.today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
                buildCalendar();    // @param 명월 캘린더 출력 요청
                $(".month_day").html("");
                $(".dialog-cont-right-cont-air .dis").css('display','none');
                $(".dialog-cont-right-cont-ship .dis").css('display','none');
            }

            /**
             * @brief   캘린더 오픈
             * @details 날짜 값을 받아 캘린더 폼을 생성하고, 날짜값을 채워넣는다.
             */
            function buildCalendar() {
                let doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
                let lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
                let tbCalendar = document.querySelector(".scriptCalendar > tbody");
                document.getElementById("calYear").innerText = today.getFullYear();                                  // @param YYYY월
                document.getElementById("calMonth").innerText = autoLeftPad((today.getMonth() + 1), 1);   // @param MM월
                var nowYear = today.getFullYear();
                var nowMonth = autoLeftPad((today.getMonth() + 1), 2);
                // @details 이전 캘린더의 출력결과가 남아있다면, 이전 캘린더를 삭제한다.
                while(tbCalendar.rows.length > 0) {
                    tbCalendar.deleteRow(tbCalendar.rows.length - 1);
                }
                // @param 첫번째 개행
                let row = tbCalendar.insertRow();
                // @param 날짜가 표기될 열의 증가값
                let dom = 1;
                // @details 시작일의 요일값( doMonth.getDay() ) + 해당월의 전체일( lastDate.getDate())을  더해준 값에서
                //               7로 나눈값을 올림( Math.ceil() )하고 다시 시작일의 요일값( doMonth.getDay() )을 빼준다.
                let daysLength = (Math.ceil((doMonth.getDay() + lastDate.getDate()) / 7) * 7) - doMonth.getDay();

                // @param 달력 출력
                // @details 시작값은 1일을 직접 지정하고 요일값( doMonth.getDay() )를 빼서 마이너스( - )로 for문을 시작한다.

                for(let day = 1 - doMonth.getDay(); daysLength >= day; day++) {
                    let column = row.insertCell();
                    let airClickValue="", shipClickValue="";
                    // @param 평일( 전월일과 익월일의 데이터 제외 )
                    if(Math.sign(day) == 1 && lastDate.getDate() >= day) {
                        var forDay = nowYear+nowMonth+autoLeftPad(day,2);
                        var go = true;

                        var disText = "<span style='float:left;vertical-align:top;padding-bottom: 65px;'>"+day+"</span><br>";
                        <%				for(int k=0; k <evs.size(); k++){
                        %>
                        if(forDay==<%=evs.get(k).getcDay()%>){
                            <% if(evs.get(k).getGubun().equals("air")){ %>
                            disText = disText + "<img src='images/air_img.png' height='30px'><br>";
                            airClickValue = <%=evs.get(k).getDepart()%>+''+<%=evs.get(k).getArrival()%>;
                            <%	}%>
                            <% if(evs.get(k).getGubun().equals("ship")){ %>
                            disText = disText + "<img src='images/shi_img.png' height='30px'>";
                            shipClickValue = <%=evs.get(k).getDepart()%>+''+<%=evs.get(k).getArrival()%>;
                            <%	}%>
                            go = false;
                        }
                        <%				} %>
                        column.innerHTML = disText;

                        // @param 일요일인 경우
                        if(dom % 7 == 1) {
                            column.style.color = "#FF4D4D";
                        }

                        // @param 토요일인 경우
                        if(dom % 7 == 0) {
                            column.style.color = "#4D4DFF";
                            row = tbCalendar.insertRow();   // @param 토요일이 지나면 다시 가로 행을 한줄 추가한다.
                        }

                    }

                    // @param 평일 전월일과 익월일의 데이터 날짜변경
                    else {

                        let exceptDay = new Date(doMonth.getFullYear(), doMonth.getMonth(), day);
                        column.innerText = autoLeftPad(exceptDay.getDate(), 2);
                        column.style.color = "#D8D8D8";

                    }

                    // @brief   전월, 명월 음영처리
                    // @details 현재년과 선택 년도가 같은경우
                    if(today.getFullYear() == date.getFullYear()) {

                        // @details 현재월과 선택월이 같은경우
                        if(today.getMonth() == date.getMonth()) {

                            // @details 현재일보다 이전인 경우이면서 현재월에 포함되는 일인경우
                            if(date.getDate() > day && Math.sign(day) == 1) {
                                column.style.backgroundColor = "#E5E5E5";
                                column.style.cursor = "pointer";
                            }

                            // @details 현재일보다 이후이면서 현재월에 포함되는 일인경우
                            else if(date.getDate() < day && lastDate.getDate() >= day) {
                                column.style.backgroundColor = "#E8D9FF";
                                column.style.cursor = "pointer";
                            }

                            // @details 현재일인 경우
                            else if(date.getDate() == day) {
                                column.style.backgroundColor = "#F6F6F6";  //오늘날짜 배경
                                column.style.cursor = "pointer";
                            }

                            // @details 현재월보다 이전인경우
                        } else if(today.getMonth() < date.getMonth()) {
                            if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                                column.style.backgroundColor = "#E5E5E5";
                                column.style.cursor = "pointer";
                            }
                        }

                        // @details 현재월보다 이후인경우
                        else {
                            if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                                column.style.backgroundColor = "#E8D9FF";
                                column.style.cursor = "pointer";
                            }
                        }
                    }

                    // @details 선택한년도가 현재년도보다 작은경우
                    else if(today.getFullYear() < date.getFullYear()) {
                        if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                            column.style.backgroundColor = "#E5E5E5";
                            column.style.cursor = "pointer";
                        }
                    }
                    // @details 선택한년도가 현재년도보다 큰경우
                    else {
                        column.style.backgroundColor = "#E8D9FF";
                        column.style.cursor = "pointer";
                    }
                    column.onclick = function(){ calendarChoiceDay(this,airClickValue,shipClickValue); }
                    dom++;

                }
            }

            /**
             * @brief   날짜 선택
             * @details 사용자가 선택한 날짜에 체크표시를 남긴다.
             */
            function calendarChoiceDay(column,airClickValue,shipClickValue) {
                var cYear = document.getElementById("calYear").innerText;
                var cMonth = document.getElementById("calMonth").innerText;
                var choDay = autoLeftPad(column.innerText.substr(0,2).trim(),2);

                $(".month_day").html(cYear+"년 "+cMonth+"월 "+choDay+"일");

                if(airClickValue !=""){
                    var dis_month_day = airClickValue.substr(0,4)+"년 "+airClickValue.substr(4,2)+"월 "+airClickValue.substr(6,2)+"일";
                    $(".month_day").html(dis_month_day);
                } else if(shipClickValue !=""){
                    var dis_month_day = shipClickValue.substr(0,4)+"년 "+shipClickValue.substr(4,2)+"월 "+shipClickValue.substr(6,2)+"일";
                    $(".month_day").html(dis_month_day);
                }
                if(airClickValue !=""){
                    $(".dialog-cont-right-cont-air .dis").css('display','block');
                    var start = airClickValue;
                    start = airClickValue.substr(0,4)+"."+airClickValue.substr(4,2)+"."+airClickValue.substr(6,2)+" "+airClickValue.substr(8,2)+":"+airClickValue.substr(10,2);
                    end = airClickValue.substr(12,4)+"."+airClickValue.substr(16,2)+"."+airClickValue.substr(18,2)+" "+airClickValue.substr(20,2)+":"+airClickValue.substr(22);
                    $(".air_start").html(start);
                    $(".air_end").html(end);
                } else {
                    $(".dialog-cont-right-cont-air .dis").css('display','none');
                }
                if(shipClickValue !=""){
                    $(".dialog-cont-right-cont-ship .dis").css('display','block');
                    var start = shipClickValue;
                    start = shipClickValue.substr(0,4)+"."+shipClickValue.substr(4,2)+"."+shipClickValue.substr(6,2)+" "+shipClickValue.substr(8,2)+":"+shipClickValue.substr(10,2);
                    end = shipClickValue.substr(12,4)+"."+shipClickValue.substr(16,2)+"."+shipClickValue.substr(18,2)+" "+shipClickValue.substr(20,2)+":"+shipClickValue.substr(22);
                    $(".ship_start").html(start);
                    $(".ship_end").html(end);
                } else {
                    $(".dialog-cont-right-cont-ship .dis").css('display','none');
                }
            }

            /**
             * @brief   숫자 두자릿수( 00 ) 변경
             * @details 자릿수가 한지라인 ( 1, 2, 3등 )의 값을 10, 11, 12등과 같은 두자리수 형식으로 맞추기위해 0을 붙인다.
             * @param   num     앞에 0을 붙일 숫자 값
             * @param   digit   글자의 자릿수를 지정 ( 2자릿수인 경우 00, 3자릿수인 경우 000 … )
             */
            function autoLeftPad(num, digit) {
                if(String(num).length < digit) {
                    num = new Array(digit - String(num).length + 1).join("0") + num;
                }
                return num;

            }

        </script>
        <style>
            #dialog-cont .dialog-cont-left{float:left}
            #dialog-cont .dialog-cont-right{float:right}
            #dialog-cont .dialog-cont-right {
                width:270px;
                height:500px;
            }
        </style>
        <div class="dialog-cont-left">
            <table class="scriptCalendar">
                <thead>
                <tr>
                    <td></td>
                    <td onClick="prevCalendar();" style="cursor:pointer;"><i class="fas fa-backward"></i></td>
                    <td colspan="3" align="center">
                        <span id="calYear"></span>년
                        <span id="calMonth"></span>월
                    </td>
                    <td onClick="nextCalendar();" style="cursor:pointer;"><i class="fas fa-forward"></i></td>
                    <td></td>
                </tr>
                <tr>
                    <td>일</td>
                    <td>월</td>
                    <td>화</td>
                    <td>수</td>
                    <td>목</td>
                    <td>금</td>
                    <td>토</td>
                </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
        <style>
            .dialog-cont-right-title{
                font-size:20px;
                text-align:center;
                padding:15px 0 5px 0;
                background:#EAEAEA;
                width:270px;
                height:30px;
            }
            .dialog-cont-right-title-day{
                margin-top:5px;
                font-size:18px;
                padding:15px 0 5px 0;
                background:#D9E5FF;
                width:270px;
                height:27px;
            }
            .dialog-cont-right-title-day .month_day_t{
                padding :0 10px;
            }
            .dialog-cont-right-cont-air{
                text-align:right;
                padding:5px;
                margin-top:4px;
                border:2px solid #EAEAEA;
                width:256px;
                height:126px;
                background-image:url("images/airplane.gif");
            }
            .dialog-cont-right-cont-ship{
                text-align:right;
                padding:5px;
                margin-top:4px;
                border:2px solid #EAEAEA;
                width:256px;
                height:126px;
                background-image:url("images/airship.gif");
            }
            .dialog-cont-right-cont-custom{
                margin-top:4px;
            }
            .dialog-cont-right  div .cont_tit{
                letter-spacing:5px;
            }
            .start_end{
                margin-top:70px;
            }
        </style>
        <div class="dialog-cont-right">
            <div class="dialog-cont-right-title">
                Departure Schedule
            </div>
            <div class="dialog-cont-right-title-day">
                <span class="month_day_t">일 자 : </span><span class="month_day"></span>
            </div>
            <div class="dialog-cont-right-cont-air">
                <p class="cont_tit">항공스케즐</p>
                <div class="dis">
                    <p class="start_end"><i class="fas fa-calendar-alt"></i> 출발 : <span class="air_start">2022.01.12 12:00</span></p>
                    <p><i class="far fa-calendar-alt"></i> 도착 : <span class="air_end">2022.01.12 19:30</span></p>
                </div>
            </div>
            <div class="dialog-cont-right-cont-ship">
                <p class="cont_tit">해운스케즐</p>
                <div class="dis">
                    <p class="start_end"><i class="fas fa-calendar-alt"></i> 출발 : <span class="ship_start">2022.01.12 12:00</span></p>
                    <p><i class="far fa-calendar-alt"></i> 도착 : <span class="ship_end">2022.01.12 19:30</span></p>
                </div>
            </div>
            <style>
                /* 고객센터 */
                .dialog-cont-right-cont-custom .customer-service-center{
                    width:267px;
                    height:318px;
                    float:right;
                    text-align: center;
                    border: 1px solid #EAEAEA;
                }
                .dialog-cont-right-cont-custom .customer-service-center-title{
                    width: 267px;
                    height: 35px;
                    padding-top: 12px;
                    font-size: 20px;
                    background-color: rgb(255, 255, 255);
                    border-bottom: 1px solid #EAEAEA;
                }
                .dialog-cont-right-cont-custom .customer-service-center-Tel-time-inquiry-answer{
                    width:267px;
                    height:226px;
                    font-size:12px;
                }
                .dialog-cont-right-cont-custom .tel{
                    width:264px;
                    height:50px;
                    padding-top: 20px;
                    font-size: 30px;
                    color: #612C87;
                }
                .dialog-cont-right-cont-custom .time{
                    width: 264px;
                    height: 50px;
                    padding-top: 10px;
                    font-size: 15px;
                    line-height: 22px;
                }
                .dialog-cont-right-cont-custom .inquiry{
                    width: 264px;
                    height: 50px;
                    padding-top: 20px;
                }
                .dialog-cont-right-cont-custom .inquiry p{
                    width: 123px;
                    height: 25px;
                    padding-top: 6px;
                    margin-left: 69px;
                    font-size: 16px;
                    text-align: center;
                    color: #ffffff;
                    border: 1px solid rgb(205, 205, 205);
                    background-color: #b28fcb;
                }
                .dialog-cont-right-cont-custom .answer{
                    width:267px;
                    height:48px;
                    padding-top: 5px;
                }
            </style>
            <div class="dialog-cont-right-cont-custom">
                <div class="customer-service-center">
                    <div class="customer-service-center-title">고객센터</div>
                    <div class="customer-service-center-Tel-time-inquiry-answer">
                        <ul>
                            <li><div class="tel"><b>031-708-1120</b></div></li>
                            <li><div class="time">평일 오전 10시~오후 5시 <br>[점심시간 오후 12시~1시]<br>주말/공휴일 휴무</div></li>
                            <li><div class="inquiry"><a href="qna/qna_list.html"><p>1:1문의</p></a></div></li>
                            <li><div class="answer">궁금한 점이 있으신가요?<br>1:1문의에 남겨주시면 친절히 답변 드리겠습니다.</div></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--  모달창 끝 -->

<!-- Container Start -->
<div id="container">
    <!-- Menu img Start -->
    <div class="menu-img"></div>
    <!-- Menu img End -->

    <!-- Notice Start -->
    <div class="content">
        <div class="notice-question">
            <div class="notice">
                <p class="notice-title">공지사항</p>
                <p class="btn-notice"><a href ="javascript:goSite('cs')"><i class="fas fa-plus-square"></i></a>
            </div>
            <ul class="notice-content">
                <c:forEach items="${noticedtos}" var="list">
                    <li><a href="javascript:goNoticeView('${list.getNo()}')">${list.getTitle()}<span>${list.getReg_date()}</span></a></li>

                </c:forEach>
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
                    <li><div class="inquiry"><a href="javascript:goSite('qna')"><p>1:1문의</p></a></div></li>
                    <li><div class="answer">궁금한 점이 있으신가요?<br>1:1문의에 남겨주시면 친절히 답변 드리겠습니다.</div></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Customer-service-center End -->

    <!-- Login Start -->
    <div class="content01">
        <form action="Member" method="post" onsubmit="return check();" name="login">
            <div class="login-box">
                <c:if test="${not empty session_name}">
                    <div class="member-grade">
                        <li>
                            <a href="">${session_name}
                                <c:if test="${session_level eq 'top'}"><span>(관리자)</span></c:if>
                                <c:if test="${session_level ne 'top'}"><span>(일반)</span></c:if>
                            </a>
                        </li>
                    </div>
                    <div class="member-grade-table-box">
                        <ul>
                            <li class="deposit"><a href="">예치금<strong>0원</strong></a></li>
                            <li class="note"><a href="">쪽지<strong>0</strong></a></li>
                            <li class="coupon"><a href="">쿠폰<strong>0</strong></a></li>
                            <li class="waiting-for-payment"><a href="">결제대기<strong>0</strong></a></li>
                            <li class="nodate"><a href="">노데이타<strong>0</strong></a></li>
                        </ul>
                    </div>
                    <div class="index-logout">LOGOUT</div>
                </c:if>
                <c:if test="${empty session_name}">
                <div class="id-password-box">
                    <input type="text"  name="id" class="input"  placeholder="&nbsp;&nbsp;아이디">
                    <button type="button" class="btn-log" data-animation="ripple"  onclick="setTimeout(function() {check();}, 100);">로그인</button>
                    <input type="password" name="password" class="password"  placeholder="&nbsp;&nbsp;비밀번호">
                </div>
                <div class="checksave">
                    <input type="checkbox" value="1" id="idsave" name="idsave"><label for="idsave">&nbsp;&nbsp;&nbsp;아이디 저장</label>

                    <ul class="btn-id-password">
                        <li><a href="">ID</a></li>
                        <li><a href="">비밀번호 찾기</a></li>
                    </ul>
                    <ul class="btn-jebi-naver-talk">
                        <li><a href="javascript:goSite('join')" class="jebi">제비 회원가입</a></li>
                        <li><a href="javascript:void(0)" class="naver" id="naverIdLogin_loginButton" >네이버 아이디로 로그인</a></li>
                        <li><a href="javascript:void(0)"  class="talk" onclick="kakaoLogin()">카카오톡 계정으로 로그인</a></li>
                    </ul>
                </div>
                </c:if>
            </div>
        </form>
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
                    <a href="javascript:goSite('delivery')"><span>배송대행 신청</span></a>
                </p>
            </div>
            <div class="purchase">
                <p class="purchase-content">
                    <a href="javascript:goSite('purchase')"><span>구매대행 신청</span></a>
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
                <ul class="slides">
                <c:forEach items="${reviewdtos}" var="list">
                        <li>
                            <a href="javascript:goReView('${list.getNo()}')"><label class="left"></label><img src="file_room/review/${list.getNo()}_${list.getAttach()}" height="150px"><span>${list.getKor_name()}님<br>${list.getReg_date()}<br>${list.getTitle()}</span><label class="right"></label></a>
                        </li>
                </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <!-- Review End -->

    <!-- Departure_schedule Start -->
    <!-- 수정 3 시작-->
    <div class="departure-schedule">
        <div class="content02">
            <div class="schedule">
                <p class="departure-schedule-title">출항 한주 스케줄<span> &nbsp;&nbsp;&nbsp; 당일 출항 결제 마감 남은시간&nbsp;:&nbsp;<b>마감되었습니다. 11시까지 결제완료 기준으로 출항이 진행됩니다.</b></span></p>
                <p class="btn-departure-schedule"><a href="#small-dialog" onclick="fnPopup('DepartureSchedule')" class="popup-with-zoom-anim">한달 스케줄 보기<i class="fas fa-plus-square"></i></a>
            </div>
            <div class="oneweek-schedule">
                <ul>
                    <!--  page import="com.jebi.dto.*,java.util.*,java.text.*" -->
                    <%
                        Calendar cal = Calendar.getInstance();
                        cal.setTime(new Date());
                        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

                        String[] sevenDays = new String[7];
                        for(int k=0; k<7; k++){
                            cal.setTime(new Date());
                            cal.add(Calendar.DATE, +k);

                            String day = "" ;
                            int dayNum = cal.get(Calendar.DAY_OF_WEEK) ;
                            switch(dayNum){
                                case 1:
                                    day = "일";
                                    break ;
                                case 2:
                                    day = "월";
                                    break ;
                                case 3:
                                    day = "화";
                                    break ;
                                case 4:
                                    day = "수";
                                    break ;
                                case 5:
                                    day = "목";
                                    break ;
                                case 6:
                                    day = "금";
                                    break ;
                                case 7:
                                    day = "토";
                                    break ;
                            }
                            sevenDays[k] = df.format(cal.getTime())+"("+day+")";
                        }

                    %>
                    <style>
                        #container .oneweek-schedule ul li div{
                            width:160px;
                        }
                    </style>
                    <%
                        for(int k=0; k<sevenDays.length; k++){
                            String noSch ="";
                            if(sevenDays[k].indexOf("일") != -1 || sevenDays[k].indexOf("토") != -1){
                                noSch ="<br><p>항공 스케줄 없음<br></p><p>해운 스케줄 없음</p>";
                            } else {

                                for(int j=0; j <evs.size(); j++){
                                    String evsDay = sevenDays[k].substring(0, 10).replaceAll("-", "");
                                    //if(k==0) System.out.print("=========="+evsDay);
                                    if(evsDay.equals(evs.get(j).getcDay())){
                                        if(evs.get(j).getGubun().equals("air")){
                                            noSch ="<br><br><img src='images/air_img_ing.gif' height='40px'>";
                                        }
                                        if(evs.get(j).getGubun().equals("ship")){
                                            noSch = noSch+"<br><br><img src='images/ship_img_ing.gif' height='40px'>";
                                        }
                                    }
                                }
                                //noSch="<br><img src='images/air_img.png' height='30px'><br><img src='images/shi_img.png' height='30px'>";
                            }
                    %>
                    <li><div class="sun"><span class="popup-with-zoom-anim"><%=sevenDays[k]%><%=noSch%></span></div></li>
                    <%					} %>
                    <!--
                                            <li><div class="sun"><a href="#small-dialog" onclick="fnPopup('DepartureSchedule')" class="popup-with-zoom-anim">12-19(일)<br><p>항공 스케줄 없음<br></p><p>해운 스케줄 없음</p></a></div></li><
                                            <li><div class="mon"><a href="#small-dialog" onclick="fnPopup('DepartureSchedule')" class="popup-with-zoom-anim">12-20(월)<br><img src="images/air_img.png" height="30px"><br><img src="images/shi_img.png" height="30px"></a></div></li>
                                            <li><div class="tues"><a href="#small-dialog" onclick="fnPopup('DepartureSchedule')" class="popup-with-zoom-anim">12-21(화)<br><img src="images/air_img.png" height="30px"><br><img src="images/shi_img.png" height="30px"></a></div></li>
                                            <li><div class="wednes"><a href="#small-dialog" onclick="fnPopup('DepartureSchedule')" class="popup-with-zoom-anim">12-22(수)<br><img src="images/air_img.png" height="30px"><br><img src="images/shi_img.png" height="30px"></a></div></li>
                                            <li><div class="thurs"><a href="#small-dialog" onclick="fnPopup('DepartureSchedule')" class="popup-with-zoom-anim">12-23(목)<br><img src="images/air_img.png" height="30px"><br><img src="images/shi_img.png" height="30px"></a></div></li>
                                            <li><div class="fri"><a href="#small-dialog" onclick="fnPopup('DepartureSchedule')" class="popup-with-zoom-anim">12-24(금)<br><img src="images/air_img.png" height="30px"><br><img src="images/shi_img.png" height="30px"></a></div></li>
                                            <li><div class="satur"><a href="#small-dialog" onclick="fnPopup('DepartureSchedule')" class="popup-with-zoom-anim">12-25(토)<br><p>항공 스케줄 없음<br></p><p>해운 스케줄 없음</p></a></div></li>
                     -->
                </ul>
            </div>
        </div>
    </div>
    <!-- 수정 3 끝-->
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
        <div class="tab">
            <ul class="tabnav">
                <li><a href="#tab01"><b>배송대행 절차</b></a></li>
                <li><a href="#tab02"><b>구매대행 절차</b></a></li>
            </ul>
            <div class="tabcontent">

                    <div id="tab01"><img src="images/dlivery01_1_img.png" height="150px"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="images/dlivery01_2_img.png" height="150px"></div>
                    <div id="tab02"><img src="images/purchase02_01_img.png" height="150px"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="images/dlivery01_2_img.png" height="150px"></div>

            </div>
        </div>
    </div>


    <!-- Dlivery-purchase end -->

    <!-- Departure-schedule Start -->
    <div class="favorites-service">
        <div class="content01">
            <div class="favorites-service-title">즐겨찾는 서비스</div>
            <div class="sverice-Information">
                <ul>
                    <li><div class="guide"><a href="javascript:goSite('delivery_agent_service_list')"><img src="images/service_guide_img.png" height="98px"><p>초보자 이용 가이드</p></a></div></li>
                    <li><div class="questions"><a href="javascript:goSite('faq')"><img src="images/questions_img.png" height="98px"><p>문의사항</p></a></div></li>
                    <li><div class="Fee-information"><a href="javascript:goSite('shipping')"><img src="images/Fee_information_img.png" height="98px"><p>국제배송 요금안내</p></a></div></li>
                    <li><div class="transportation-information"><a href="javascript:goSite('invoice_number_list')"><img src="images/rate_system_img.png" height="98px"><p>운송안내</p></a></div></li>
                    <li><div class="taobao-insert"><a href="javascript:goSite('automatic_order_registration_list')"><img src="images/insert_img.png" height="98px"><p>타오바오 주문자동등록</p></a></div></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Departure-schedule End -->



</div>
<form action="Member" method="post" name="kakaologin">
    <input type="hidden" name="separate" value="kakaoSave">
    <input type="hidden" name="k_id">
    <input type="hidden" name="k_nickname">
    <input type="hidden" name="k_email">
</form>
<!-- Container End -->

<!-- Footer -->
<%@ include file="common_footer.jsp" %>

    <!-- script -->
    <script src="js/btn_ripple_effect.js"></script>
    <script src="js/use_cookie_save_id.js"></script>
    <script>
        function check() {
            if(checkValue(login.id, "아이디를 입력하세요")) return;
            if(checkValue(login.password, "비밀번호를 입력하세요")) return;

            saveid();

            login.submit();
        }

        function goCategory(arg) {
            category.t_category.value = arg;
            category.submit();
        }
        function goReView(arg) {
            urldirect.action = "Review";
            urldirect.separate.value = "view";
            urldirect.no.value = arg;
            urldirect.submit();
        }
        function goNoticeView(arg) {
            urldirect.action = "Notice";
            urldirect.separate.value = "view";
            urldirect.no.value = arg;
            urldirect.submit();
        }
    </script>


    <script src="js/naver_login.js"></script>
    <script src="js/kakao_login.js"></script>

</body>

</html>