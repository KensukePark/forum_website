
<%@ page import="Member_Package.MemberDto" %>
<%@ page import="Member_Package.MemberDao" %>
<%@ page import="java.util.ArrayList"  %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%  request.setCharacterEncoding("euc-kr");  %>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>HyunWoo's Forum</title>
<link rel="stylesheet" href="style4.css" />
<style>
h4{
color:red;
}
</style>
</head><body>
<section class="mblist-form">
<table width="600" cellpadding="0" cellspacing="0" border="1">
<h1> ȸ�� ��� ���� </h1>
<tr><td width="70">���̵�</td>	<td width="70">�н�</td>
	<td width="70">�̸�</td>		<td width="140">�̸���</td>
	<td width="250">�ּ�</td>	</tr></table>
<%
MemberDao m_dao= MemberDao.getInstance();
// MemberDAO() Ŭ������ �̿��Ͽ� m_dao ��ü ����

String searchtf=request.getParameter("search_tf");
ArrayList<MemberDto> dtos=null;
if(searchtf!=null){
String search_op=request.getParameter("search");
String search_text=request.getParameter("search_text");
dtos = m_dao.getSearchList(search_op,search_text);
}else{
dtos=m_dao.getList();
}
// memberDAO �� �ִ� getList() �� �����ϰ� ���� 
// ArrayList<MemberDto>	�� dtos ��ü�� ���� �� 
// memberDao.getList() �� dtos �� ��ȯ �޾� ���
for(int i=0; i<dtos.size(); i++) {  // dtos �� size ��ŭ for �� ����
MemberDto dto=dtos.get(i);  // dtos �� i ���� ������ ������ dto �� ����
String name = dto.getName();  // dto�� name �����Ͽ� ����
String pw=dto.getPw();
String id = dto.getId();      // dto�� id �����Ͽ� ����
String email = dto.geteMail();      // dto�� email �����Ͽ� ����
String address = dto.getAddress();  // dto�� address �����Ͽ� ����
%>

<table width="600" cellpadding="0" cellspacing="0" border="1">
<tr> <td width="70"><%=id %></td><td width="70"><%=pw %></td> 
	<td width="70"><%=name %></td><td width="140"><%=email %></td>
	<td width="250"><%=address%></td></tr>	
</table>
<%
}	
%>
<% if(searchtf!=null){ %>

<h4><%=request.getParameter("search") %> (��)�� 
<%=request.getParameter("search_text") %>�� �˻��� ���
 <%=MemberDao.COUNT %>���� �˻��Ǿ����ϴ�.</h4>
<%} %>
</form>
<a href="memberList.jsp">����Ʈ�� ���ư���</a>
</section>
</body></html>
