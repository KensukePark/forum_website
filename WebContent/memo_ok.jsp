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
<!-- �׼� �±� ���  -->
<jsp:useBean id="dto" class="Member_Package.MemoDto"/>
<!--  �ڹ� ���� ����ϴµ� �̸��� dto �� �ϰڴ�.   -->
<!--  * �� ��� property�� �ѹ��� set �ϰڴ�.  -->
<!-- dto�� �ʵ��� �������� name ���� ���� �� �ϰ� set �ϱ� ���� ���  -->

<!-- UI �� ���� ��ſ� ���� ������ ���Ե�
���⼭ ȸ�� ���� ó���� ���� �ʰ� Dao�� �����͸� ���´ٰ� 
���⼭�� ��ȯ �޾� ����� ó��  -->
<%
 /* �ð��� �������� �˾Ƽ� ó�� ȸ�� ���Խ� �ð� ���� dto�� setter ������ 60-66 */
int temp = 50;
dto.setNamae(namae);
dto.setTitle(title);
MemoDao dao = MemoDao.getInstance();


			int ri = dao.insertMemo(dto);
			/* dao.insertMember() �� ���� �� ��*/
			out.println("<script>");
			out.println("location.href='memo.jsp'");
			out.println("</script>");
%>
			
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head><body>	</body></html>