
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
<h1>�Խ���</h1>
<% 
if(id.equals("admin"))
{
	%>
	<table width="800" border="1">
<tr align=center>
	<td width="50">��ȣ</td><td width="600">����</td><td width="100">�۾���</td><td width="50">����</td></tr>
<%
MemoDao m_dao= MemoDao.getInstance();
// MemberDAO() Ŭ������ �̿��Ͽ� m_dao ��ü ����

ArrayList<MemoDto> dtos=null;
dtos=m_dao.getList();
// memberDAO �� �ִ� getList() �� �����ϰ� ���� 
// ArrayList<MemberDto>	�� dtos ��ü�� ���� �� 
// memberDao.getList() �� dtos �� ��ȯ �޾� ���
for(int i=0; i<dtos.size(); i++) {  // dtos �� size ��ŭ for �� ����
MemoDto dto=dtos.get(i);  // dtos �� i ���� ������ ������ dto �� ����
String namae = dto.getNamae();  // dto�� name �����Ͽ� ����
String title=dto.getTitle();
int num=dto.getNum();
%>
<tr align=center>
<td width="50"><%=num-1 %></td>
<td width="600"><%=title%></td>
<td width="100"><%=namae %></td>	
<td width=50><a href="memoDelete.jsp?num=<%=num %>">����</a></td></td>
</tr>	

<%
}
%>
</table>
<br>
<form name="memo" action="memo_ok.jsp" method="post">
<table border=1 width=800> 	
<tr><td width="50">�۾���</td><td width = "10"><input type="text" style="border:0px transparent; background-color:transparent;" size=11 name="namae"/></td><td></td></tr>
<tr height = "100"><td width="50">������</td><td colspan="2"><input type="text" style="border:0px transparent; background-color:transparent;" size=115 name="title"/></td></tr>
<input type="hidden" name="an" value="">
     </table>
     <div class="btn-area" style="display: inline-block; margin: 10px;  float: right;">
     	<button type="submit">���</button>
     </div>
     </form>
<%
}
else
{
	%>
		<table width="750" border="1">
<tr align=center>
	<td width="50">��ȣ</td><td width="600">����</td><td width="100">�۾���</td></tr>
<%
MemoDao m_dao= MemoDao.getInstance();
// MemberDAO() Ŭ������ �̿��Ͽ� m_dao ��ü ����

ArrayList<MemoDto> dtos=null;
dtos=m_dao.getList();
// memberDAO �� �ִ� getList() �� �����ϰ� ���� 
// ArrayList<MemberDto>	�� dtos ��ü�� ���� �� 
// memberDao.getList() �� dtos �� ��ȯ �޾� ���
for(int i=0; i<dtos.size(); i++) {  // dtos �� size ��ŭ for �� ����
MemoDto dto=dtos.get(i);  // dtos �� i ���� ������ ������ dto �� ����
String namae = dto.getNamae();  // dto�� name �����Ͽ� ����
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
<tr><td width="50">�۾���</td><td width = "10"><input type="text" style="border:0px transparent; background-color:transparent;" size=11 name="namae"/></td><td></td></tr>
<tr><td width="50">������</td><td colspan="2"><input type="text" style="border:0px transparent; background-color:transparent;" size=65 name="title"/></td></tr>
<input type="hidden" name="an" value="">
     </table>
     <div class="btn-area" style="display: inline-block; margin:10px;  float: right;">
     	<button type="submit">���</button>
     </div>
</form>
</center>
<%
}
%>


<br>
</section>
</body></html>
