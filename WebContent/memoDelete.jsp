<%@page import="Member_Package.MemoDto"%>
<%@page import="Member_Package.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	int num=Integer.parseInt(request.getParameter("num"));
    /* 폼에서 입력 한 값을 받아 저장함  */
	
	MemoDao dao = MemoDao.getInstance();


	int ri = dao.deleteMemo(num);
			%>
			<script language="javascript">
				alert("삭제 되었습니다.");
				document.location.href="memo.jsp";
			</script>

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head><body>
</body></html>