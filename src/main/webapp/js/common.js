function checkValue(arg, msg) {
    var argVal = arg.value;

    if(argVal.trim() == '') {
        alert(msg);
        arg.focus();
        return true;
    } else {
        return false;
    }
}

// 아이디 입력시에 영문 숫자만 쓰도록
function onOnlyAlphaNumber(obj) {
    var inText = obj;
    var deny_char = /^[A-Za-z0-9]+$/;

    if(deny_char.test(inText)) {
        return false;
    }

    return true;
}

// 이름 입력시에 한글 및 영어만 쓰도록
function onOnlyHan(obj) {
	var inText = obj;

	var deny_char = /^[ㄱ-ㅎ|가-힣|\*]+$/

	if (deny_char.test(inText)) {
		return false;
	}
	return true;

}

function onOnlyEng(obj) {
	var inText = obj;

	var deny_char = /^[a-z|A-Z|\*]+$/

	if (deny_char.test(inText)) {
		return false;
	}
	return true;

}

function onOnlyNum(obj) {
    var inText = obj;

	var deny_char = /^[0-9\*]+$/

	if (deny_char.test(inText)) {
		return false;
	}
	return true;
}

// 이메일 형식 체크
function isEmail(strEmail) {
	var pattern = /^([\w]{1,})+[\w\.\-\_]+([\w]{1,})+@(?:[\w\-]{2,}\.)+[a-zA-Z]{2,}$/;

	var bChecked = !pattern.test(strEmail);

	return bChecked;
}

function fnPopup(siteSrc) {
	$.ajax({
		type: "post",
		url: siteSrc,
		success: function (data) {
			$("#small-dialog #dialog-cont").html(data);
		}
	});
}

function fnPopup(siteSrc, arg) {
	$.ajax({
		type: "post",
		url: siteSrc,
		data: "cons_no="+arg,
		success: function (data) {
			$("#small-dialog #dialog-cont").html(data);
		}
	});
}

// Daum 주소 찾기 API
function fnJusoSearch() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.roadAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if(data.userSelectedType === 'R'){
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if(data.buildingName !== '' && data.apartment === 'Y'){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if(extraAddr !== ''){
					extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				//document.getElementById("sample6_extraAddress").value = extraAddr;

			} else {
				//document.getElementById("sample6_extraAddress").value = '';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			frmMemAddrS.CONS_ZIP.value = data.zonecode;
			frmMemAddrS.CONS_ADDR.value = addr;
			// 커서를 상세주소 필드로 이동한다.
			frmMemAddrS.CONS_ADDR_DET.focus();
		}
	}).open();
}

function jusoSearch() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.roadAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if(data.userSelectedType === 'R'){
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if(data.buildingName !== '' && data.apartment === 'Y'){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if(extraAddr !== ''){
					extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				//document.getElementById("sample6_extraAddress").value = extraAddr;

			} else {
				//document.getElementById("sample6_extraAddress").value = '';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			board.t_zip.value = data.zonecode;
			board.t_address_1.value = addr;
			// 커서를 상세주소 필드로 이동한다.
			board.t_address_2.focus();
		}
	}).open();
}

function fnMyAddrGet(arg0, arg1, arg2, arg3, arg4, arg5, arg6) {
	board.t_zip.value = arg0;
	board.t_address_1.value = arg1;
	board.t_address_2.value = arg2;
	board.t_kor_name.value = arg3;
	board.t_eng_name.value = arg4;
	board.t_mobile.value = arg5;
	board.person_ctms_no.value = arg6;
	$.magnificPopup.close();
}