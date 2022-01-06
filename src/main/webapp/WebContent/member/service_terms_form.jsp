<%@ page pageEncoding="UTF-8" %>
<html>
<head>
</head>
<body>
    <ul class="popup-tabs-nav">
        <li class="active">
            <a href="javascript:void(0)">
                <strong>이용약관</strong>
            </a>
        </li>
    </ul>
    <div class="popup-tabs-container">
        <!-- Tab -->
        <div class="popup-tab-content" id="tab">
            <!-- projects List Container -->
            <div class="compact-list-layout">
                <div class="padding-top-10 padding-right-10 padding-bottom-10 padding-left-10">
                   <%@ include file="service_terms.jsp" %>
                </div>
            </div>
        </div>
        <!-- Tab / End -->
    </div>
</body>
</html>