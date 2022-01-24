<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../common_header.jsp" %>

<!-- 사이트 네비게이션 이름, 주소 표시 -->
<%@ include file="common_nodata.jsp" %>

<div class="container-notice">
    <div class="bar-title">
        <h2 class="title">노데이터</h2>

        <%@ include file="../breadcrumbs_cscenter.jsp" %>
    </div>

    <div class="dashboard">
        <div class="search-con">
            <div class="row">
                <!-- 검색 폼! -->
                <form action="nodata_list.html" method="post" name="search">
                    <div class="search">
                        <input type="date" name="start" class="search-text" data-placeholder="시작일" required aria-required="true" value="2021-09-30">
                        <input type="date" name="end" class="search-text" data-placeholder="종료일" required aria-required="true">
                        <input type="text" name="tracking" class="search-text" placeholder="트래킹번호">
                        <button type="button" class="search-btn ripple-effect" data-animation="ripple">
                            검색 <i class="fas fa-search"></i>
                        </button>
                    </div>
                </form>

            </div>
        </div>

        <div class="content">
            <ul class="board">
                <!-- List Block -->
                <li class="row">
                    <div class="board-listing">
                        <h3 class="board-title">
                            데이터가 없습니다.
                        </h3>
                    </div>
                </li>
                <!--
                <li class="row">
                    <div class="board-listing">

                        <div class="list-no">
                            <strong class="important">공지</strong>
                        </div>

                        <h3 class="board-title">
                            <a href="notice_view.html"><b class="important">**제비 이용 안내**</b></a>
                            <span class="status-button">new</span>
                        </h3>

                        <div class="board-footer">
                            <ul class="fl">
                                <li><i class="far fa-edit"></i> 관리자</li>
                                <li><i class="far fa-calendar"></i> 2021-12-24 14:12</li>
                                <li><i class="far fa-eye"></i> 2,994</li>
                            </ul>
                        </div>
                    </div>
                </li>-->

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
<%@ include file="../common_footer.jsp" %>

<script src="../js/btn_ripple_effect.js"></script>

</body>
</html>