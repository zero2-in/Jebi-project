<%@ page pageEncoding="UTF-8" %>
<html>
<head>

</head>
<body>
    <div class="container-agent popup">
        <ul class="popup-tabs-nav">
            <li class="active">
                <a href="#tab">비밀번호 변경</a>
            </li>
        </ul>
        <div class="popup-tabs-container">
            <!-- Tab -->
            <form method="post" name="frmPw" id="frmPw">
                <input type="hidden" name="sKind" id="sKind" value="P">
                <div class="popup-tab-content" id="tab">
                    <ul class="dashboard-box-list">
                        <li>
                            <div class="row">
                                <div class="col-xl-12 col-common">
                                    <div class="submit-field">
                                        <h5>기존 비밀번호</h5>
                                        <input type="password" name="PRE_MEM_PW" id="PRE_MEM_PW" maxlength="100" class="with-border">
                                    </div>
                                </div>
                                <div class="col-xl-12 col-common">
                                    <div class="submit-field">
                                        <h5>새 비밀번호</h5>
                                        <input type="password" name="MEM_PW" id="MEM_PW" maxlength="100" class="with-border">
                                        <div class="tip-text">
                                            <span>*</span>
                                            6~20자의 영문 소/대문자, 숫자, 특수문자를 활용하여 등록하십시오
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-12 col-common">
                                    <div class="submit-field">
                                        <h5>새 비밀번호 확인</h5>
                                        <input type="password" name="MEM_PW_RE" id="MEM_PW_RE" maxlength="100" class="with-border">
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <!-- Button -->
                    <div class="tc margin-bottom-35">
                        <a href="javascript:void(0)" onclick="fnMemPw_M();" class="button ripple-effect">수정 완료</a>
                    </div>
                </div>
            </form>
            <!-- Tab / End -->
        </div>
    </div>
</body>
</html>