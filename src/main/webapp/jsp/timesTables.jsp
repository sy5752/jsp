<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<table border="1"> 
<% for(int j =1; j<=9; j++){%>
	<tr>
	<% for(int i=2; i<=9; i++){%>
	<td><%=i%>  * <%=j %> = <%=i*j %></td>
			
	<%
	} 
	%>	
		</tr>
<%
} 
%>
<% for(int j =1; j<=9; j++){
	out.write("<tr>");
	 for(int i=2; i<=9; i++){
		out.write("<td>" + i +  " * " + j + "=" + i*j + "</td>");
			
	} 
		out.write("</tr>");

} %>	
	</table>
</body>
</html>