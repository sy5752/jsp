<%@page import="kr.or.ddit.user.model.UserVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/common/common_lib.jsp"%>

<!-- Custom styles for this template -->

<link href="<%=request.getContextPath()%>/css/dashboard.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/blog.css" rel="stylesheet">

<script>
	/* 사용자 수정 : method - get action = /userModify
	사용자 삭제 : method - post action = /deleteUser
	파라미터는 둘다 userid 하나만 있으면 가능 */
// 문서 로딩이 완료되었을때
$(function () {
	$("#modifyBtn").on("click", function () {
		$("#frm").attr("method", "get");
		$("#frm").attr("action", "<%=request.getContextPath()%>/userModify");
		$("#frm").submit();
	});
	
	$("#deleteBtn").on("click", function () {
		$("#frm").attr("method", "post");
		$("#frm").attr("action", "<%=request.getContextPath()%>/deleteUser");
		$("#frm").submit();		
	});
	
})
</script>

</head>
<body>
	<%@ include file="/common/header.jsp" %>
	
	<div class="container-fluid">
		<div class="row">

			<div class="col-sm-3 col-md-2 sidebar">
				<%@ include file="/common/left.jsp" %>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="row">
					<div class="col-sm-8 blog-main">
						<h2 class="sub-header">사용자 상세조회</h2>
				
				<% UserVo user = (UserVo) request.getAttribute("user"); %>
				
				 <form class="form-horizontal" id="frm" role="form" > 
					<input type="hidden"  name="userid" value="<%=user.getUserid() %>"/>
					
					<div class="form-group">
						<label for="userid" class="col-sm-2 control-label">사용자 사진</label>
						<div class="col-sm-10">
							<img src="<%=request.getContextPath() %>/profile/<%=user.getUserid() %>.png"/>
							<%-- <label class="control-label"><%= user.getUserid() %></label> --%>
						</div>
					</div>
					<%-- <form class="form-horizontal" id="frm" role="form" > 
					<input type="hidden"  name="userid" value="<%=user.getUserid() %>"/> --%>
					
					<div class="form-group">
						<label for="userid" class="col-sm-2 control-label">사용자 아이디</label>
						<div class="col-sm-10">
							<label class="control-label"><%= user.getUserid() %></label>
						</div>
					</div>

				<!-- 	<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">사용자 아이디</label>
						<div class="col-sm-10">
							<label class="control-label">brown</label>
						</div>
					</div> -->
					
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">사용자 이름</label>
						<div class="col-sm-10">
							<label class="control-label"><%= user.getUsernm()%></label>
						</div>
					</div>
					
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label">비밀번호</label>
						<div class="col-sm-10">
							<label class="control-label">**********</label>
						</div>
					</div>

					<div class="form-group">
						<label for="reg_dt" class="col-sm-2 control-label">등록일시</label>
						<div class="col-sm-10">
							<label class="control-label"><%= user.getReg_dt_fmt() %></label>
						</div>
					</div>

					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">별명</label>
						<div class="col-sm-10">
							<label class="control-label"><%= user.getAlias() %></label>
						</div>
					</div>
					
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">도로주소</label>
						<div class="col-sm-10">
							<label class="control-label"><%=user.getAddr1() %></label>
						</div>
					</div>
					
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">상세주소</label>
						<div class="col-sm-10">
							<label class="control-label"><%=user.getAddr2() %></label>
						</div>
					</div>
					
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">우편코드 코드</label>
						<div class="col-sm-10">
							<label class="control-label"><%=user.getZipcode() %></label>
						</div>
					</div>

					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							
							<button type="button"  id="modifyBtn" class="btn btn-default">사용자 수정</button>
							<button type="button" id="deleteBtn" class="btn btn-default">사용자 삭제</button>
						</div>
					</div>
				</form>
			</div>
			</div>
			</div>
		</div>
	</div>

</body>
</html>