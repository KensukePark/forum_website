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
	<h1>ȸ�� ����</h1>
    <!--   ȸ�� ���� ��ư�� Ŭ���ϸ� �Է��� �������� request ��ü�� ��� joinOk.jsp �� ���޵Ǿ� �� -->
	<form action="joinOk.jsp" method="post" name="reg_frm">
		<span style="display:inline-block;width:120px;">���̵�</span><input type="text" style="background-color:transparent;" name="id" size="20"><br />
		<span style="display:inline-block;width:120px;">��й�ȣ</span><input type="password" style="background-color:transparent;" name="pw" size="20"><br />
		<span style="display:inline-block;width:120px;">��й�ȣ Ȯ��</span><input type="password" style="background-color:transparent;" name="pw_check" size="20"><br />
		<span style="display:inline-block;width:120px;">�̸�</span><input type="text" style="background-color:transparent;" name="name" size="20"><br />
		<span style="display:inline-block;width:120px;">����</span><input type="text" style="background-color:transparent;" name="eMail" size="20"><br />
		<span style="display:inline-block;width:120px;">�ּ�</span><input type="text" style="background-color:transparent;" name="address" size="50"><br />
		<button class="btn-area" type="submit">ȸ������</button>&nbsp;&nbsp; 
		<button class="btn-area" type="reset" onclick="javascript:window.location='login.jsp'">���ư���</button>
		 <!-- �ڹ� ��ũ��Ʈ�� onclick �̺�Ʈ ����Ͽ� ȣ�� --> 
	</form>  
	</section>
</body>
</html>
