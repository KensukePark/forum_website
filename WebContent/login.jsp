<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <!-- �̹� ���ǰ��� �ִ� ����̸� �� �α����� ����̸� main.jsp �� ����-->
<% if(session.getAttribute("ValidMem") != null) { %>
	<jsp:forward page="main.jsp"></jsp:forward> 
	<!-- JSP �׼��±� �� �̿��� ������-->
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
            
	<!-- Ŭ�� �̺�Ʈ �߻��� window.location = 'join.jsp' �� ����  -->
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