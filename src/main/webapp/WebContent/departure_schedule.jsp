<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/layout.css">
    <head>

        <!-- Script -->
        <script>

        </script>
        <!-- Container Start -->
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
                        <!-- Content / End -->
</html>
