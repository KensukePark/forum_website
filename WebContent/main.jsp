<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
   if(session.getAttribute("ValidMem") == null) {
      /* loginOk.jsp ����  ������ ����� ����
      yes �� �ƴϸ� �� �α����̹Ƿ� */
%>
   <jsp:forward page="login.jsp" />
<%
   }
     /*  �α��� �� ȸ���̸� �Ʒ��� ����  */
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
			<a href="modify.jsp">������������</a>
	    </div>
		<div class="caption2">
	        <a href="memberList.jsp">ȸ������Ʈ ����</a>
	    </div>
		<div class="caption3">
			<a href="memo.jsp">�Խ���</a>
	    </div>
		<div class="caption4">
	        <a href="memberDelete.jsp">ȸ��  Ż��</a>
	    </div>
	    <div class="caption5">
			<a href="logout.jsp">�α׾ƿ�</a>
		</div>

</form>
</section>
</body></html>