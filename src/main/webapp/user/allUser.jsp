<%@page import="java.text.SimpleDateFormat"%>
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


<title>사용자</title>

<%@include file="/common/common_lib.jsp"%>

<!-- Custom styles for this template -->

<link href="<%=request.getContextPath()%>/css/dashboard.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/blog.css" rel="stylesheet">
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
						<td>사용자 아이디</td>
						<td>사용자 이름</td>
						<td>사용자 별명</td>
						<td>등록일시</td>
					</tr>

					<%
					List<UserVo> users = (List<UserVo>) request.getAttribute("List");
					%>

					<%
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
					
					for (int i = 0; i < users.size(); i++) {
						UserVo vo = users.get(i);
					%>
					<tr>
						<td><%=vo.getUserid()%></td>
						<td><%=vo.getUsernm()%></td>
						<td><%=vo.getAlias()%></td>
						<td><%=vo.getReg_dt_fmt()%></td>	
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
