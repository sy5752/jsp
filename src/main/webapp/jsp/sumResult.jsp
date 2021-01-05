<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	첫번째 수(Start) : <%= session.getAttribute("start") %> <br>
	두번째 수(End) : <%= session.getAttribute("end") %> <br>
	두 수의 사이의 값의 합(Sum) : <%=session.getAttribute("sum") %>

</body>
</html>