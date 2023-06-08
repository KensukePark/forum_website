
<%@ page import="Member_Package.MemoDto" %>
<%@ page import="Member_Package.MemoDao" %>
<%@ page import="java.util.ArrayList"  %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
String id = (String)session.getAttribute("id");
if ((session.getAttribute("id")==null)) {
out.println("<script>");
out.println("location.href='login.jsp'");
out.println("</script>");
}
%>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>HyunWoo's Forum</title>
<link rel="stylesheet" href="style3.css" />
</head>
<body>
<section class="forum-form">
<h1>게시판</h1>
<% 
if(id.equals("admin"))
{
	%>
	<table width="800" border="1">
<tr align=center>
	<td width="50">번호</td><td width="600">내용</td><td width="100">글쓴이</td><td width="50">관리</td></tr>
<%
MemoDao m_dao= MemoDao.getInstance();
// MemberDAO() 클래스를 이용하여 m_dao 객체 생성

ArrayList<MemoDto> dtos=null;
dtos=m_dao.getList();
// memberDAO 에 있는 getList() 를 실행하고 나서 
// ArrayList<MemberDto>	의 dtos 객체를 생성 후 
// memberDao.getList() 를 dtos 로 반환 받아 출력
for(int i=0; i<dtos.size(); i++) {  // dtos 를 size 만큼 for 문 돌림
MemoDto dto=dtos.get(i);  // dtos 의 i 번재 정보를 가져와 dto 에 저장
String namae = dto.getNamae();  // dto의 name 추출하여 저장
String title=dto.getTitle();
int num=dto.getNum();
%>
<tr align=center>
<td width="50"><%=num-1 %></td>
<td width="600"><%=title%></td>
<td width="100"><%=namae %></td>	
<td width=50><a href="memoDelete.jsp?num=<%=num %>">삭제</a></td></td>
</tr>	

<%
}
%>
</table>
<br>
<form name="memo" action="memo_ok.jsp" method="post">
<table border=1 width=800> 	
<tr><td width="50">글쓴이</td><td width = "10"><input type="text" style="border:0px transparent; background-color:transparent;" size=11 name="namae"/></td><td></td></tr>
<tr height = "100"><td width="50">내　용</td><td colspan="2"><input type="text" style="border:0px transparent; background-color:transparent;" size=115 name="title"/></td></tr>
<input type="hidden" name="an" value="">
     </table>
     <div class="btn-area" style="display: inline-block; margin: 10px;  float: right;">
     	<button type="submit">등록</button>
     </div>
     </form>
<%
}
else
{
	%>
		<table width="750" border="1">
<tr align=center>
	<td width="50">번호</td><td width="600">내용</td><td width="100">글쓴이</td></tr>
<%
MemoDao m_dao= MemoDao.getInstance();
// MemberDAO() 클래스를 이용하여 m_dao 객체 생성

ArrayList<MemoDto> dtos=null;
dtos=m_dao.getList();
// memberDAO 에 있는 getList() 를 실행하고 나서 
// ArrayList<MemberDto>	의 dtos 객체를 생성 후 
// memberDao.getList() 를 dtos 로 반환 받아 출력
for(int i=0; i<dtos.size(); i++) {  // dtos 를 size 만큼 for 문 돌림
MemoDto dto=dtos.get(i);  // dtos 의 i 번재 정보를 가져와 dto 에 저장
String namae = dto.getNamae();  // dto의 name 추출하여 저장
String title=dto.getTitle();
int num=dto.getNum();
%>
<tr align=center>
<td width="50"><%=num-1 %></td>
<td width="600"><%=title%></td></td>
<td width="100"><%=namae %></td>	

</tr>	



<%
}	
%>
</table>
<form name="memo" action="memo_ok.jsp" method="post">
<table border=1 width=750> 	
<tr><td width="50">글쓴이</td><td width = "10"><input type="text" style="border:0px transparent; background-color:transparent;" size=11 name="namae"/></td><td></td></tr>
<tr><td width="50">내　용</td><td colspan="2"><input type="text" style="border:0px transparent; background-color:transparent;" size=65 name="title"/></td></tr>
<input type="hidden" name="an" value="">
     </table>
     <div class="btn-area" style="display: inline-block; margin:10px;  float: right;">
     	<button type="submit">등록</button>
     </div>
</form>
</center>
<%
}
%>


<br>
</section>
</body></html>
