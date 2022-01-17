<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <script>
        function deleteCons(arg) {
            $.ajax({
               method: "post",
               url: "MemAddrPop_D",
               data: "no="+arg,
               success: function(data) {
                   if(data.trim() == 'success') {
                       alert("삭제되었습니다.");
                       fnPopup('MemAddrPop_L');
                   } else {
                       console.log(data);
                   }
               }
            });
        }
    </script>
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
                    <input type="hidden" name="cons_no">
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
                                    <a href="javascript:void(0)" onclick="fnMyAddrGet('${list.getCons_zip()}', '${list.getCons_addr()}', '${list.getCons_addr_det()}',
                                             '${list.getCons_nm_kr()}', '${list.getCons_nm_en()}', '${list.getMob_no()}', '${list.getPerson_ctms_no()}')">
                                        <span class="bookmark-icon"></span>
                                    </a>
                                    <!-- Buttons -->
                                    <div class="buttons-to-right">
                                        <a href="javascript:void(0)" onclick="fnPopup('MemAddrPop_E', '${list.getNo()}')" class="popup-with-zoom-anim button gray ripple-effect ico small" data-animation="ripple">
                                            <i class="fas fa-pen"></i>
                                        </a>
                                        <a href="javascript:void(0)" onclick="if(confirm('해당 배송지를 삭제하시겠습니까?')) { deleteCons('${list.getNo()}'); }" class="button gray ripple-effect ico small" data-animation="ripple">
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