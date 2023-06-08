<%@page import="Member_Package.MemberDto"%>
<%@page import="Member_Package.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
    /* 폼에서 입력 한 값을 받아 저장함  */
	String id = (String)session.getAttribute("id");
	String pw = request.getParameter("pw");
	
	MemberDao dao = MemberDao.getInstance();
	/*  MemberDao.getInstance(); 가보고 올 것  */
	int checkNum = dao.userCheck(id, pw);
	/* dao.userCheck(id, pw) 가 보고 올 것 */
	/* id와 pw를 가지고 dao.userCheck(id, pw)로 가서  
	체크하고 결과 값 반환 받음*/
	
	if(checkNum == 0) {  /* 리턴값에 따라 처리 pw 틀리면 */ 
%>
		<script language="javascript">
			alert("비밀번호가 틀립니다.");
			history.go(-1);
		</script>
<%
	} else if(checkNum == 1) {
		MemberDto dto = dao.getMember(id);  
		/* dao.getMember() 가 보고 올 것  */
		/*  호출 MemberDto.getMember(id) 호출하여 처리후 반환값 받음 */

			String name = dto.getName();
			int ri = dao.deleteMember(id);
			%>
			<script language="javascript">
				alert("삭제 되었습니다.");
				document.location.href="memberList.jsp";
			</script>
			<%		
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head><body>
</body></html>