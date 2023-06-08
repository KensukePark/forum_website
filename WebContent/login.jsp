<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <!-- 이미 세션값이 있는 멤버이면 즉 로그인한 사람이면 main.jsp 로 가라-->
<% if(session.getAttribute("ValidMem") != null) { %>
	<jsp:forward page="main.jsp"></jsp:forward> 
	<!-- JSP 액션태그 를 이용한 포워딩-->
<% } %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head runat="server">
    <title>HyunWoo's Forum</title>
    <link rel="stylesheet" href="style.css" />
</head>
<body>
	<section class="login-form">
		<h1>LOGIN</h1>
		<form action="loginOk.jsp" method="post">
		<div class="int-area">
                <input type="text" name="id" id="id"
                    autocomplete="off" required="required" />
                <label for="id">USER NAME</label>
            </div>
            <div class="int-area">
                <input type="password" name="pw" id="pw" 
                    autocomplete="off" required="required" />
                <label for="pw">PASSWORD</label>
            </div>
            <div class="btn-area">
                <button type="submit" name="btn" id="btn">LOGIN</button>
            </div>
            
	<!-- 클릭 이벤트 발생시 window.location = 'join.jsp' 로 가라  -->
	</form>
	<div class="caption">
            <a href="join.jsp">Forgot Passwod?</a>
    </div>
	<div class="caption">
            <a href="join.jsp">Create Account</a>
    </div>
    
	</section>
</body>
</html>