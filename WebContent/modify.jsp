<%@page import="Member_Package.MemberDto"%>
<%@page import="Member_Package.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%  request.setCharacterEncoding("euc-kr"); 

String id = (String)session.getAttribute("id");
   // ����ũ �� id ���� �޾Ƽ� 
MemberDao dao = MemberDao.getInstance();
   // �̱��� dao ��ü ���� �� 
MemberDto dto = dao.getMember(id);
   // dao ��ü �߾ּ� id �� �Ű������� �Ͽ� getMember() ȣ���Ͽ�
   //  �Ƶ�� ��ġ�ϴ� ��� ���� ������ - �� ����� dto �� ���� 
%>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�������� ����</title>
<link rel="stylesheet" href="style5.css" />
</head>
<body>
	<section class="modify-form">
	<h1>�������� ����</h1>
	<form action="modifyOk.jsp" method="post" name="reg_frm">
	<span style ="display:inline-block;width:120px;">���̵� </span><%= dto.getId() %><br />
	<span style ="display:inline-block;width:120px;">��й�ȣ</span><input type="password" name="pw" size="20"><br />
	<span style ="display:inline-block;width:120px;">��й�ȣ Ȯ�� </span><input type="password" name="pw_check" size="20"><br />
	<span style ="display:inline-block;width:120px;">�̸�</span><%= dto.getName() %><br />
	<span style ="display:inline-block;width:120px;">����</span><input type="text" name="eMail" size="20" value="<%= dto.geteMail() %>"><br />
	<span style ="display:inline-block;width:120px;">�ּ�</span><input type="text" name="address" size="50" value="<%= dto.getAddress() %>"><br />
	<br>
	<button class="btn-area" type="submit">����</button>
	<button class="btn-area"type="reset" onclick="javascript:window.location='login.jsp'">���</button>
	</form>
	</section>
</body></html>