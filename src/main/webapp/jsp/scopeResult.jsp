<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	var test = "<%= application.getAttribute("application")%>";
	var test = "sally_application";
	
	<%-- <%String a%> = test; --%>
	
	<%-- 클라이언트에서는 서버 사이드 변수 값을 활용할수 있으나 서버 사이드 변수에 클라이언트
		사이도 변수 값을 대입할 수는 없다--%>
</script>
</head>
<body>
	request : <%= request.getAttribute("request") %>  <br>
	session : <%= session.getAttribute("session") %> <br>
	application : <%= application.getAttribute("application") %>  <br>

</body>
</html>