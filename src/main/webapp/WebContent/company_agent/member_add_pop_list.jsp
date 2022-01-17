<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <script></script>
    <!-- sign-in-form -->
</head>
<body>
    <div class="container-agent popup">
        <ul class="popup-tabs-nav">
            <li class="active">
                <a href="#tab">배송지목록</a>
            </li>
        </ul>
        <div class="popup-tabs-container">
            <!-- Tab -->
            <div class="popup-tab-content" id="tab">
                <form method="post" name="frmSearch" id="frmSearch">
                    <div class="compact-list-layout">
                        <c:if test="${empty addr_list}">
                            <div class="no-text"> 등록된 배송지 주소가 없습니다. </div>
                        </c:if>
                        <c:if test="${not empty addr_list}">
                            <c:forEach items="${addr_list}" var="list">
                                <!-- Board Listing -->
                                <div class="board-listing padding-left-75 btr-pd">
                                    <div class="board-listing-details">
                                        <div class="board-listing-description">
                                            <h3 class="board-listing-title">
                                                ${list.getCons_nm_kr()}(${list.getCons_nm_en()})
                                            </h3>
                                            <!-- board-listing-footer -->
                                            <div class="board-listing-footer">
                                                <ul>
                                                    <li>
                                                        <i class="fas fa-phone"></i>${list.getMob_no()}
                                                    </li>
                                                    <li>
                                                        <i class="fas fa-home"></i>${list.getCons_zip()}&nbsp;&nbsp;${list.getCons_addr()}, ${list.getCons_addr_det()}
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Bookmark -->
                                    <a href="javascript:void(0)">
                                        <span class="bookmark-icon"></span>
                                    </a>
                                    <!-- Buttons -->
                                    <div class="buttons-to-right">
                                        <a href="javascript:void(0)" onclick="fnPopUp('MemAddrPop_E')" class="popup-with-zoom-anim button gray ripple-effect ico small" data-animation="ripple">
                                            <i class="fas fa-pen"></i>
                                        </a>
                                        <a href="javascript:void(0)" onclick="" class="button gray ripple-effect ico small" data-animation="ripple">
                                            <i class="far fa-trash-alt"></i>
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                </form>
                <!-- Button -->
                <div class="tc margin-bottom-35">
                    <a href="javascript:void(0)" onclick="fnPopup('MemAddrPop_W')" class="popup-with-zoom-anim button ripple-effect margin-top-30">
                        배송지 신규 등록
                    </a>
                </div>
            </div>
            <!-- Tab / End -->
        </div>
    </div>
</body>
</html>