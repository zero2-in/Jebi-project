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
                        <div class="no-text"> 등록된 배송지 주소가 없습니다. </div>
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