
<%@ page import="Member_Package.MemberDto" %>
<%@ page import="Member_Package.MemberDao" %>
<%@ page import="java.util.ArrayList"  %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>HyunWoo's Forum</title>
<link rel="stylesheet" href="style4.css" />

</head><body>
<section class="mblist-form">
<table width="600" cellpadding="0" cellspacing="0" border="1">
<h1>ȸ�� ��� ����</h1>
<tr><td width="70">���̵�</td>	<td width="70">�н�</td>
	<td width="70">�̸�</td>		<td width="140">�̸���</td>
	<td width="250">�ּ�</td>	</tr>
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
<tr> <td width="100"><%=id %></td><td width="100"><%=pw %></td> 
	<td width="100"><%=name %></td><td width="200"><%=email %></td>
	<td width="250"><%=address%></td></tr>	
<%
}	
%>
</table><br>
<% if(searchtf!=null){ %>

<h4><%=request.getParameter("search") %> �� 
<%=request.getParameter("search_text") %>�� �˻��� ���
 <%=MemberDao.COUNT %>���� �˻��Ǿ����ϴ�.</h4>

<%} %>

<form action="memberSelect.jsp" method="post">
<select name="search">
<option value="id">id</option>
<option value="name">name</option>
</select>
&nbsp;
<input type="text" name="search_text" size="20"/>&nbsp;
<input type="hidden" name="search_tf" value="true">
<input type="submit" value="�� ȸ">
</form>
</section>
</body></html>

<!-- �ҽ��� ���� ����̹� �ε��ϴ� �κе� ����, Ŀ�ؼ� ��ü ���ϴ� �κе� ����, �������� ����.  -->







<%-- 
<!-- �˻�, ��ȸ�ϱ��� �ҽ� --> 
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
 	Connection conn = null;
 	String sql="SELECT * FROM members";
 	
	try {
  		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/Oracle11g");
  		conn = ds.getConnection();
  		
  		PreparedStatement pstmt=conn.prepareStatement(sql);
  		ResultSet rs=pstmt.executeQuery();
		%>
		
		
		<table width="600" cellpadding="0" cellspacing="0" border="1">
		<caption>ȸ������Ʈ ���� </caption>  
		<tr>
			<td>���̵�</td>	<td>�н�</td><td>�̸�</td>	<td>�̸���</td>	<td>�ּ�</td>
		</tr>
				<%
  		while(rs.next()){ %>		
  			<tr> <td><%=rs.getString(1)%> </td> 
  			<td><%=rs.getString(2)%> </td> 
  			<td><%=rs.getString(3)%>    </td> 
  			<td><%=rs.getString(4)  %> </td>  
  			<td><%=rs.getString(6)  %> </td> </tr>	
  		<%	
  		}
		%>
		</table>
		
		
		<%
  		rs.close();
	}catch(Exception e){
		out.println("<h3>������ �������⿡ �����Ͽ����ϴ�.</h3>");
		e.printStackTrace();
 	}
%>
 
 --%>