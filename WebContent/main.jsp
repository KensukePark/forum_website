<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
   if(session.getAttribute("ValidMem") == null) {
      /* loginOk.jsp 에서  지정된 결과에 따라
      yes 가 아니면 비 로그인이므로 */
%>
   <jsp:forward page="login.jsp" />
<%
   }
     /*  로그인 한 회원이면 아래로 수행  */
   String name = (String)session.getAttribute("name");
   String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="style2.css" />
<title>HyunWoo's Forum</title>
</head>
<body>
	<section class="main-form">
		<h1>Welcome! <%= name %></h1>
		<form action="logout.jsp" method="post">
		<div class="caption1">
			<a href="modify.jsp">개인정보수정</a>
	    </div>
		<div class="caption2">
	        <a href="memberList.jsp">회원리스트 보기</a>
	    </div>
		<div class="caption3">
			<a href="memo.jsp">게시판</a>
	    </div>
		<div class="caption4">
	        <a href="memberDelete.jsp">회원  탈퇴</a>
	    </div>
	    <div class="caption5">
			<a href="logout.jsp">로그아웃</a>
		</div>

</form>
</section>
</body></html>