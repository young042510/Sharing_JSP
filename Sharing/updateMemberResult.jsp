<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
	<head><title>ȸ�� ���� ���� �Ϸ�</title></head>
	<body>

<%
	 request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");
	String	passwd = request.getParameter("passwd");
	String	name = request.getParameter("name");

	String birthYear = request.getParameter("birthYear");
	String birthMonth = request.getParameter("birthMonth");
	String birthDay = request.getParameter("birthDay");
	String birth = birthYear + "-" + birthMonth + "-" + birthDay;

	String	solar = request.getParameter("solar");

	String	hp1 = request.getParameter("hp1");
	String	hp2 = request.getParameter("hp2");
	String	hp3 = request.getParameter("hp3");
	String phone = hp1+"-"+hp2+"-"+hp3;
	String email = request.getParameter("email");

try {
 	 String DB_URL="jdbc:mysql://localhost:3306/team";
     String DB_ID="root";  
     String DB_PASSWORD="1234";
 	 
	 Class.forName("org.gjt.mm.mysql.Driver");  
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	 String jsql = "update member set mempasswd=?, memname=?, ";
	 jsql = jsql + "membirth=?, memsolar=?, ";
	 jsql = jsql + "mememil=? where memid=? ";	
	 PreparedStatement pstmt = con.prepareStatement(jsql);
	 pstmt.setString(1,passwd);
	 pstmt.setString(2,name);
	 pstmt.setString(3,birth);
	 pstmt.setString(4,solar);
	 pstmt.setString(5,phone);
	 pstmt.setString(7,email);
	 pstmt.setString(8,id);

	 pstmt.executeUpdate();  //  ������ �ۼ��� SQL��(update��)�� �����Ŵ
	                                            //   �� ���� �Ϸ��� ����, ������ DB�� ���ڵ������� ������


     //  �� ���� �κ� ������ DB�� ������Ų �ش� ���ڵ������� ��ȸ�� ��, 
	 //  �ش� ������ ���������� ������ִ� �ڵ忡 �ش��
	 String jsql2 = "select * from member where memid=?";
	 PreparedStatement pstmt2 = con.prepareStatement(jsql2);
	 pstmt2.setString(1,id);

	 ResultSet rs = pstmt2.executeQuery();
	 rs.next();  //  next()�Լ��� ó�� �����ϸ�, ù��° ���ڵ�(��, ������Ų ���ڵ�)�� ����Ű�� ��
%>
<center>
<br><br><br>
<font><b>[������ ȸ�� ���� ����]</b></font><p>
	<table border=1 cellpadding=5>
		<tr>
			<td width=100>ID</td>
			<td width=300><%=rs.getString("memid")%></td>
		</tr>
		<tr>
			<td>��й�ȣ</td>
			<td><%=rs.getString("mempasswd")%></td>
		</tr>
		<tr>
			<td>����</td>
			<td><%=rs.getString("memname")%></td>
		</tr>
		<tr>
			<td>����</td>
			<td><%=rs.getDate("membirth")%> (<%=rs.getString("memsolar")%>)</td>
		</tr>
		<tr>
			<td>�޴���</td>
			<td><%=rs.getString("memPhone")%></td>
		</tr>
		<tr>
			<td>�̸���</td>
			<td><%=rs.getString("mememil")%></td>
		</tr>
	</table>
<%
    } catch (Exception e) {
    	out.println(e);
}
%>
<p>
 <br>
</center>
</body>
</html>