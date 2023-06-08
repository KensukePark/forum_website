
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
<h1>회원 목록 보기</h1>
<tr><td width="70">아이디</td>	<td width="70">패스</td>
	<td width="70">이름</td>		<td width="140">이메일</td>
	<td width="250">주소</td>	</tr>
<%
MemberDao m_dao= MemberDao.getInstance();
// MemberDAO() 클래스를 이용하여 m_dao 객체 생성

String searchtf=request.getParameter("search_tf");
ArrayList<MemberDto> dtos=null;
if(searchtf!=null){
String search_op=request.getParameter("search");
String search_text=request.getParameter("search_text");
dtos = m_dao.getSearchList(search_op,search_text);
}else{
dtos=m_dao.getList();
}
// memberDAO 에 있는 getList() 를 실행하고 나서 
// ArrayList<MemberDto>	의 dtos 객체를 생성 후 
// memberDao.getList() 를 dtos 로 반환 받아 출력
for(int i=0; i<dtos.size(); i++) {  // dtos 를 size 만큼 for 문 돌림
MemberDto dto=dtos.get(i);  // dtos 의 i 번재 정보를 가져와 dto 에 저장
String name = dto.getName();  // dto의 name 추출하여 저장
String pw=dto.getPw();
String id = dto.getId();      // dto의 id 추출하여 저장
String email = dto.geteMail();      // dto의 email 추출하여 저장
String address = dto.getAddress();  // dto의 address 추출하여 저장
%>
<tr> <td width="100"><%=id %></td><td width="100"><%=pw %></td> 
	<td width="100"><%=name %></td><td width="200"><%=email %></td>
	<td width="250"><%=address%></td></tr>	
<%
}	
%>
</table><br>
<% if(searchtf!=null){ %>

<h4><%=request.getParameter("search") %> 로 
<%=request.getParameter("search_text") %>를 검색한 결과
 <%=MemberDao.COUNT %>건이 검색되었습니다.</h4>

<%} %>

<form action="memberSelect.jsp" method="post">
<select name="search">
<option value="id">id</option>
<option value="name">name</option>
</select>
&nbsp;
<input type="text" name="search_text" size="20"/>&nbsp;
<input type="hidden" name="search_tf" value="true">
<input type="submit" value="조 회">
</form>
</section>
</body></html>

<!-- 소스에 보면 드라이버 로드하는 부분도 없고, 커넥션 객체 구하는 부분도 없고, 쿼리문도 없다.  -->







<%-- 
<!-- 검색, 조회하기전 소스 --> 
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
		<caption>회원리스트 보기 </caption>  
		<tr>
			<td>아이디</td>	<td>패스</td><td>이름</td>	<td>이메일</td>	<td>주소</td>
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
		out.println("<h3>데이터 가져오기에 실패하였습니다.</h3>");
		e.printStackTrace();
 	}
%>
 
 --%>