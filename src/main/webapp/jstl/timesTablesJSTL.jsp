<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단</title>
<style>
	table{
		width : 100%;
	}
</style>
</head>
<body>
	표현식, 스크립틀릿을 EL, JSTL로 변경
	<table border="1">
		<c:forEach begin="1" end="9" var="j">

			<tr>
				<c:forEach begin="2" end="9" var="i">
					<td>${i}*${j}=${i*j}</td>

				</c:forEach>
			</tr>
		</c:forEach>
		
		
		<%-- 	<% for(int j =1; j<=9; j++){%>
	</tr>
	<% for(int i=2; i<=9; i++){%>
	<td><%=i%>  * <%=j %> = <%=i*j %></td>
			
	<%
	} 
	%>	
		
<%
} 
%> --%>



		<%-- <% for(int j =1; j<=9; j++){
	out.write("<tr>");
	 for(int i=2; i<=9; i++){
		out.write("<td>" + i +  " * " + j + "=" + i*j + "</td>");
			
	} 
		out.write("</tr>");

} %>	 --%>
	</table>
</body>
</html>