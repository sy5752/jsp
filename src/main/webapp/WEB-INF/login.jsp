<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>

	개인정보를 전송 하므로 url에 노출되지 않도록 request body 영역에 파라미터를 전송 ==> method="POST"
	<form action="<%= request.getContextPath() %>/loginController" method="post">
		user id : <input type="text" name="userid" value="brown"/><br>
<!-- 		user id : <input type="text" name="userid" value="sally"/><br> -->
		password : <input type="password" name="pass" value="qwe123"/><br>
		
		<input type="submit" value="전송">
	</form>

</body>

</html> --%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Signin Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
<%--     <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet"> --%>
    <%@ include file="/common/common_lib.jsp" %>
    <%-- common_lib.jsp의 내용을 지금 기술되는 부분에 코드를 복사해서 붙여 넣기 --%>
    
    
    <link href="<%=request.getContextPath()%>/css/signin.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">

  </head>

  <body>

    <div class="container">

      <form class="form-signin" action="<%=request.getContextPath()%>/loginController" method="post">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="userid" class="sr-only">userId</label>
        <input type="text" id="userid" class="form-control" placeholder="userid" required autofocus name="userid" value="brown">
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" name="pass" value="brownpass" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>

    </div> <!-- /container -->

  </body>
</html>
