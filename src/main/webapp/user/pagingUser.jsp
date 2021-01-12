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
					List<UserVo> paging = (List<UserVo>) request.getAttribute("List");
					%>

					<%
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
					
					for (int i = 0; i < paging.size(); i++) {
						UserVo vo = paging.get(i);
					
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

						<a class="btn btn-default pull-right">사용자 등록</a>

						<div class="text-center">
							 
							<ul class="pagination">
								
								
								<!-- pagination 값이 4이므로 1부터 4까지 4번 반복된다 
									 전체 사용자수 : 16명
									 페이지 사이즈 : 5
									 전체 페이지 수  : 4page
								-->
								<%for(int i = 1; i<=(int)request.getAttribute("pagination"); i++){ %>
									<li><a href="<%=request.getContextPath() %>/pagingUser?page=<%=i %>&pageSize=5"><%=i %></a></li>
								<%} %>
								
								
							</ul>
						</div>
					</div>
				</div>
		
</body>
</html>