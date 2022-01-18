<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="UTF-8" %>
<html>
<head>
    <script src="js/btn_ripple_effect.js"></script>
</head>
<body>
    <div class="container-agent popup">
        <ul class="popup-tabs-nav">
            <li class="active">
                <a href="javascript:void(0)">재고상품 목록</a>
            </li>
        </ul>
        <div class="popup-tabs-container">
            <form method="post" name="frmSearch" id="frmSearch">
                <!-- search-con -->
                <div class="search-con">
                    <div class="search-con-inner2 con-center">
                        <div class="submit-field mbw100">
                            <input type="text" name="sStockNo" maxlength="8" placeholder="재고번호" class="with-border margin-bottom-0 EnterKey">
                        </div>
                        <div class="submit-field mbw100">
                            <input type="text" name="sProNm" placeholder="상품명" class="with-border margin-bottom-0 EnterKey">
                        </div>
                        <div class="search-btn2">
                            <a href="javascript:void(0)" onclick="" class="button ripple-effect">
                                검색
                                <i class="fas fa-search"></i>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- search-con / End -->
            </form>
            <!-- Tab -->
            <div class="popup-tab-content" id="tab">
                <form method="post" name="frmList" id="frmList">
                    <div class="popup-pro-list">
                        <!-- project-pro-list -->
                        <div class="no-text"> 재고 상품이 없습니다. </div>
                        <div class="clearfix"></div>
                    </div>
                    <!-- projects Container / End -->
                </form>
                <div class="row">
                    <div class="col-xl-12 col-common">
                        <div class="pagination-container margin-top-10 margin-bottom-20">
                            <nav class="pagination">
                                <ul>
                                    <li class="pagination-arrow">
                                        <a href="javascript:void(0)" data-animation="ripple" class="ripple-effect" title="이전 10페이지 없음">
                                            <i class="fas fa-chevron-left"></i>
                                        </a>
                                    </li><li>
                                        <a href="javascript:void(0)" onclick="" data-animation="ripple" class="current-page ripple-effect">
                                            1
                                        </a>
                                    </li><li class="pagination-arrow">
                                        <a href="javascript:void(0)" onclick="" data-animation="ripple" class="ripple-effect" title="다음 10페이지 없음">
                                            <i class="fas fa-chevron-right"></i>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
                <!-- Button -->
                <div class="tc margin-bottom-35">
                    <a href="javascript:void(0)" class="button ripple-effect margin-top-30">
                        선택
                    </a>
                </div>
            </div>
            <!-- Tab / End -->
        </div>
        <!-- sign-in-form / End -->
    </div>
</body>
</html>
