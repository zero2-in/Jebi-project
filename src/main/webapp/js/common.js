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