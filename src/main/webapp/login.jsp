<%@page import="kr.or.ddit.login.web.LoginController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>Signin Template for Bootstrap</title>


<%@include file="/common/common_lib.jsp"%>
<!-- common_lib.jsp의 내용을 지금 기술되는 부분에 코드를 복사해서 붙여넣기 -->

<script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>

<!-- Custom styles for this template -->
<link href="${cp}/css/signin.css" rel="stylesheet">
<script>
	//public static String getCookieValues(String cookieStr, String cookieName){		
	//}
	
	
	function getCookieValue(cookieStr, cookieName) {
		console.log("getCookieValue");
		
		// String[] cookies = cookieStr.split("; ");
		var cookies = cookieStr.split("; ");
	
		// for(String cookieString : cookies){
			for(var i in cookies){
				
			var cookie = cookies[i].split("=");
			
		// if(cookie[0].equals(cookieName)) {
		//		return cookie[1];
		
		if(cookie[0] == (cookieName)) {
				return cookie[1];
		
			}
		}
		return "";
	}
	// cookieName : 추가하고자 하는 쿠키이름
	// cookieValue : 쿠키의 값
	// exprires : 유효기간(일수)
	function addCookie(cookieName, cookieValue, expires) {
		var dt = new Date(); // 현재 날짜 ==> expries 만큼 미래 날짜로 변경
		dt.setDate(dt.getDate() + parseInt(expires));
		console.log(dt);
	
		document.cookie = cookieName + "=" + cookieValue + "; " +
							"path=/; expires=" + dt.toGMTString();
	}
	
	function deleteCookie(cookieName) {
		addCookie(cookieName, "", -1);
	}

	//brown
	//var cookieValue = getCookieValue(document.cookie, "userid");
	//console.log(cookieValue);
	//getCookieValue(document.cookie, "brown");
	
	// html문서 로딩이 완료되고나서 실행되는 코드
	$(function () {
	//userid, rememberme 쿠키를 확인하여 존재할 경우 값설정, 체크
		
		//방법 1
		$("#userid").val(Cookies.get("userid"));
		if(Cookies.get("rememberme")=="Y"){
			$("#rememberme").attr("checked", true);
			
		}
		//쌤코드 방법2
		
		// if(Cookies.get("userid") != undefined){
		// $("#userid").val(Cookies.get("userid"));
		// $("#rememberme").prop("checked", true);
	    // }

	// signin 아이디를 select
		$("#signin").on("click", function () {
			// rememberme 체크박스가 체크되어있는지 확인
			// 체크되어있을 경우
			if($("#rememberme").is(":checked") == true){
				// userid input에 있는 값을 userid쿠키로 저장
				// rememberme 쿠키로 Y값을 저장
				Cookies.set("userid", $("#userid").val());
				
				// rememberme 쿠키로 Y값을 저장
				Cookies.set("rememberme", "Y");
			}
			// 체크 해제되어 있는 경우 : 더이상 사용하지 않는다는 의미이므로 userid, rememberme 쿠키 삭제
			else{
				Cookies.remove("userid");
				Cookies.remove("rememberme");
				
			}
			// form태그를 이용하여 signin 요청
			$("#frm").submit();
					
		});
		
	});
</script>
</head>

<body>

	<div class="container">
		cp: ${cp } / <%=application.getAttribute("cp") %>
		<%-- UNT_CD : ${param.UNT_CD }/ <%=request.getParameter("UNT_CD") %> --%>

		<form class="form-signin" id="frm" action="${cp}/loginController" method="post">
			<h2 class="form-signin-heading">Please sign in</h2>
			<label for="userid" class="sr-only">userid</label> 
			<input type="text" id="userid" class="form-control"placeholder="사용자 아이디" required autofocus name="userid"> 
			<label for="inputPassword" class="sr-only">Password</label> 
			<input type="password" id="inputPassword" class="form-control" name="pass" placeholder="Password"  required>
			<div class="checkbox">
				<label> <input type="checkbox" id="rememberme" value="remember-me">Remember me</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="button" id="signin">Sign in</button>
		</form>

	</div>
	<!-- /container -->


	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
