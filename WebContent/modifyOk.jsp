<%@page import="Member_Package.MemberDto"%>
<%@page import="Member_Package.MemberDao"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="Member_Package.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:useBean id="dto" class="Member_Package.MemberDto"/>
<!--  자바 빈을 사용하는데 이름을 dto 로 하겠다.   -->
<jsp:setProperty name="dto" property="*" />
<%
String id = (String)session.getAttribute("id");
dto.setId(id);
String pw = request.getParameter("pw");
dto.setPw(pw);
String pw2 = request.getParameter("pw_check");
String eMail = request.getParameter("eMail");
dto.seteMail(eMail);
String address = request.getParameter("address");
dto.setAddress(address);
%>

<%
if(pw.equals("") | pw2.equals(""))
{
	%>
	<script language="javascript">
			alert("비밀번호로 공백을 사용할수 없습니다.");
			history.go(-1);
	</script>
	<%
}
else if(pw.equals(pw2))
{
	MemberDao dao = MemberDao.getInstance();
	int ri = dao.updateMember(dto);
	%>
	<script language="javascript">
				alert("변경되었습니다");
				document.location.href="main.jsp";
			</script>
	<%
}
else if(!pw.equals(pw2))
{
	%>
	<script language="javascript">
				alert("비밀번호와 비밀번호 확인이 다릅니다.");
				history.go(-1);
				</script>
	<%
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>