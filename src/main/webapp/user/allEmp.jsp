<%@page import="kr.or.ddit.user.model.EmpVo"%>
<%@page import="kr.or.ddit.user.model.UserVo"%>
<%@page import="java.util.List"%>
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


<title>직원</title>

<%@include file="/common/common_lib.jsp"%>

<!-- Custom styles for this template -->

<link href="${pageContext.request.contextPath}/css/dashboard.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/blog.css" rel="stylesheet">
</head>

<body>

	<%@include file="/common/header.jsp"%>


	<div class="container-fluid">
		<div class="row">

			<div class="col-sm-3 col-md-2 sidebar">
				<%@include file="/common/left.jsp"%>
			</div>

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

				<table class="table table-striped">
					<tr>
						<td>사번</td>
						<td>직원 이름</td>
						<td>담당 직무</td>
						<td>입사일시</td>
					</tr>

					<%
					List<EmpVo> emps = (List<EmpVo>) request.getAttribute("List");
					%>

					<%
					for (int i = 0; i < emps.size(); i++) {
						EmpVo vo = emps.get(i);
					%>
					<tr>
						<td><%=vo.getEmpno()%></td>
						<td><%=vo.getEname()%></td>
						<td><%=vo.getJob()%></td>
						<td><%=vo.getHiredate()%></td>
					</tr>
					<%
					}
					%>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
