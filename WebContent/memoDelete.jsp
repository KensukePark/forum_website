<%@page import="Member_Package.MemoDto"%>
<%@page import="Member_Package.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	int num=Integer.parseInt(request.getParameter("num"));
    /* ������ �Է� �� ���� �޾� ������  */
	
	MemoDao dao = MemoDao.getInstance();


	int ri = dao.deleteMemo(num);
			%>
			<script language="javascript">
				alert("���� �Ǿ����ϴ�.");
				document.location.href="memo.jsp";
			</script>

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head><body>
</body></html>