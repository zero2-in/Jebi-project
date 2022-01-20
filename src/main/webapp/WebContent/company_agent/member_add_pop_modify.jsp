<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <script>
        function goUpdate() {
            if(checkValue(frmMemAddrS.CONS_ZIP, "우편번호 검색을 해주세요.")) return;
            if(checkValue(frmMemAddrS.CONS_ADDR_DET, "상세주소를 입력해주세요.")) return;
            if(checkValue(frmMemAddrS.CONS_NM_KR, "한글 이름을 입력해주세요.")) return;
            if(checkValue(frmMemAddrS.CONS_NM_EN, "영문 이름을 입력해주세요.")) return;
            if(checkValue(frmMemAddrS.MOB_NO, "휴대전화 번호를 입력해주세요.")) return;
            if(onOnlyNum(frmMemAddrS.MOB_NO.value)) {
                alert("- 빼고 입력해주세요.")
                frmMemAddrS.MOB_NO.focus();
                return;
            }
            if(checkValue(frmMemAddrS.PERSON_CTMS_NO, "개인통관고유번호를 입력해주세요.")) return;

            if(confirm("배송지 주소를 수정하시겠습니까?")) {
                var cons_no = frmMemAddrS.cons_no.value;
                var cons_zip = frmMemAddrS.CONS_ZIP.value;
                var cons_ckbaseyn;
                if(frmMemAddrS.ckBASE_YN.checked) cons_ckbaseyn = frmMemAddrS.ckBASE_YN.value;
                var cons_addr = frmMemAddrS.CONS_ADDR.value;
                var cons_addr_det = frmMemAddrS.CONS_ADDR_DET.value;
                var cons_nm_kr = frmMemAddrS.CONS_NM_KR.value;
                var cons_nm_en = frmMemAddrS.CONS_NM_EN.value;
                var mob_no = frmMemAddrS.MOB_NO.value;
                var person_ctms_no = frmMemAddrS.PERSON_CTMS_NO.value;

                $.ajax({
                    type: "post",
                    url: "UpdateAddress",
                    data: "cons_no="+cons_no+"&cons_zip="+cons_zip+"&cons_ckbaseyn="+cons_ckbaseyn+"&cons_addr="+cons_addr+"&cons_addr_det="+cons_addr_det+"&cons_nm_kr="+cons_nm_kr+"&cons_nm_en="+cons_nm_en+"&mob_no="+mob_no+"&person_ctms_no="+person_ctms_no,
                    success: function (data) {
                        if(data.trim() == 'success') {
                            fnPopup('MemAddrPop_L');
                        } else {
                            console.log(data);
                        }
                    }
                });
            }
        }
    </script>
</head>
<body>
<div class="container-agent popup">
    <ul class="popup-tabs-nav">
        <li class="active">
            <a href="#tab">배송지등록</a>
        </li>
    </ul>
    <div class="popup-tabs-container">
        <!-- Tab -->
        <div class="popup-tab-content" id="tab">
            <div class="pd20">
                <!-- Form -->
                <form method="post" name="frmMemAddrS" id="frmMemAddrS">
                    <input type="hidden" name="cons_no" value="${dto.getNo()}">
                    <div class="row">
                        <div class="col-xl-12 col-common">
                            <div class="submit-field field-two">
                                <div class="field-block padding-right-10">
                                    <a href="javascript:void(0)" onclick="fnJusoSearch()" class="button gray ripple-effect fl">
                                        우편번호 검색
                                    </a>
                                </div>
                                <div class="clearfix"></div>
                                <div id="sTxtFindAddr"></div>
                            </div>
                            <!-- 우편번호 juso 끝 -->
                            <div class="submit-field">
                                <h5>주소</h5>
                                <input type="text" name="CONS_ZIP" id="CONS_ZIP" maxlength="10" placeholder="우편번호" class="with-border wd100 fl margin-right-10 gray-read" value="${dto.getCons_zip()}" readonly>
                                <div class="checkbox">
                                    <input type="checkbox" name="ckBASE_YN" id="ckBASE_YN" value="Y" <c:if test="${dto.getCons_ckbaseyn() eq 'Y'}">checked</c:if>>
                                    <label for="ckBASE_YN">
                                        <span class="checkbox-icon"></span>
                                        기본배송지
                                    </label>
                                </div>
                                <div class="clearfix"></div>
                                <input type="text" name="CONS_ADDR" id="CONS_ADDR" maxlength="100" placeholder="주소(한글)" class="with-border gray-read" value="${dto.getCons_addr()}" readonly>

                                <input type="text" name="CONS_ADDR_DET" maxlength="100" placeholder="상세(한글)" class="with-border" value="${dto.getCons_addr_det()}">

                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xl-12 col-common">
                            <div class="submit-field margin-bottom-0">
                                <h5>수취인 정보</h5>
                            </div>
                        </div>
                        <div class="col-xl-6 col-common">
                            <input type="text" name="CONS_NM_KR" maxlength="80" placeholder="이름(한글)" class="with-border" value="${dto.getCons_nm_kr()}" onblur="frmMemAddrS.CONS_NM_EN.value = this.value.romanize().toUpperCase();">
                        </div>
                        <div class="col-xl-6 col-common">
                            <input type="text" name="CONS_NM_EN" maxlength="80" placeholder="이름(영문)" class="with-border" value="${dto.getCons_nm_en()}">
                        </div>
                    </div>
                    <div class="input-with-icon-left" title="- 빼고 입력하세요.">
                        <i class="fas fa-phone"></i>
                        <input type="text" name="MOB_NO" maxlength="20" placeholder="휴대전화(- 제외)" class="input-text with-border" onblur="this.value=fnNumChk(this.value);" value="${dto.getMob_no()}">
                    </div>
                    <div class="radio-area margin-bottom-10">
                        <div class="radio">
                            <input type="radio" name="CTMS_DVS_CD" id="radio-1" value="1" checked>
                            <label for="radio-1">
                                <span class="radio-label"></span>
                                개인통관고유부호
                            </label>
                        </div>
                        <div class="radio">
                            <input type="radio" name="CTMS_DVS_CD" id="radio-2" value="2">
                            <label for="radio-2">
                                <span class="radio-label"></span>
                                사업자번호
                            </label>
                        </div>
                    </div>
                    <div title="개인통관고유부호 또는 사업자 번호 또는 여권번호">
                        <input type="text" name="PERSON_CTMS_NO" maxlength="20" placeholder="개인통관고유부호 또는 사업자 번호 또는 여권번호" class="with-border" value="${dto.getPerson_ctms_no()}">
                    </div>
                </form>
            </div>
            <!-- Button -->
            <div class="tc margin-bottom-35">
                <a href="javascript:void(0)" onclick="goUpdate()" class="button ripple-effect margin-top-30">
                    주소 수정
                </a>
                <a href="javascript:void(0)" onclick="fnPopup('MemAddrPop_L')" class="popup-with-zoom-anim button ripple-effect gray margin-top-30">
                    목록
                </a>
            </div>
        </div>
        <!-- Tab / End -->
    </div>
</div>
</body>
</html>