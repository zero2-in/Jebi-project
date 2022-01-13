<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>제비 - 배송대행</title>
</head>
<body>
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
    <script src="js/jquery-3.6.0.min.js"></script>
    <form action="Member" name="board" method="post">
        <input type="hidden" name="separate" value="naverSave">
        <input type="hidden" name="n_id">
        <input type="hidden" name="n_email">
        <input type="hidden" name="n_name">
        <input type="hidden" name="n_mobile">
    </form>
    <script>
        var naverLogin = new naver.LoginWithNaverId( { 
             clientId: "h7lrKULKMeSh_QPm3QPL", // 내꺼 
             callbackUrl: "http://192.168.0.43:8080/jebi/NaverLogin",
             isPopup: true, 
             callbackHandle: true /* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */ 
        } ); /* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */ 
        
        naverLogin.init(); /* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */ 
        window.addEventListener('load', function () {
            naverLogin.getLoginStatus(function (status) {
                if (status) { 
                    /* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
                    // 유저 아이디, 이메일 주소, 이름을 Session에 저장하였습니다. 
                    sessionStorage.setItem("user_info",naverLogin.user.id); 
                    board.n_id.value = naverLogin.user.getId();
                    board.n_email.value = naverLogin.user.getEmail();
                    board.n_name.value = naverLogin.user.getName();
                    board.n_mobile.value = naverLogin.user.getMobile();
                    board.submit();

                } else {
                    console.log("callback 처리에 실패하였습니다."); 
                } 
            }); 
        });
    </script>
</body>
</html>