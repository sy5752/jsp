
<%@page import="kr.or.ddit.common.model.PageVo"%>
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

<script>
//문서 로딩이 완료되고나서 실행되는 영역
$(function() {
	$(".user").on("click", function() {
		// this : 클릭 이벤트가 발생한 element
		// data-속성명 data-userid, 속성명은 대소문자 무시하고 소문자로 인식
		// data-userId ==> data-userid
		var userid = $(this).data("userid");
		$("#userid").val(userid);
		$("#frm").submit();
	});
})
</script>
</head>

<body>
	
	<form id="frm" action="<%=request.getContextPath()%>/user">
		<input type="hidden" id="userid" name="userid" value=""/>
	</form>
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
					<tr class="user" data-userid="<%=vo.getUserid()%>">
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

						<a class="btn btn-default pull-right" href="/user/registerUser.jsp">사용자 등록</a>
	
				<div class="text-center">
							<% PageVo pageVo  = (PageVo)request.getAttribute("pageVo");
							   int pagination =	(int)request.getAttribute("pagination");%>
							<ul class="pagination">
								
								<%-- pagination 값이 4이므로 1부터 4까지 4번 반복된다
								     전체 사용자수 : 16명
								     페이지 사이즈 : 5
								     전체 페이지 수 : 4페이지
								 --%> 
								 <li class="prev">
									<a href="<%=request.getContextPath() %>/pagingUser?page=1&pageSize=<%=pageVo.getPageSize()%>">«</a>
								</li>
								<%for(int i = 1; i <= pagination; i++){
									
									if(pageVo.getPage() == i){%>
										<li class="active"><span><%=i %></span></li>
									<%}
									else {%>
										<li><a href="<%=request.getContextPath() %>/pagingUser?page=<%=i %>&pageSize=<%=pageVo.getPageSize()%>"><%=i %></a></li>
									<%} %>
								<%} %>
								<li class="next">
									<a href="<%=request.getContextPath() %>/pagingUser?page=<%=pagination %>&pageSize=<%=pageVo.getPageSize()%>">»</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
		
</body>
</html>