var naverLogin = new naver.LoginWithNaverId(
    {
        clientId: "h7lrKULKMeSh_QPm3QPL", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
        callbackUrl: "http://192.168.0.43:8080/jebi/NaverLogin", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
        isPopup: true,
        callbackHandle: true
    }
);	

naverLogin.init();

window.addEventListener('load', function () {
    naverLogin.getLoginStatus(function (status) {
        if (status) {
            var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
            
            console.log(naverLogin.user); 
            
            if( email == undefined || email == null) {
                alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
                naverLogin.reprompt();
                return;
            }
        } else {
            console.log("callback 처리에 실패하였습니다.");
        }
    });
});