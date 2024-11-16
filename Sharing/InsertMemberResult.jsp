<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<body>

<%
	request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");   
	String password = request.getParameter("password");
	String	name = request.getParameter("name");

	String	joomin1 = request.getParameter("joomin1");
	String	joomin2 = request.getParameter("joomin2");
	String joomin = joomin1 + "-" + joomin2;

	String	birthYear = request.getParameter("birthYear");
	String	birthMonth = request.getParameter("birthMonth");
	String	birthDay = request.getParameter("birthDay");
	String	birth = birthYear + "-" +birthMonth + "-" + birthDay;
	String	solar = request.getParameter("solar");

	String	hp1 = request.getParameter("hp1");
	String	hp2 = request.getParameter("hp2");
	String	hp3 = request.getParameter("hp3");
	String	hp = hp1 + "-"+ hp2 + "-" + hp3;

	String	email1 = request.getParameter("email1");
	String	email2 = request.getParameter("email2");
	String	email = email1 + "-"+ email2 ;
			

try {
 	 String DB_URL="jdbc:mysql://localhost:3306/team";  
     String DB_ID="root";  
     String DB_PASSWORD="1234"; 
 	 
	 Class.forName("org.gjt.mm.mysql.Driver"); 
 	 Connection con = DriverManager.getConnection(DB_URL, DB_ID, DB_PASSWORD);

	 String jsql = "INSERT INTO member (memid, mempasswd, memname, ";
	 jsql = jsql + "membirth,memsolar, memphone, mememail) VALUES (?,?,?,?,?,?,?)";	

	 PreparedStatement pstmt  = con.prepareStatement(jsql);
	 pstmt.setString(1,id);
	 pstmt.setString(2,password);
	 pstmt.setString(3,name);
	 pstmt.setString(4,birth);
	 pstmt.setString(5,solar);
	 pstmt.setString(6,hp);
	 pstmt.setString(7,email);


	 pstmt.executeUpdate();
  } catch(Exception e) { 
		out.println(e);
}
%>

<center>
<br><br><br>
    <h3> 축하합니다.다음과 같이 회원 가입되었습니다! </h3><p>
	<br><br>
	<font> <b>[회원 가입 내역]</b></font><p>

	<table border=1 cellpadding=5   style="font-size:10pt;font-family:맑은 고딕">
	<tr>
		<td width=100>ID</td>
		<td width=200><%=id%></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><%=password%></td>
	</tr>
	<tr>
		<td>성명</td>
		<td><%=name%></td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td>
			<%=birth%>
		   (<%=solar%>)
			
		</td>
	</tr>
	<tr>
		<td>휴대폰번호</td>
		<td><%=hp%></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><%=email%></td>
	</tr>


	</table>
	<p>
<br>
 <a href="Login.jsp" >로그인</a>

</center>
</body>
</html>