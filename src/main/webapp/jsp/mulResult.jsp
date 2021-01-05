<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	첫번째 수 (start) : <%= session.getAttribute("start") %><br>
	두번째 수 (end) : <%= session.getAttribute("end") %><br>
	두 수의 곱 (mul) : <%= session.getAttribute("mul") %>
	
</body>
</html>