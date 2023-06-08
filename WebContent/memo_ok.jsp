<%@page import="java.sql.Timestamp"%>
<%@ page import="Member_Package.MemoDto" %>
<%@ page import="Member_Package.MemoDao" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
request.setCharacterEncoding("EUC-KR"); 

String namae = request.getParameter("namae");
String title = request.getParameter("title");
%>
<!-- 액션 태그 사용  -->
<jsp:useBean id="dto" class="Member_Package.MemoDto"/>
<!--  자바 빈을 사용하는데 이름을 dto 로 하겠다.   -->
<!--  * 는 모든 property를 한번에 set 하겠다.  -->
<!-- dto의 필드명과 가입폼의 name 값이 같을 때 일괄 set 하기 위해 사용  -->

<!-- UI 가 없는 대신에 많은 로직이 포함됨
여기서 회원 가입 처리를 하지 않고 Dao로 데이터를 보냈다가 
여기서는 반환 받아 결과만 처리  -->
<%
 /* 시간은 서버에서 알아서 처리 회원 가입시 시간 저장 dto의 setter 가보면 60-66 */
int temp = 50;
dto.setNamae(namae);
dto.setTitle(title);
MemoDao dao = MemoDao.getInstance();


			int ri = dao.insertMemo(dto);
			/* dao.insertMember() 가 보고 올 것*/
			out.println("<script>");
			out.println("location.href='memo.jsp'");
			out.println("</script>");
%>
			
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head><body>	</body></html>