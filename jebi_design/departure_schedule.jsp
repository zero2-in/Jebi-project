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
    <div class="departure-container">
        <div class="departure-schedule">
            <ul class="popup-tabs-nav">
                <li class="active"><a href="javascript:">출항스케줄</a></li>
            </ul>
            <button title="close (esc)" type="button" class="mfp-close"><i class="far fa-times-circle"></i></button>
            <div class="popup-tabs-container">
                <!-- Tab Start -->
                <div class="popup-tab-content" id="tab">  
                    <!-- Content Start -->
                    <div class="pd20">   
                        <!-- B: ScheduleBox Start -->
                        <div class="sch-wrap" id="schedulebox">  
                            <form name="frmschedule" id="frmschedule" method="get">
                                <input type="text" name="sbegindt" value="2022-01-05">
                            </form>  
                            <div class="sch-calendarbox-sch-box">   
                                <div class="year"><a href="javascript:" onclick="fnDepartureInit('MP', '2022-01-05');" title="이전 월">◀</a> <span class="tityear">2022</span>년 <span class="titmonth">1</span>월 <a href="javascript:" onclick="fnDepartureInit('MN', '2022-01-04');" title="다음 월">▶</a></div>
                                <div class="calendar">
                                    <table class="sch-table">
                                        <tbody>
                                            <tr>
                                                <th class="sch-red">일</th>
                                                <th>월</th>
                                                <th>화</th>
                                                <th>수</th>
                                                <th>목</th>
                                                <th>금</th>
                                                <th class="sch-blue">토</th>
                                            </tr>
                                        </tbody>
                                    </table>
                                        <table class="sch-table" id="vwschedule">
                                            <tbody>
                                                <tr>
                                                    <td class="" onclick="fnDepartureDay('2021-12-26');" style="cursor:pointer;">26</td>
                                                    <td class="" onclick="fnDepartureDay('2021-12-27');">27</td>
                                                    <td class="" onclick="fnDepartureDay('2021-12-28');">28</td>
                                                    <td class="" onclick="fnDepartureDay('2021-12-29');">29</td>
                                                    <td class="" onclick="fnDepartureDay('2021-12-30');">30</td>
                                                    <td class="" onclick="fnDepartureDay('2021-12-31');">31</td>
                                                    <td class="off" onclick="fnDepartureDay('2022-01-01');">1</td>      
                                                </tr>
                                            <tr>
                                                <td class="off" onclick="fnDepartureDay('2022-01-02');">2</td>
                                                <td class="on" onclick="fnDepartureDay('2022-01-03');">3</td>           
                                                <td class="on" onclick="fnDepartureDay('2022-01-04');">4</td>           
                                                <td class="today" onclick="fnDepartureDay('2022-01-05');">5</td>          
                                                <td class="on" onclick="fnDepartureDay('2022-01-06');">6</td>          
                                                <td class="on" onclick="fnDepartureDay('2022-01-07');">7</td>                              
                                                <td class="off" onclick="fnDepartureDay('2022-01-08');">8</td>
                                            </tr>
                                            <tr>      
                                                <td class="off" onclick="fnDepartureDay('2022-01-09');">9</td>     
                                                <td class="on" onclick="fnDepartureDay('2022-01-10');">10</td>    
                                                <td class="on" onclick="fnDepartureDay('2022-01-11');">11</td>   
                                                <td class="on" onclick="fnDepartureDay('2022-01-12');">12</td>   
                                                <td class="on" onclick="fnDepartureDay('2022-01-13');">13</td>  
                                                <td class="on" onclick="fnDepartureDay('2022-01-14');">14</td>  
                                                <td class="off" onclick="fnDepartureDay('2022-01-15');">15</td> 
                                            </tr>
                                            <tr>
                                                <td class="off" onclick="fnDepartureDay('2022-01-16');">16</td>  
                                                <td class="on" onclick="fnDepartureDay('2022-01-17');">17</td> 
                                                <td class="on" onclick="fnDepartureDay('2022-01-18');">18</td> 
                                                <td class="on" onclick="fnDepartureDay('2022-01-19');">19</td>  
                                                <td class="on" onclick="fnDepartureDay('2022-01-20');">20</td>  
                                                <td class="on" onclick="fnDepartureDay('2022-01-21');">21</td>
                                                <td class="off" onclick="fnDepartureDay('2022-01-22');">22</td>
                                            </tr>
                                            <tr>         
                                                <td class="off" onclick="fnDepartureDay('2022-01-23');">23</td>         
                                                <td class="on" onclick="fnDepartureDay('2022-01-24');">24</td>         
                                                <td class="on" onclick="fnDepartureDay('2022-01-25');">25</td>        
                                                <td class="on" onclick="fnDepartureDay('2022-01-26');">26</td>       
                                                <td class="on" onclick="fnDepartureDay('2022-01-27');">27</td>     
                                                <td class="on" onclick="fnDepartureDay('2022-01-28');">28</td>   
                                                <td class="off" onclick="fnDepartureDay('2022-01-29');">29</td>     
                                            </tr>
                                            <tr>   
                                                <td class="off" onclick="fnDepartureDay('2022-01-30');">30</td>
                                                <td class="on" onclick="fnDepartureDay('2022-01-31');">31</td>          
                                                <td class="" onclick="fnDepartureDay('2022-02-01');">1</td>      
                                                <td class="" onclick="fnDepartureDay('2022-02-02');">2</td>   
                                                <td class="" onclick="fnDepartureDay('2022-02-03');">3</td>  
                                                <td class="" onclick="fnDepartureDay('2022-02-04');">4</td>  
                                                <td class="" onclick="fnDepartureDay('2022-02-05');">5</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="contxt"><i class="fas fa-circle"></i> 으로 된 일은 스케줄이 없습니다.</div>
                                </div><!-- //calendar -->
                            </div> <!-- //sch_calendarBox -->
                        
                            <div class="sch-listbox">
                                <div class="sch-year">
                                    <a href="javascript:" class="fl" onclick="fnDepartureInit('DP', '2022-01-05');" title="이전 일">◀</a><strong><span class="tityear">2022</span>년 <span class="titmonth">1</span>월 <span class="titday">5</span>일</strong><a href="javascript:" class="fr" onclick="fnDepartureInit('DN', '2022-01-05');" title="다음 일">▶</a>
                                </div>
                        
                                <div class="schedule-list">
                                    <table class="basic-table-sch_list" id="vwdeparture">
                                        <colgroup>
                                            <col width="20%"><col width="15%"><col width="20%"><col width="*">
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th>센터</th>
                                            <th>운송</th>
                                            <th>출발시간</th>
                                            <th class="">특이사항</th>
                                        </tr>
                        
                                        
                                        <tr>
                                            <td data-label="센터"><div class="sch-list-txt">위해</div></td>
                                            <td class="tc" data-label="운송">
                                                <div class="sch-list-txt"><img src="/images/airplane_img.png" width="25"></div>
                                                <!-- <div class="schedule_way">
                                                    <i class="icon-line-awesome-ship"></i>
                                                </div> -->
                                            </td>
                                            <td class="tc" data-label="출발시간">
                                                <div class="sch-list-txt">12:00</div>
                                            </td>
                                            <td data-label="특이사항"><div class="sch-list-txt"></div></td>
                                        </tr>
                                        
                                        <tr>
                                            <td data-label="센터"><div class="sch-list-txt">위해</div></td>
                                            <td class="tc" data-label="운송">
                                                <div class="sch-list-txt"><img src="/images/ship_img.png" width="25"></div>
                                                <!-- <div class="schedule_way">
                                                    <i class="icon-line-awesome-ship"></i>
                                                </div> -->
                                            </td>
                                            <td class="tc" data-label="출발시간">
                                                <div class="sch-list-txt">12:00</div>
                                            </td>
                                            <td data-label="특이사항"><div class="sch-list-txt"></div></td>
                                        </tr>
                                        
                        
                                        </tbody>
                                    </table>
                                </div>
                        
                            </div>
                        </div>
                            <!-- E: ScheduleBox -->
            
                    </div>
                    <!-- Content / End -->
            
                </div>
                <!-- Tab / End -->
            
            </div>
        </div>
    </div>
</html>
