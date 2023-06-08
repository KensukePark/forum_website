<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>HyunWoo's Forum</title>
<link rel="stylesheet" href="style4.css" />
</head>
<body>
	<section class="mblist-form">
	<h1>회원 가입</h1>
    <!--   회원 가빙 버튼을 클릭하면 입력한 정보들이 request 객체에 담겨 joinOk.jsp 로 전달되어 옴 -->
	<form action="joinOk.jsp" method="post" name="reg_frm">
		<span style="display:inline-block;width:120px;">아이디</span><input type="text" style="background-color:transparent;" name="id" size="20"><br />
		<span style="display:inline-block;width:120px;">비밀번호</span><input type="password" style="background-color:transparent;" name="pw" size="20"><br />
		<span style="display:inline-block;width:120px;">비밀번호 확인</span><input type="password" style="background-color:transparent;" name="pw_check" size="20"><br />
		<span style="display:inline-block;width:120px;">이름</span><input type="text" style="background-color:transparent;" name="name" size="20"><br />
		<span style="display:inline-block;width:120px;">메일</span><input type="text" style="background-color:transparent;" name="eMail" size="20"><br />
		<span style="display:inline-block;width:120px;">주소</span><input type="text" style="background-color:transparent;" name="address" size="50"><br />
		<button class="btn-area" type="submit">회원가입</button>&nbsp;&nbsp; 
		<button class="btn-area" type="reset" onclick="javascript:window.location='login.jsp'">돌아가기</button>
		 <!-- 자바 스크립트의 onclick 이벤트 사용하여 호출 --> 
	</form>  
	</section>
</body>
</html>
