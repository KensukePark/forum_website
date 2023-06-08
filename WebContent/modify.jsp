<%@page import="Member_Package.MemberDto"%>
<%@page import="Member_Package.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%  request.setCharacterEncoding("euc-kr"); 

String id = (String)session.getAttribute("id");
   // 유니크 한 id 값을 받아서 
MemberDao dao = MemberDao.getInstance();
   // 싱글턴 dao 객체 생성 후 
MemberDto dto = dao.getMember(id);
   // dao 객체 중애서 id 를 매개변수로 하여 getMember() 호출하여
   //  아디와 일치하는 사람 정보 가져옴 - 그 결과를 dto 에 저장 
%>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>개인정보 수정</title>
<link rel="stylesheet" href="style5.css" />
</head>
<body>
	<section class="modify-form">
	<h1>개인정보 수정</h1>
	<form action="modifyOk.jsp" method="post" name="reg_frm">
	<span style ="display:inline-block;width:120px;">아이디 </span><%= dto.getId() %><br />
	<span style ="display:inline-block;width:120px;">비밀번호</span><input type="password" name="pw" size="20"><br />
	<span style ="display:inline-block;width:120px;">비밀번호 확인 </span><input type="password" name="pw_check" size="20"><br />
	<span style ="display:inline-block;width:120px;">이름</span><%= dto.getName() %><br />
	<span style ="display:inline-block;width:120px;">메일</span><input type="text" name="eMail" size="20" value="<%= dto.geteMail() %>"><br />
	<span style ="display:inline-block;width:120px;">주소</span><input type="text" name="address" size="50" value="<%= dto.getAddress() %>"><br />
	<br>
	<button class="btn-area" type="submit">수정</button>
	<button class="btn-area"type="reset" onclick="javascript:window.location='login.jsp'">취소</button>
	</form>
	</section>
</body></html>