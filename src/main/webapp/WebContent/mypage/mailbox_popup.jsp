<%@ page pageEncoding="UTF-8" %>
<html>
<head>
   
</head>
<body>
    <div class="container-agent popup">
        <ul class="popup-tabs-nav">
            <li class="active">
                <a href="javascript:void(0)">받은쪽지</a>
            </li>
        </ul>
        <div class="popup-tabs-container">
            <!-- Tab -->
            <div class="popup-tab-content" id="tab">
                <div class="pd20">
                    <div class="welcome-text padding-top-20 padding-bottom-10">
                        <h4 name="SBJ">${dto.getTitle()}</h4>
                        <span name="CONT">
                            ${dto.getContent()}
                        </span>
                    </div>
                </div>
            </div>
            <!-- Tab / End -->
        </div>
    </div>
</body>
</html>