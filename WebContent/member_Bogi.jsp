
 <%@ page import="Member_Package.MemberDto" %>
<%@ page import="Member_Package.MemberDao" %>
<%@ page import="java.util.ArrayList"  %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
MemberDao m_dao= MemberDao.getInstance();
// MemberDAO() Ŭ������ �̿��Ͽ� m_dao ��ü ����
ArrayList<MemberDto> dtos=m_dao.getList();
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
%></body></html>

<!-- �ҽ��� ���� ����̹� �ε��ϴ� �κе� ����, Ŀ�ؼ� ��ü ���ϴ� �κе� ����, �������� ����.  --> 